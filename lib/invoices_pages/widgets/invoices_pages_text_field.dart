import 'package:flutter/material.dart';

class InvoicesPageTextField extends StatelessWidget {
  const InvoicesPageTextField({
    Key? key,
    required this.labelText,
    required this.controller,
    this.onChanged,
  }) : super(key: key);

  final String labelText;
  final TextEditingController controller;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Text(labelText),
        ),
        TextFormField(
          onChanged: onChanged,
          controller: controller,
          decoration: InputDecoration(
            labelText: '',
            filled: true,
            fillColor: Theme.of(context).canvasColor,
            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).selectedRowColor,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).selectedRowColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).selectedRowColor,
              ),
            ),
            constraints: const BoxConstraints(maxHeight: 48),
          ),
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}
