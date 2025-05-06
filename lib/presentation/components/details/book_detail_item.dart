import 'package:bookapp/presentation/components/container/custom_container.dart';
import 'package:flutter/material.dart';

class BookDetailItem extends StatelessWidget {
  final String headline;
  final String value;

  const BookDetailItem({
    super.key,
    required this.headline,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              headline,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            Text(value, style: TextStyle(fontSize: 15)),
          ],
        ),
      ),
    );
  }
}
