import 'dart:convert';

import 'package:bookapp/data/models/Book.dart';
import 'package:bookapp/presentation/bloc/filter_bloc.dart';
import 'package:bookapp/presentation/components/container/custom_container.dart';
import 'package:bookapp/presentation/components/details/book_detail_item.dart';
import 'package:bookapp/presentation/components/filter/filter_component.dart';
import 'package:bookapp/presentation/components/search_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_bloc/flutter_bloc.dart';

class BookList extends StatefulWidget {
  const BookList({super.key});

  @override
  _BookListState createState() => _BookListState();
}

class _BookListState extends State<BookList> {
  List<Book> _fullItems = [];
  List<Book> _filteredItems = [];

  @override
  void initState() {
    super.initState();
    _loadBooks();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterBloc, FilterState>(
      builder: (context, state) {
        return Column(
          children: [
            SearchComponent(hintText: "Suchen", onChanged: _filter),
            FilterComponent(onTap: _sortBooks),
            Expanded(
              child: ListView.builder(
                itemCount: _filteredItems.length,
                itemBuilder: (context, index) {
                  final book = _filteredItems[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomContainer(
                      child: ListTile(
                        leading: Icon(Icons.book_rounded),
                        title: Text(book.title ?? "Kein Titel"),
                        subtitle: Text(
                          'Autor: ${book.author ?? "Kein Autor"} Erscheinungsjahr: ${book.year?.toString() ?? "unbekannt"}',
                        ),
                        trailing: Text(book.ISBN ?? "Keine ISBN"),
                        onTap: () => _showDialog(context, book),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> _loadBooks() async {
    final jsonString = await rootBundle.loadString("assets/books.json");
    final List<dynamic> jsonList = jsonDecode(jsonString);
    final items = jsonList.map((json) => Book.fromJson(json)).toList();
    setState(() {
      _fullItems = items;
      _filteredItems = items;
    });
  }

  void _filter(String text) {
    final query = text.toLowerCase();
    setState(() {
      _filteredItems =
          _fullItems.where((book) {
            final title = book.title?.toLowerCase().contains(query) ?? false;
            final author = book.author?.toLowerCase().contains(query) ?? false;
            final ISBN = book.ISBN?.toLowerCase().contains(query) ?? false;
            final year = book.year?.toString().contains(query) ?? false;
            return title || author || ISBN || year;
          }).toList();
    });
  }

  void _sortBooks() {
    setState(() {
      _fullItems.sort((a, b) => a.title!.compareTo(b.title!));
      _filteredItems = _fullItems;
    });
  }

  Future<void> _showDialog(BuildContext context, Book book) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Buchdetails", style: TextStyle(fontSize: 25)),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BookDetailItem(
                headline: "Titel",
                value: book.title ?? "kein Titel",
              ),
              SizedBox(height: 10),
              BookDetailItem(
                headline: "Autor",
                value: book.author ?? "kein Autor",
              ),
              SizedBox(height: 10),
              BookDetailItem(
                headline: "Erscheinungsjahr",
                value: book.year.toString(),
              ),
              SizedBox(height: 10),
              BookDetailItem(
                headline: "ISBN",
                value: book.ISBN ?? "keine ISBN-Nummer",
              ),
              SizedBox(height: 20),
            ],
          ),
          actions: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              child: const Text(
                "Schließen",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
