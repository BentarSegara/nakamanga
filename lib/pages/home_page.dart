import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nakamanga/components/bottom_bar.dart';
import 'package:nakamanga/components/section.dart';
import 'package:nakamanga/services/manga_service.dart';
import 'package:nakamanga/types/latest_manga.dart';
import 'package:nakamanga/types/popular_manga.dart';
import 'package:nakamanga/types/top_manga.dart';
import 'package:nakamanga/widgets/latest_manga_card.dart';
import 'package:nakamanga/widgets/popular_manga_card.dart';
import 'package:nakamanga/widgets/top_manga_card.dart';

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

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0F172A),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Selamat Pagi,",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            Text(
              "Segaara",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            style: IconButton.styleFrom(backgroundColor: Color(0xFF1E293B)),
            onPressed: () => {},
            icon: Icon(
              CupertinoIcons.sun_max,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 10),
          IconButton(
            style: IconButton.styleFrom(backgroundColor: Color(0xFF1E293B)),
            onPressed: () => {},
            icon: Icon(
              CupertinoIcons.bell,
              fontWeight: FontWeight.w600,
              color: Colors.white,
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
                  color: Color(0xFF1E293B),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    spacing: 5,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(CupertinoIcons.search, color: Color(0xFF38BDF8)),
                      Expanded(
                        flex: 1,
                        child: TextField(
                          controller: _textEditingController,
                          style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.5),
                          ),
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            hintText: "Cari manga favoritmu",
                            hintStyle: TextStyle(
                              color: Colors.white.withValues(alpha: 0.5),
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
        color: Color(0xFF0F172A),
        child: ListView(
          children: [
            Section(
              header: Row(
                spacing: 5,
                children: [
                  Icon(
                    CupertinoIcons.star,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF38BDF8),
                  ),
                  Text(
                    "Rating Teratas",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
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
                    color: Color(0xFF38BDF8),
                  ),
                  Text(
                    "Paling Popular",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
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
                    color: Color(0xFF38BDF8),
                  ),
                  Text(
                    "Update Terbaru",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
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
                    CircularProgressIndicator(color: Color(0xFF38BDF8)),
                    Text(
                      "Memuat Data Manga",
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.3),
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
                      color: Colors.white.withValues(alpha: 0.2),
                    ),
                    Text(
                      "Gagal Memuat Data Manga",
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.3),
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
                          color: Colors.white.withValues(alpha: 0.3),
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
                          color: Color(0xFF38BDF8),
                        ),
                        Text(
                          "Rating Teratas",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
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
                          color: Color(0xFF38BDF8),
                        ),
                        Text(
                          "Paling Popular",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
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
                          color: Color(0xFF38BDF8),
                        ),
                        Text(
                          "Update Terbaru",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
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

 
 */
