import 'package:nakamanga/types/manga.dart';

class LatestManga extends Manga {
  final String category;
  LatestManga({
    required super.title,
    super.slug,
    required super.genre,
    required super.chapter,
    super.chapterSlug,
    super.image,
    required this.category,
  });
}
