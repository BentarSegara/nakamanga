import 'package:nakamanga/types/manga.dart';

class TopManga extends Manga {
  final String rank;
  TopManga({
    required super.title,
    super.slug,
    required super.genre,
    required super.chapter,
    super.chapterSlug,
    super.image,
    required this.rank,
  });
}
