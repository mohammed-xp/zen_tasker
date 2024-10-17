import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zen_tasker/core/helper_function/is_tablet.dart';
import 'package:zen_tasker/core/utils/app_colors.dart';
import 'package:zen_tasker/core/utils/app_images.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({
    super.key,
    required this.isChecked,
    required this.onChecked,
  });

  final bool isChecked;
  final ValueChanged<bool> onChecked;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChecked(!isChecked);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        height: isMobile(context) ? 24 : 32,
        width: isMobile(context) ? 24 : 32,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: isChecked ? AppColors.secendaryColor : Colors.white,
          border: isChecked
              ? null
              : Border.all(
                  color: const Color(0xffDDDFDF),
                ),
        ),
        child: isChecked
            ? Padding(
                padding: const EdgeInsets.all(4.0),
                child: SvgPicture.asset(AppImages.imagesCheckIcon),
              )
            : null,
      ),
    );
  }
}
