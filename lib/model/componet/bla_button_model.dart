import 'package:flutter/material.dart';

class BlaButtonModel {
  final String text;
  final IconData? icon;
  final VoidCallback onPressed;
  final bool isPrimary;

  BlaButtonModel({
    required this.text,
    this.icon,
    required this.onPressed,
    this.isPrimary = true,
  });
}
