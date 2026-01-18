import 'dart:developer';

import 'package:nakamanga/services/manga_service.dart';

void main() async {
  try {
    final List<dynamic> dataManga = await MangaService.getManga('top');
    log("Data berhasil diambil: $dataManga", name: "success");
  } catch (e) {
    log("$e", name: "error");
  }
}
