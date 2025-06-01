import 'package:flutter/material.dart';

class OrderRowText extends StatelessWidget {
  const OrderRowText({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text, maxLines: 1, overflow: TextOverflow.fade, softWrap: false);
  }
}
