import 'package:flutter/material.dart';
import 'package:manga_reading_ware/pages/desktop/home_page.dart';

class DesktopResponsive extends StatelessWidget {
  const DesktopResponsive({super.key});

  @override
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
                      // Handle navigation to home page
                    },
                  ),
                  ListTile(
                    title: const Text('Settings'),
                    onTap: () {
                      // Handle navigation to settings page
                    },
                  ),
                ],
              ),
            ),
            Expanded(child: HomePage()),
          ],
        )
    );
  }
}
