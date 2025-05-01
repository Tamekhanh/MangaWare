import 'package:flutter/material.dart';
import 'package:manga_reading_ware/pages/tablet/favorite_page.dart';
import 'package:manga_reading_ware/pages/tablet/home_page.dart';

class TabletResponsive extends StatefulWidget {
  const TabletResponsive({super.key});

  @override
  _TabletResponsiveState createState() => _TabletResponsiveState();
}

class _TabletResponsiveState extends State<TabletResponsive> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    int width = 0;
    if (screenWidth < 700) {
      width = 1;
    } else if (screenWidth < 850) {
      width = 2;
    }

    List<Widget> pages = [
      HomePage(width: width),
      const Placeholder(), // You can add a SearchPage() here
      FavoritePage(width: width),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('MangaWare'),
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
                setState(() {
                  _selectedIndex = 0;
                });
                Navigator.pop(context); // Close the drawer after selection
              },
            ),
            ListTile(
              leading: Icon(Icons.favorite),
              title: const Text('Favorites'),
              onTap: () {
                setState(() {
                  _selectedIndex = 2;
                });
                Navigator.pop(context); // Close the drawer after selection
              },
            ),
          ],
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return pages[_selectedIndex];
        },
      ),
    );
  }
}