import 'package:flutter/material.dart';

class ErrorIndicator extends StatelessWidget {
  final String error;
  final VoidCallback onTryAgain;

  const ErrorIndicator({
    Key? key,
    required this.error,
    required this.onTryAgain,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(error, style: Theme.of(context).textTheme.headline5,),
          ElevatedButton.icon(
              onPressed: onTryAgain,
              icon: Icon(Icons.refresh),
              label: Text('Try Again')),
        ],
      ),
    );
  }
}