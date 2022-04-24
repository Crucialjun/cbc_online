import 'package:flutter/material.dart';

class TextFormDecorator extends InputDecoration {
  const TextFormDecorator({required this.hintString});

  final String hintString;

  @override
  Color? get fillColor => Colors.grey[300];

  @override
  bool? get filled => true;

  @override
  TextStyle? get labelStyle =>
      const TextStyle(color: Colors.black, fontWeight: FontWeight.w600);

  @override
  InputBorder? get border => OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.blue, width: 1.0),
      borderRadius: BorderRadius.circular(12.0));

  @override
  InputBorder? get enabledBorder => OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.black, width: 0.8),
      borderRadius: BorderRadius.circular(12.0));

  @override
  InputBorder? get focusedBorder => OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.blue, width: 1.0),
      borderRadius: BorderRadius.circular(12.0));

  @override
  String? get hintText => hintString;

  @override
  TextStyle? get hintStyle =>
      const TextStyle(color: Color.fromARGB(255, 167, 165, 165));
}
