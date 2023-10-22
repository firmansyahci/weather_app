import 'package:flutter/material.dart';

class AppTitle extends StatelessWidget {
  final String? title;

  const AppTitle({this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(
        title ?? '',
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
