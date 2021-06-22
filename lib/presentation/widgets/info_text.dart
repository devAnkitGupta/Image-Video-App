
import 'package:flutter/material.dart';

class InfoText extends StatelessWidget {
  const InfoText({
    Key? key,
    required this.desc,
    required this.lable,
  }) : super(key: key);

  final String lable;

  final String desc;

  @override
  Widget build(BuildContext context) => _buildContent(context);

  Padding _buildContent(BuildContext context) => Padding(
        padding: const EdgeInsets.all(2.0),
        child: Text(
          '$lable : $desc',
          style: Theme.of(context)
              .textTheme
              .bodyText1
              ?.copyWith(color: Colors.white),
        ),
      );
}
