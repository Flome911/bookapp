import 'package:bookapp/presentation/components/book_list.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bibliothek"), backgroundColor: Colors.blue),
      body: BookList(),
    );
  }
}
