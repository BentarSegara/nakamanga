import 'package:nakamanga/types/manga.dart';

class PopularManga extends Manga {
  final String view;
  PopularManga({
    required super.title,
    super.slug,
    required super.genre,
    required super.chapter,
    super.chapterSlug,
    super.image,
    required this.view,
  });
}
