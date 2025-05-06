import 'package:bookapp/presentation/components/container/filter_container.dart';
import 'package:flutter/material.dart';

class FilterItem extends StatefulWidget {
  VoidCallback onTap;
  bool isAscending = true;
  String label;

  FilterItem({super.key, required this.onTap, required this.label});

  @override
  State<FilterItem> createState() => _FilterItemState();
}

class _FilterItemState extends State<FilterItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {});
        widget.onTap;
        _toggleIcon();
      },
      child: FilterContainer(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(widget.label),
              Icon(
                widget.isAscending == true
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _toggleIcon() {
    widget.isAscending = !widget.isAscending;
  }
}
