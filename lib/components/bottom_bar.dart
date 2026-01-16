import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:nakamanga/theme.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 0,
      padding: EdgeInsets.zero,
      color: Theme.of(context).colorScheme.surface,
      child: Container(
        padding: EdgeInsets.all(18),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.white.withValues(alpha: 0.1),
              width: 0.5,
            ),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Icon(
                  CupertinoIcons.home,
                  size: 25,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.primary,
                ),
                Text(
                  "Home",
                  style: AppTextStyles.bottomBarLabel.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Icon(
                  CupertinoIcons.compass,
                  size: 25,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.primary,
                ),
                Text(
                  "Explore",
                  style: AppTextStyles.bottomBarLabel.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Icon(
                  CupertinoIcons.book,
                  size: 25,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.primary,
                ),
                Text(
                  "Library",
                  style: AppTextStyles.bottomBarLabel.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Icon(
                  CupertinoIcons.person,
                  size: 25,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.primary,
                ),
                Text(
                  "Profile",
                  style: AppTextStyles.bottomBarLabel.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
