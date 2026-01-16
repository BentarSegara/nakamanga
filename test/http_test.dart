import 'package:nakamanga/services/manga_service.dart';

void main() async {
  try {
    final List<dynamic> dataManga = await MangaService.getManga('top');
    print("Data berhasil diambil: $dataManga");
  } catch (e) {
    print("$e");
  }
}
