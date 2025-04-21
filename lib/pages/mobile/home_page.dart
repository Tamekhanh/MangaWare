import 'package:flutter/material.dart';
import 'package:manga_reading_ware/datas/manga_data.dart';
import 'package:manga_reading_ware/pages/mobile/manga_page.dart';
import 'package:manga_reading_ware/pages/mobile/read_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.width});

  final int width;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: width == 1 ? 2 : width == 2 ? 3 : 1,
              childAspectRatio: 0.55,
            ),
            itemCount: data.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MangaPage(mangaId: index),
                    ),
                  );
                },
                child: Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        child: Image.network(
                            data[index].coverImageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: Text(
                            data[index].title,
                            style: const TextStyle(
                              fontSize: 16,
                              overflow: TextOverflow.ellipsis,

                            ),
                          textAlign: TextAlign.start,
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
        ),
      ),
    );
  }
}
