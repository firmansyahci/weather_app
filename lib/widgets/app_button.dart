import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String? title;
  final VoidCallback? onPreesed;

  const AppButton({this.title, this.onPreesed, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPreesed,
        child: Text(
          title ?? '',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
