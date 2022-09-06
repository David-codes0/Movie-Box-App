
import 'package:flutter/material.dart';

void snackBar(BuildContext context, String message) {
  final snackBar = SnackBar(
    content: Text(
      message,
    ),
    duration: const Duration(milliseconds: 1200),
    elevation: 10,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(5),
        topLeft: Radius.circular(5),
      ),
    ),
    backgroundColor: Colors.pink,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
