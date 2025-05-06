import 'package:bookapp/presentation/components/filter/filter_item.dart';
import 'package:flutter/material.dart';

class FilterComponent extends StatefulWidget {
  VoidCallback onTap;

  FilterComponent({super.key, required this.onTap});

  @override
  State<FilterComponent> createState() => _FilterComponentState();
}

class _FilterComponentState extends State<FilterComponent> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => _showFilterDialog(context),
      child: Icon(Icons.filter_alt),
    );
  }

  Future<void> _showFilterDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Filter",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 25),
              FilterItem(onTap: widget.onTap, label: "Titel"),
              SizedBox(height: 10),
              FilterItem(onTap: widget.onTap, label: "Autor"),
              SizedBox(height: 10),
              FilterItem(onTap: widget.onTap, label: "Jahr"),
              SizedBox(height: 10),
              FilterItem(onTap: widget.onTap, label: "ISBN"),
            ],
          ),
        );
      },
    );
  }
}
