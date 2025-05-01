import 'package:flutter/material.dart';
import 'package:manga_reading_ware/pages/mobile/favorite_page.dart';
import 'package:manga_reading_ware/pages/mobile/home_page.dart';

class MobileResponsive extends StatefulWidget {
  const MobileResponsive({super.key});

  @override
  State<MobileResponsive> createState() => _MobileResponsiveState();
}

class _MobileResponsiveState extends State<MobileResponsive> {
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
      HomePage(width: width),
      FavoritePage(width: width),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MangaWare'),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
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