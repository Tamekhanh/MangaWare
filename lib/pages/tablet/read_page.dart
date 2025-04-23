import 'package:flutter/material.dart';
import 'package:manga_reading_ware/datas/manga_data.dart';
import 'package:manga_reading_ware/widgets/image_loader.dart';

class ReadPage extends StatelessWidget {
  ReadPage({super.key, required this.mangaId, required this.chapterId});

  final int mangaId;
  final int chapterId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: data[mangaId].chapters[chapterId].pages.length,
        itemBuilder: (context, index) {
          //https://api.allorigins.win/raw?url=
          return Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.75,
              child: ImageLoader(
                imageUrl:
                "${data[mangaId].chapters[chapterId].pages[index]}",
              ),
            ),
          );
        },
      ),
    );
  }
}
