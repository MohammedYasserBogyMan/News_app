import 'package:flutter/material.dart';

// ignore: camel_case_types
class newsTextImageShado extends StatefulWidget {
  const newsTextImageShado({
    super.key,
  });

  @override
  State<newsTextImageShado> createState() => _newsTextImageShadoState();
}

// ignore: camel_case_types
class _newsTextImageShadoState extends State<newsTextImageShado> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.transparent,
            Colors.black,
          ],
        ),
      ),
    );
  }
}
