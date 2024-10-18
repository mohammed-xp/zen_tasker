import 'package:flutter/material.dart';
import 'package:zen_tasker/core/helper_function/is_tablet.dart';
import 'package:zen_tasker/core/utils/app_styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.onPressed,
    this.icon,
  });

  final String title;
  final Function()? onPressed;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      toolbarHeight: isMobile(context) ? null : 80,
      title: Text(
        title,
        style: isMobile(context)
            ? AppStyles.styleBold18(context)
            : AppStyles.styleBold35(context),
      ),
      centerTitle: true,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back_ios_new_rounded,
          color: Colors.black,
          size: isMobile(context) ? null : 40,
        ),
      ),
      actions: [
        if (icon != null)
          IconButton(
            onPressed: onPressed,
            icon: Icon(
              icon,
              color: Colors.black,
              size: isMobile(context) ? null : 40,
            ),
          )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
