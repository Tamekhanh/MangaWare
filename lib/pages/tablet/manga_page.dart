import 'package:flutter/material.dart';
import 'package:manga_reading_ware/datas/manga_data.dart';
import 'package:manga_reading_ware/pages/tablet/chapter_layout.dart';
import 'package:manga_reading_ware/providers/favoriteManga.dart';
import 'package:provider/provider.dart';

class MangaPage extends StatefulWidget {
  const MangaPage({super.key, required this.mangaId});

  final int mangaId;

  @override
  State<MangaPage> createState() => _MangaPageState();
}

class _MangaPageState extends State<MangaPage> {
  bool isHidden = true;
  @override
  Widget build(BuildContext context) {
    final manga = data[widget.mangaId];
    final isFavorite = Provider.of<FavoriteProvider>(context).isFavorite(widget.mangaId.toString());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Manga Page'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Cover + Title + Button
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Cover + Button
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            manga.coverImageUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 12),
                        FilledButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChapterLayout(mangaId: widget.mangaId, chapterId: 0),
                              ),
                            );
                          },
                          child: const Text("Read First Chapter"),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.blue),
                            foregroundColor: MaterialStateProperty.all(Colors.white),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        OutlinedButton(
                          onPressed: () {
                            final favoriteProvider = Provider.of<FavoriteProvider>(context, listen: false);
                            final mangaIdStr = widget.mangaId.toString();

                            if (favoriteProvider.isFavorite(mangaIdStr)) {
                              final toRemove = favoriteProvider.favoriteManga.firstWhere((fav) => fav.mangaId == mangaIdStr);
                              favoriteProvider.removeFavorite(toRemove);
                            } else {
                              favoriteProvider.addFavorite(mangaIdStr);
                            }
                          },
                          child: Text(isFavorite ? "Remove from Favorites" : "Add to Favorites"),
                          style: ButtonStyle(
                            overlayColor: MaterialStateProperty.all(Colors.pink),
                            foregroundColor: MaterialStateProperty.all(Colors.pink),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Title
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          manga.title,
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          manga.author,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // Description
              Text(
                manga.description,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                maxLines: isHidden ? 3 : null,
              ),
              Container(
                width: double.infinity,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      isHidden = !isHidden;
                    });
                  },
                  child: Text(isHidden ? "Show More" : "Show Less"),
                ),
              ),
              const SizedBox(height: 24),

              const Text(
                "Chapters",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              // Chapter List
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                reverse: true,
                itemCount: manga.chapters.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFCCCCCC),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: ListTile(
                        title: Text(
                          manga.chapters[index].chapterTitle,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ChapterLayout(mangaId: widget.mangaId, chapterId: index),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}