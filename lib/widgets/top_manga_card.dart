import 'package:flutter/material.dart';
import 'package:nakamanga/types/top_manga.dart';
import 'package:nakamanga/widgets/big_manga_card.dart';

class TopMangaCard extends StatelessWidget {
  final TopManga manga;
  const TopMangaCard({super.key, required this.manga});

  @override
  Widget build(BuildContext context) {
    final Size phoneSize = MediaQuery.of(context).size;
    return BigMangaCard(
      image: manga.image,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.5),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(15)),
            ),
            child: Center(
              child: Text(
                "# ${manga.rank}",
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ),
          ),
          Container(
            width: phoneSize.width,
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.5),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  manga.title,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  "${manga.genre} | Cahpter ${manga.chapter}",
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
