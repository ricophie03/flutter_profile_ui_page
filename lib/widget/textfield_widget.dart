import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  final String? label;
  final int? maxLines;
  final String? text;
  final ValueChanged<String>? onChanged;

  TextFieldWidget(
      {required this.text,
      required this.label,
      required this.onChanged,
      this.maxLines = 1});
  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  late final TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.text);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${widget.label}',
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8.0),
        TextField(
          controller: controller,
          maxLines: widget.maxLines,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
          onChanged: widget.onChanged,
        ),
      ],
    );
  }
}
