import 'package:flutter/material.dart';

class FavoriteButton extends StatefulWidget {
  final bool isSelected;
  final VoidCallback callback;
  const FavoriteButton({
    Key? key,
    required this.callback,
    required this.isSelected,
  }) : super(key: key);

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  late bool isSelected;

  @override
  void initState() {
    isSelected = widget.isSelected;
    super.initState();
  }

  void toggle() {
    isSelected = !isSelected;
    // As This is a very small part of Widget tree SetState inside would not impace the unnessary rebuilds
    setState(() {});
  }

  @override
  Widget build(BuildContext context) => Positioned(
        bottom: 8,
        right: 8,
        child: CircleAvatar(
          child: _buildIconButton(),
          backgroundColor: Colors.black54,
        ),
      );

  IconButton _buildIconButton() => IconButton(
      onPressed: () {
        widget.callback();
        toggle();
      },
      icon: Icon(
        Icons.favorite,
        color: isSelected ? Colors.pink : Colors.white,
      ));
}
