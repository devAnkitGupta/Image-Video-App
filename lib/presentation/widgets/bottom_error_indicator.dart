import 'package:flutter/material.dart';

class BottomErrorIndicator extends StatelessWidget {
  final String error;
  final VoidCallback onTryAgain;
  const BottomErrorIndicator({
    Key? key,
    required this.error,
    required this.onTryAgain,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton.icon(
      onPressed: onTryAgain, icon: Icon(Icons.refresh), label: Text(error));
}