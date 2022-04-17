import 'package:cbc_online/app_colors.dart';
import 'package:flutter/material.dart';

class TextFormDecorator extends InputDecoration {
  const TextFormDecorator({required this.hintString});

  final String hintString;

  @override
  TextStyle? get labelStyle =>
      const TextStyle(color: appPrimaryColor, fontWeight: FontWeight.w600);

  @override
  Color? get fillColor => Colors.white;

  @override
  InputBorder? get border => OutlineInputBorder(
      borderSide: const BorderSide(color: appPrimaryColor, width: 1.0),
      borderRadius: BorderRadius.circular(12.0));

  @override
  InputBorder? get enabledBorder => OutlineInputBorder(
      borderSide: const BorderSide(color: appPrimaryColor, width: 1.0),
      borderRadius: BorderRadius.circular(12.0));

  @override
  InputBorder? get focusedBorder => OutlineInputBorder(
      borderSide: const BorderSide(color: appPrimaryColor, width: 1.0),
      borderRadius: BorderRadius.circular(12.0));

  @override
  String? get hintText => hintString;

  @override
  TextStyle? get hintStyle =>
      TextStyle(color: appPrimaryColor.withOpacity(0.4));
}
