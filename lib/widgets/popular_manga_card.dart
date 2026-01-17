import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nakamanga/types/popular_manga.dart';
import 'package:nakamanga/widgets/big_manga_card.dart';
import 'package:nakamanga/theme.dart';

class PopularMangaCard extends StatelessWidget {
  final PopularManga manga;
  const PopularMangaCard({super.key, required this.manga});

  @override
  Widget build(BuildContext context) {
    final Size phoneSize = MediaQuery.of(context).size;

    return BigMangaCard(
      image: manga.image,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 75,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.textPrimary.withValues(alpha: 0.5),
              borderRadius: BorderRadius.only(topRight: Radius.circular(15)),
            ),
            child: Center(
              child: Row(
                spacing: 5,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    CupertinoIcons.eye,
                    size: 20,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  Text(
                    manga.view,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: phoneSize.width,
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            decoration: BoxDecoration(
              color: AppColors.textPrimary.withValues(alpha: 0.5),
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
