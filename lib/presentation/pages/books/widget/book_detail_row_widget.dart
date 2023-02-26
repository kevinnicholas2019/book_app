import 'package:flutter/material.dart';

class BookDetailRowWidget extends StatelessWidget {
  static const TextStyle defaulTextStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w300,
  );

  final String keyText;
  final String valueText;
  final TextStyle keyTextStyle;
  final TextStyle valueTextStyle;

  const BookDetailRowWidget(
    this.keyText,
    this.valueText, {
    super.key,
    this.keyTextStyle = defaulTextStyle,
    this.valueTextStyle = defaulTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 3,
          child: Text(
            keyText,
            style: keyTextStyle,
          ),
        ),
        const Expanded(
          flex: 1,
          child: Center(
            child: Text(
              " : ",
              style: defaulTextStyle,
            ),
          ),
        ),
        Expanded(
          flex: 6,
          child: Text(
            valueText,
            style: valueTextStyle,
          ),
        ),
      ],
    );
  }
}
