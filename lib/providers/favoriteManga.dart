import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:manga_reading_ware/models/manga_model.dart';

class FavoriteProvider extends ChangeNotifier {

  FavoriteProvider() {
    _loadList();
  }

  List<MangaFavorite> _favoriteManga = [];

  List<MangaFavorite> get favoriteManga => _favoriteManga;

  void addFavorite(String mangaId) {
    final newFavorite = MangaFavorite(mangaId: mangaId);
    if (!_favoriteManga.contains(newFavorite)) {
      _favoriteManga.add(newFavorite);
      saveList();
      notifyListeners();
    }
  }

  void removeFavorite(MangaFavorite manga) {
    if (_favoriteManga.contains(manga)) {
      _favoriteManga.remove(manga);
      saveList();
      notifyListeners();
    }
  }

  bool isFavorite(String mangaId) {
    return _favoriteManga.any((fav) => fav.mangaId == mangaId);
  }

  void loadFavorites(List<String> favoriteIds) {
    _favoriteManga = favoriteIds.map((id) => MangaFavorite(mangaId: id)).toList();
    notifyListeners();
  }

  Future<void> _loadList() async {
    final prefs = await SharedPreferences.getInstance();
    final mangaString = prefs.getString('favManga');
    _favoriteManga.clear();
    if (mangaString != null) {
      final List<MangaFavorite> mangaData = (jsonDecode(mangaString) as List)
          .map((item) => MangaFavorite.fromJson(item))
          .toList();
      _favoriteManga.addAll(mangaData);
    }
    notifyListeners();
  }

  Future<void> refreshFavorites() async {
    await _loadList();
  }

  void saveList() async {
    final prefs = await SharedPreferences.getInstance();
    final mangaString = jsonEncode(_favoriteManga.map((manga) => manga.toJson()).toList());
    prefs.setString('favManga', mangaString);
  }
}