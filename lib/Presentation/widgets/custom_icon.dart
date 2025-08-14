import 'package:flutter/material.dart';

class CustomIcon extends StatefulWidget {
  final IconData icon;
  final void Function()? onTap;

  const CustomIcon({
    super.key,
    required this.icon,
    this.onTap,
  });

  @override
  State<CustomIcon> createState() => _CustomIconState();
}

class _CustomIconState extends State<CustomIcon> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(36),
          ),
          color: Colors.blue[300],
        ),
        child: Icon(
          widget.icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
