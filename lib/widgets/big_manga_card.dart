import 'package:flutter/material.dart';

class BigMangaCard extends StatelessWidget {
  final Widget child;
  final String? image;
  const BigMangaCard({super.key, required this.child, this.image});

  @override
  Widget build(BuildContext context) {
    final Size phoneSize = MediaQuery.of(context).size;
    return Container(
      width: phoneSize.width * 0.92,
      decoration: BoxDecoration(
        image: image != null
            ? DecorationImage(image: NetworkImage(image!), fit: BoxFit.cover)
            : null,
        color: Theme.of(context).colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(15),
      ),
      child: child,
    );
  }
}
