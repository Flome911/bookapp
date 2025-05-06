import 'package:flutter/material.dart';

class SearchComponent extends StatelessWidget {
  final String hintText;
  final ValueChanged<String> onChanged;

  SearchComponent({super.key, required this.hintText, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: TextField(
        onChanged: onChanged,
        style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black26),
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Colors.black26, width: 2),
          ),

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Colors.black38, width: 2),
          ),
          labelText: hintText,
          prefixIcon: Icon(Icons.search),
        ),
      ),
    );
  }
}
