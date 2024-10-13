import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zen_tasker/core/utils/app_images.dart';
import 'package:zen_tasker/core/utils/app_styles.dart';

import '../../../../../generated/l10n.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          // icon: const Icon(Icons.search_rounded),
          icon: SvgPicture.asset(AppImages.imagesSearchIcon),
          onPressed: () {},
        ),
        hintText: S.of(context).findYourTask,
        hintStyle: AppStyles.styleMedium16(context).copyWith(
          color: const Color(0xFFA8A8A8),
        ),
        filled: true,
        fillColor: const Color(0xFFF5F5F5),
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16.0),
      borderSide: const BorderSide(
        color: Color(0xFFF5F5F5),
      ),
    );
  }
}
