import 'package:flutter/material.dart';

class TextF extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final void Function(String)? onChanged;

  const TextF({
    Key? key,
    required this.hintText,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.onChanged,
  }) : super(key: key);

  @override
  State<TextF> createState() => _TextFState();
}

class _TextFState extends State<TextF> {
  bool _isEditable = true; // Initially not editable

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 16),
        Row(
          children: [
            SizedBox(width: 10),
            Expanded(
        
              child: TextField(
                enabled: _isEditable, // Controlled by the internal state
                controller: widget.controller,
                keyboardType: widget.keyboardType,
                onChanged: widget.onChanged,
                decoration: InputDecoration(
                  labelText: widget.hintText,
                  hintText: widget.hintText,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
        
                ),
              ),
            ),
            
          ],
        ),
      ],
    );
  }
}
