import 'package:flutter/material.dart';

class FilterContainer extends StatelessWidget {
  final Widget child;

  const FilterContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: Colors.black26),
        borderRadius: BorderRadius.circular(15),
      ),
      child: child,
    );
  }
}
