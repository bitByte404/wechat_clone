import 'package:flutter/material.dart';

import '../../gen/assets.gen.dart';
import '../../value/colors.dart';
import '../../value/sizes.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const CustomAppBar({
    super.key,
    required this.title
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: AppColors.appBarColor,
      title: Stack(
        alignment: Alignment.center,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Center(
              child: Text(
                title,
                style: const TextStyle(fontSize: AppSizes.appBarTextSize),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  Assets.images.iconSearch.path,
                  height: AppSizes.iconSize,
                ),
                const SizedBox(
                  width: 20,
                ),
                Image.asset(
                  Assets.images.iconAdd.path,
                  height: AppSizes.iconSize,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}