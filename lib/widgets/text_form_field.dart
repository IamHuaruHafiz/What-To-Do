import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget(
      {super.key,
      required this.controllerName,
      required this.hintText,
      this.maxLines});

  final TextEditingController controllerName;
  final String hintText;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines ?? 1,
      validator: (value) {
        if (value!.isEmpty) {
          return "Field required";
        }
        return null;
      },
      controller: controllerName,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: hintText,
        enabledBorder: InputBorder.none,
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red.shade500),
        ),
      ),
    );
  }
}
