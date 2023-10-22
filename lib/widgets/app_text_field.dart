import 'package:flutter/material.dart';

class AppTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final TextInputType? textInputType;
  final bool? obsecureText;
  final String? Function(String?)? validator;

  const AppTextField(
      {this.controller,
      this.hintText,
      this.textInputType,
      this.obsecureText,
      this.validator,
      super.key});

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool _obsecure = false;

  @override
  initState() {
    super.initState();
    _obsecure = widget.obsecureText ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFFD8DADC),
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        hintText: widget.hintText,
        suffixIcon: widget.obsecureText ?? false
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    _obsecure = !_obsecure;
                  });
                },
                child: Icon(
                  _obsecure ? Icons.visibility : Icons.visibility_off,
                  size: 16,
                ),
              )
            : null,
      ),
      obscureText: _obsecure,
      validator: widget.validator,
    );
  }
}
