import 'package:flutter/material.dart';
import 'package:news_app_new_training/Presentation/widgets/custom_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CustomIcon(
          icon: Icons.menu,
        ),
        Spacer(),
        CustomIcon(
          icon: Icons.search,
        ),
        SizedBox(
          width: 10,
        ),
        CustomIcon(
          icon: Icons.notifications_active_outlined,
        ),
      ],
    );
  }
}
