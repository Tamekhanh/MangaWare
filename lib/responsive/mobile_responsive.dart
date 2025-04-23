import 'package:flutter/material.dart';
import 'package:manga_reading_ware/pages/mobile/home_page.dart';

class MobileResponsive extends StatelessWidget {
  const MobileResponsive({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MangaWare'),
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth < 350) {
          return const HomePage(width: 0);
        } else if (constraints.maxWidth < 510) {
          return const HomePage(width: 1);
        } else {
          return const HomePage(width: 2);
        }
      }),
      bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorites',
            ),
          ],
      ),
    );
  }
}
