import 'package:flutter/material.dart';
import 'package:nakamanga/services/manga_service.dart';

enum ViewState { loading, success, error }

class MangaProvider with ChangeNotifier {
  ViewState _state = ViewState.loading;
  List<List<dynamic>>? _mangasInHomePage;

  get state => _state;
  get mangasInHomePage => _mangasInHomePage;

  Future<void> fetchDataManga() async {
    _state = ViewState.loading;
    notifyListeners();
    try {
      _mangasInHomePage = await Future.wait([
        MangaService.getManga('top'),
        MangaService.getManga('popular'),
        MangaService.getManga('latest'),
      ]);
      _state = ViewState.success;
    } catch (e) {
      _state = ViewState.error;
    }
    notifyListeners();
  }
}
