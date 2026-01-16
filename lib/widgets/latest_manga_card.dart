import 'package:flutter/material.dart';
import 'package:nakamanga/types/latest_manga.dart';
import 'package:nakamanga/widgets/small_manga_card.dart';

class LatestMangaCard extends StatelessWidget {
  final LatestManga manga;
  const LatestMangaCard({super.key, required this.manga});

  @override
  Widget build(BuildContext context) {
    final Size phoneSize = MediaQuery.of(context).size;
    return SmallMangaCard(
      child: Row(
        children: [
          Container(
            width: phoneSize.width * 0.43,
            decoration: BoxDecoration(
              image: manga.image != null
                  ? DecorationImage(
                      image: NetworkImage(manga.image!),
                      fit: BoxFit.fill,
                    )
                  : null,
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsetsGeometry.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    manga.title,
                    maxLines: 2,
                    style: Theme.of(
                      context,
                    ).textTheme.titleLarge!.copyWith(fontSize: 16),
                  ),
                  Column(
                    spacing: 2,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${manga.category} ${manga.genre}",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      ),
                      Container(
                        width: 120,
                        height: 35,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: Text(
                            "Chapter ${manga.chapter}",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
