import 'package:flutter/material.dart';

class SignInWithButton extends StatelessWidget {
  final String? title;
  final String? logo;
  final VoidCallback? onPressed;

  const SignInWithButton({this.title, this.logo, this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          border: Border.all(
            color: const Color(0xFFD8DADC),
          ),
          color: Colors.white,
        ),
        child: Row(
          children: [
            if (logo != null)
              Image.asset(
                logo!,
                width: 18,
                height: 18,
              ),
            const SizedBox(width: 14),
            Text(
              title ?? '',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
