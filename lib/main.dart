import 'package:flutter/material.dart';
import 'package:manga_reading_ware/datas/manga_data.dart';
import 'package:manga_reading_ware/pages/mobile/home_page.dart';
import 'package:manga_reading_ware/responsive/layout_responsive.dart';
import 'package:manga_reading_ware/widgets/image_loader.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
      ),
      debugShowCheckedModeBanner: false,
      home: LayoutResponsive()
    );
  }
}

