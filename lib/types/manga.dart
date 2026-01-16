abstract class Manga {
  final String title;
  final String? slug;
  final String genre;
  final String chapter;
  final String? chapterSlug;
  final String? image;

  Manga({
    required this.title,
    this.slug,
    required this.genre,
    required this.chapter,
    this.chapterSlug,
    this.image,
  });
}
