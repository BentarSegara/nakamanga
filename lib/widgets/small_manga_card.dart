import 'package:flutter/material.dart';

class SmallMangaCard extends StatelessWidget {
  final Widget child;
  const SmallMangaCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final Size phoneSize = MediaQuery.of(context).size;
    return Card(
      elevation: 2,
      child: Container(
        height: phoneSize.height * 0.15,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceContainer,
          borderRadius: BorderRadius.circular(12),
        ),
        child: child,
      ),
    );
  }
}
