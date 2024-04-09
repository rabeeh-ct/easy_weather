import 'package:flutter/material.dart';

import '../theme/theme.dart';

class TitleTextField extends StatelessWidget {
  const TitleTextField({Key? key,
    required this.labelText,
    this.fillColor,
    this.controller,
    this.keyboardType,
    this.validator,
    this.inputDecoration,
    this.maxLines,
    this.obscureText = false,
    this.textCapitalization,
    this.textDirection,
  }) : super(key: key);
  final String labelText;
  final Color? fillColor;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final InputDecoration? inputDecoration;
  final String? Function(String?)? validator;
  final int? maxLines;
  final bool obscureText;
  final TextCapitalization? textCapitalization;
  final TextDirection? textDirection;

@override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: Theme
              .of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(fontSize: 13),
        ),
        defaultSpacerSmall,
        TextFormField(
          textDirection: textDirection,
          obscureText: obscureText,
          maxLines: maxLines,
          validator: validator,
          textCapitalization: textCapitalization??TextCapitalization.sentences,
          keyboardType: keyboardType,
          controller: controller,
          decoration: inputDecoration ?? InputDecoration(fillColor: fillColor),
        ),
      ],
    );
  }
}
