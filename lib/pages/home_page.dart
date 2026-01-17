import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nakamanga/components/bottom_bar.dart';
import 'package:nakamanga/components/section.dart';
import 'package:nakamanga/providers/manga_provider.dart';
import 'package:nakamanga/providers/theme_provider.dart';
import 'package:nakamanga/services/manga_service.dart';
import 'package:nakamanga/types/latest_manga.dart';
import 'package:nakamanga/types/popular_manga.dart';
import 'package:nakamanga/types/top_manga.dart';
import 'package:nakamanga/widgets/latest_manga_card.dart';
import 'package:nakamanga/widgets/popular_manga_card.dart';
import 'package:nakamanga/widgets/top_manga_card.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // late Future<List<List<dynamic>>> _mangas;
  late TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    // _mangas = fetchDataManga();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  Future<List<List<dynamic>>> fetchDataManga() async {
    return Future.wait([
      MangaService.getManga('top'),
      MangaService.getManga('popular'),
      MangaService.getManga('latest'),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final Size phoneSize = MediaQuery.of(context).size;

    return ChangeNotifierProvider(
      create: (context) => MangaProvider()..fetchDataManga(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.surface,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Selamat Pagi,",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                "Segaara",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
          actions: [
            IconButton(
              style: IconButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
              ),
              onPressed: () => context.read<ThemeProvider>().setTheme(),
              icon: Icon(
                CupertinoIcons.sun_max,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            const SizedBox(width: 10),
            IconButton(
              style: IconButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
              ),
              onPressed: () => {},
              icon: Icon(
                CupertinoIcons.bell,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(100),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              child: Card(
                elevation: 2,
                color: Colors.transparent,
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surfaceContainer,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      spacing: 5,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          CupertinoIcons.search,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        Expanded(
                          flex: 1,
                          child: TextField(
                            controller: _textEditingController,
                            style: TextStyle(
                              color: Theme.of(
                                context,
                              ).colorScheme.onSurface.withValues(alpha: 0.5),
                            ),
                            cursorColor: Theme.of(context).colorScheme.primary,
                            decoration: InputDecoration(
                              hintText: "Cari manga favoritmu",
                              hintStyle: TextStyle(
                                color: Theme.of(
                                  context,
                                ).colorScheme.onSurface.withValues(alpha: 0.5),
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          actionsPadding: EdgeInsets.only(right: 15),
        ),
        bottomNavigationBar: BottomBar(),
        body: Container(
          color: Colors.transparent,
          child: Consumer<MangaProvider>(
            builder: (context, mangaProvider, _) {
              if (mangaProvider.state == ViewState.loading) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 10,
                    children: [
                      CircularProgressIndicator(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      Text(
                        "Memuat Data Manga",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(
                            context,
                          ).colorScheme.onSurface.withValues(alpha: 0.3),
                        ),
                      ),
                    ],
                  ),
                );
              } else if (mangaProvider.state == ViewState.error) {
                return Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 10,
                    children: [
                      Icon(
                        CupertinoIcons.wifi_slash,
                        size: 35,
                        color: Theme.of(
                          context,
                        ).colorScheme.onSurface.withValues(alpha: 0.2),
                      ),
                      Text(
                        "Gagal Memuat Data Manga",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(
                            context,
                          ).colorScheme.onSurface.withValues(alpha: 0.3),
                        ),
                      ),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(
                            color: Theme.of(context).colorScheme.outline,
                            width: 0.5,
                          ),
                        ),
                        onPressed: () => mangaProvider.fetchDataManga(),
                        child: Text(
                          "Reload",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(
                              context,
                            ).colorScheme.onSurface.withValues(alpha: 0.3),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                var topMangas = mangaProvider.mangasInHomePage[0];
                var popularMangas = mangaProvider.mangasInHomePage[1];
                var latestMangas = mangaProvider.mangasInHomePage[2];

                return ListView(
                  children: [
                    Section(
                      header: Row(
                        spacing: 5,
                        children: [
                          Icon(
                            CupertinoIcons.star,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          Text(
                            "Rating Teratas",
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ],
                      ),
                      child: Expanded(
                        flex: 1,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, idx) {
                            final TopManga topManga = TopManga(
                              title: topMangas[idx]['title'],
                              genre: topMangas[idx]['genre'],
                              chapter: topMangas[idx]['chapter'],
                              rank: topMangas[idx]['rank'],
                              image: topMangas[idx]['image'],
                            );

                            return TopMangaCard(manga: topManga);
                          },
                          separatorBuilder: (context, idx) =>
                              const SizedBox(width: 5),
                          itemCount: topMangas.length,
                        ),
                      ),
                    ),

                    Section(
                      header: Row(
                        spacing: 5,
                        children: [
                          Icon(
                            CupertinoIcons.flame,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          Text(
                            "Paling Popular",
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ],
                      ),

                      child: Expanded(
                        flex: 1,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, idx) {
                            final PopularManga popularManga = PopularManga(
                              title: popularMangas[idx]['title'],
                              genre: popularMangas[idx]['genre'],
                              chapter: popularMangas[idx]['chapter'],
                              view: popularMangas[idx]['view'],
                              image: popularMangas[idx]['image'],
                            );

                            return PopularMangaCard(manga: popularManga);
                          },
                          separatorBuilder: (context, idx) =>
                              const SizedBox(width: 5),
                          itemCount: popularMangas.length,
                        ),
                      ),
                    ),
                    Section(
                      height: phoneSize.height * 3.2,
                      header: Row(
                        spacing: 5,
                        children: [
                          Icon(
                            CupertinoIcons.clock,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          Text(
                            "Update Terbaru",
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ],
                      ),
                      child: Expanded(
                        flex: 1,
                        child: ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, idx) {
                            final LatestManga latestManga = LatestManga(
                              title: latestMangas[idx]['title'],
                              genre: latestMangas[idx]['genre'],
                              chapter: latestMangas[idx]['chapter'],
                              category: latestMangas[idx]['category'],
                              image: latestMangas[idx]['image'],
                            );

                            return LatestMangaCard(manga: latestManga);
                          },
                          separatorBuilder: (context, idx) =>
                              const SizedBox(height: 5),
                          itemCount: latestMangas.length,
                        ),
                      ),
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

/**
 FutureBuilder(
          future: _mangas,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 10,
                  children: [
                    CircularProgressIndicator(color: AppColors.primary),
                    Text(
                      "Memuat Data Manga",
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.textPrimary.withValues(alpha: 0.3),
                      ),
                    ),
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              print("$snapshot.error");
              return Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 10,
                  children: [
                    Icon(
                      CupertinoIcons.wifi_slash,
                      size: 35,
                      color: AppColors.textPrimary.withValues(alpha: 0.2),
                    ),
                    Text(
                      "Gagal Memuat Data Manga",
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.textPrimary.withValues(alpha: 0.3),
                      ),
                    ),
                    OutlinedButton(
                      onPressed: () => {
                        setState(() {
                          _mangas = fetchDataManga();
                        }),
                      },
                      child: Text(
                        "Reload",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textPrimary.withValues(alpha: 0.3),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              var topMangas = snapshot.data![0];
              var popularMangas = snapshot.data![1];
              var latestMangas = snapshot.data![2];

              return ListView(
                children: [
                  Section(
                    header: Row(
                      spacing: 5,
                      children: [
                        Icon(
                          CupertinoIcons.star,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                        Text(
                          "Rating Teratas",
                          style: AppTextStyles.sectionHeader,
                        ),
                      ],
                    ),
                    child: Expanded(
                      flex: 1,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, idx) {
                          final TopManga topManga = TopManga(
                            title: topMangas[idx]['title'],
                            genre: topMangas[idx]['genre'],
                            chapter: topMangas[idx]['chapter'],
                            rank: topMangas[idx]['rank'],
                            image: topMangas[idx]['image'],
                          );

                          return TopMangaCard(manga: topManga);
                        },
                        separatorBuilder: (context, idx) =>
                            const SizedBox(width: 5),
                        itemCount: topMangas.length,
                      ),
                    ),
                  ),

                  Section(
                    header: Row(
                      spacing: 5,
                      children: [
                        Icon(
                          CupertinoIcons.flame,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                        Text(
                          "Paling Popular",
                          style: AppTextStyles.sectionHeader,
                        ),
                      ],
                    ),

                    child: Expanded(
                      flex: 1,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, idx) {
                          final PopularManga popularManga = PopularManga(
                            title: popularMangas[idx]['title'],
                            genre: popularMangas[idx]['genre'],
                            chapter: popularMangas[idx]['chapter'],
                            view: popularMangas[idx]['view'],
                            image: popularMangas[idx]['image'],
                          );

                          return PopularMangaCard(manga: popularManga);
                        },
                        separatorBuilder: (context, idx) =>
                            const SizedBox(width: 5),
                        itemCount: popularMangas.length,
                      ),
                    ),
                  ),
                  Section(
                    height: phoneSize.height * 3.2,
                    header: Row(
                      spacing: 5,
                      children: [
                        Icon(
                          CupertinoIcons.clock,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                        Text(
                          "Update Terbaru",
                          style: AppTextStyles.sectionHeader,
                        ),
                      ],
                    ),
                    child: Expanded(
                      flex: 1,
                      child: ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, idx) {
                          final LatestManga latestManga = LatestManga(
                            title: latestMangas[idx]['title'],
                            genre: latestMangas[idx]['genre'],
                            chapter: latestMangas[idx]['chapter'],
                            category: latestMangas[idx]['category'],
                            image: latestMangas[idx]['image'],
                          );

                          return LatestMangaCard(manga: latestManga);
                        },
                        separatorBuilder: (context, idx) =>
                            const SizedBox(height: 5),
                        itemCount: latestMangas.length,
                      ),
                    ),
                  ),
                ],
              );
            }
          },
        ),

 

 ListView(
          children: [
            Section(
              header: Row(
                spacing: 5,
                children: [
                  Icon(
                    CupertinoIcons.star,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  Text(
                    "Rating Teratas",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
              child: Expanded(
                flex: 1,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, idx) {
                    final TopManga topManga = TopManga(
                      title: 'Kimetsu no Yaiba',
                      genre: 'Action',
                      chapter: '255',
                      rank: '1',
                    );

                    return TopMangaCard(manga: topManga);
                  },
                  separatorBuilder: (context, idx) => const SizedBox(width: 5),
                  itemCount: 5,
                ),
              ),
            ),

            Section(
              header: Row(
                spacing: 5,
                children: [
                  Icon(
                    CupertinoIcons.flame,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  Text(
                    "Paling Popular",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),

              child: Expanded(
                flex: 1,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, idx) {
                    final PopularManga popularManga = PopularManga(
                      title: 'Kimetsu no Yaiba',
                      genre: 'Action',
                      chapter: '255',
                      view: '10 jtx',
                    );

                    return PopularMangaCard(manga: popularManga);
                  },
                  separatorBuilder: (context, idx) => const SizedBox(width: 5),
                  itemCount: 5,
                ),
              ),
            ),
            Section(
              height: phoneSize.height * 3.2,
              header: Row(
                spacing: 5,
                children: [
                  Icon(
                    CupertinoIcons.clock,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  Text(
                    "Update Terbaru",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
              child: Expanded(
                flex: 1,
                child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, idx) {
                    final LatestManga latestManga = LatestManga(
                      title: 'Kimetsu no Yaiba',
                      genre: 'Action',
                      chapter: '255',

                      category: 'Manga',
                    );

                    return LatestMangaCard(manga: latestManga);
                  },
                  separatorBuilder: (context, idx) => const SizedBox(height: 5),
                  itemCount: 5,
                ),
              ),
            ),
          ],
        ),
 */
