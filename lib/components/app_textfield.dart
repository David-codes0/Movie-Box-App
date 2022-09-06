import 'package:flutter/material.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    Key? key,
    required this.controller,
    required this.labelText,
    required this.color, required this.obsecure,
  }) : super(key: key);

  final TextEditingController controller;
  final String labelText;
  final Color color;
  final bool obsecure;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        obscureText: widget.obsecure,
        style: const TextStyle(color: Colors.white),
        cursorColor: Colors.white,
        keyboardType: TextInputType.text,
        controller: widget.controller,
        decoration: InputDecoration(
          labelStyle: TextStyle(color: widget.color),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
            borderSide: BorderSide(
              color: Colors.white,
              width: 2,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(30),
            ),
            borderSide: BorderSide(
              color: widget.color,
              width: 2,
            ),
          ),
          labelText: widget.labelText,
        ),
      ),
    );
  }
}
