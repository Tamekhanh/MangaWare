import 'package:flutter/material.dart';
import 'package:manga_reading_ware/pages/desktop/favorite_page.dart';
import 'package:manga_reading_ware/pages/desktop/home_page.dart';

class DesktopResponsive extends StatefulWidget {
  const DesktopResponsive({super.key});

  @override
  State<DesktopResponsive> createState() => _DesktopResponsiveState();
}

class _DesktopResponsiveState extends State<DesktopResponsive> {
  int _selectedIndex = 0;

  late List<Widget> _pages;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Determine width for responsive HomePage
    final screenWidth = MediaQuery.of(context).size.width;
    int width = 2;
    if (screenWidth < 350) {
      width = 0;
    } else if (screenWidth < 510) {
      width = 1;
    }

    _pages = [
      HomePage(),
      FavoritePage(),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  Widget build(BuildContext context) {
    return Scaffold (
        body: Row(
          children: [
            Drawer(
              width: 250,
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                    ),
                    child: const Text(
                      'MangaWare',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                      ),
                    ),
                  ),
                  ListTile(
                    title: const Text('Home'),
                    onTap: () {
                      _onItemTapped(0);
                    },
                  ),
                  ListTile(
                    title: const Text('Favorite'),
                    onTap: () {
                      _onItemTapped(1);
                    },
                  ),
                ],
              ),
            ),
            Expanded(child:
              _pages[_selectedIndex]
            ),
          ],
        )
    );
  }
}
