// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomHedingWeidget extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const CustomHedingWeidget({
    super.key,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: onTap,
          child: const Text(
            'عرض الكل',
            style: TextStyle(
              fontSize: 15,
            ),
          ),
        ),
        Text(
          text,
          style: const TextStyle(
            fontSize: 25,
          ),
        )
      ],
    );
  }
}
