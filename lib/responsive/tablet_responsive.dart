import 'package:flutter/material.dart';
import 'package:manga_reading_ware/pages/tablet/home_page.dart';

class TabletResponsive extends StatelessWidget {
  const TabletResponsive({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manga ReadWare'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Manga ReadWare'),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                // Handle item tap
              },
            ),
            ListTile(
              leading: Icon(Icons.search),
              title: const Text('Search'),
              onTap: () {
                // Handle item tap
              },
            ),
            ListTile(
              leading: Icon(Icons.favorite),
              title: const Text('Favorites'),
              onTap: () {
                // Handle item tap
              },
            ),
          ],
        ),
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth < 700) {
          return const HomePage(width: 1);
        } else if (constraints.maxWidth < 850) {
          return const HomePage(width: 2);
        } else {
          return const HomePage(width: 0);
        }
      }),
    );
  }
}
