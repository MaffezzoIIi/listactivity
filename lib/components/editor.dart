import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final IconData icon;

  const Editor(
      {super.key,
      required this.controller,
      required this.labelText,
      required this.hintText,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        style: const TextStyle(
          fontSize: 24.0,
        ),
        decoration: InputDecoration(
          icon: Icon(icon),
          labelText: labelText,
          hintText: hintText,
        ),
        keyboardType: TextInputType.number,
        controller: controller,
      ),
    );
  }
}
