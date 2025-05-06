import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final Widget child;

  const CustomContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        //Schnelle Lösung, muss noch umgebaut werden
        border: Border.all(width: 2, color: Colors.black26),
        borderRadius: BorderRadius.circular(15),
      ),
      child: child,
    );
  }
}
