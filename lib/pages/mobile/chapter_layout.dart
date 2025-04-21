import 'package:flutter/material.dart';
import 'package:manga_reading_ware/datas/manga_data.dart';
import 'package:manga_reading_ware/pages/mobile/read_page.dart';

class ChapterLayout extends StatefulWidget {
  ChapterLayout({super.key, required this.mangaId, required this.chapterId});

  int _selectedIndex = 0;
  final int mangaId;
  final int chapterId;
  @override
  State<ChapterLayout> createState() => _ChapterLayoutState();

}

class _ChapterLayoutState extends State<ChapterLayout> {
  @override
  void initState() {
    super.initState();
    widget._selectedIndex = widget.chapterId; // Set selectedIndex from passed chapterId
  }
  @override
  Widget build(BuildContext context) {
    final totalChapters = data[widget.mangaId].chapters.length;
    final isLastChapter = widget._selectedIndex == totalChapters - 1;
    final isFirstChapter = widget._selectedIndex == 0;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Quay lại MangaPage
          },
        ),
        title: Text('Reading Manga'),
      ),
      body: ReadPage(mangaId: widget.mangaId, chapterId: widget._selectedIndex,),
      bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.arrow_back,
                color: isFirstChapter ? Colors.grey : Colors.blue,),
              label: 'Previous',
            ),
            BottomNavigationBarItem(
              icon: SizedBox.shrink(),
              label: '${data[widget.mangaId].chapters[widget._selectedIndex].chapterTitle}',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                  Icons.arrow_forward,
                color: isLastChapter ? Colors.grey : Colors.blue,
              ),
              label: 'Next',
            ),
          ],
        onTap: (index) {
          setState(() {
            if (index == 0) {
              widget._selectedIndex = (widget._selectedIndex - 1).clamp(0, data[widget.mangaId].chapters.length - 1);
            } else if (index == 2) {
              widget._selectedIndex = (widget._selectedIndex + 1).clamp(0, data[widget.mangaId].chapters.length - 1);
            }
          });
        },
      ),
    );
  }
}
