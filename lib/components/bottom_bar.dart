import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 0,
      padding: EdgeInsets.zero,
      color: Color(0xFF0F172A),
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
                  color: Color(0xFF38BDF8),
                ),
                Text(
                  "Home",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF94A3B8),
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
                  color: Color(0xFF38BDF8),
                ),
                Text(
                  "Explore",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF94A3B8),
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
                  color: Color(0xFF38BDF8),
                ),
                Text(
                  "Library",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF94A3B8),
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
                  color: Color(0xFF38BDF8),
                ),
                Text(
                  "Profile",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF94A3B8),
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
