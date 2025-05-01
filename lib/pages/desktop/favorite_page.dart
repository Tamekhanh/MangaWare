import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:manga_reading_ware/providers/favoriteManga.dart';
import 'package:manga_reading_ware/models/manga_model.dart';
import 'package:manga_reading_ware/datas/manga_data.dart';
import 'package:manga_reading_ware/pages/desktop/manga_page.dart';

class FavoritePage extends StatefulWidget {

  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  bool _loaded = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_loaded) {
      Provider.of<FavoriteProvider>(context, listen: false).refreshFavorites();
      _loaded = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final favorites = context.watch<FavoriteProvider>().favoriteManga;

    if (favorites.isEmpty) {
      return const Center(child: Text('No favorites yet.'));
    }

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 6,
        childAspectRatio: 0.55,
      ),
      itemCount: favorites.length,
      itemBuilder: (context, index) {
        final mangaId = int.tryParse(favorites[index].mangaId);
        if (mangaId == null || mangaId >= data.length) {
          return const SizedBox(); // Nếu lỗi ID hoặc ID không hợp lệ
        }

        final manga = data[mangaId];

        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MangaPage(mangaId: mangaId),
              ),
            );
          },
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  manga.coverImageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Text(
                    manga.title,
                    style: const TextStyle(
                      fontSize: 16,
                      overflow: TextOverflow.ellipsis,
                    ),
                    maxLines: 2,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
