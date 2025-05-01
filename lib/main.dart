import 'package:flutter/material.dart';
import 'package:manga_reading_ware/datas/manga_data.dart';
import 'package:manga_reading_ware/pages/mobile/home_page.dart';
import 'package:manga_reading_ware/providers/favoriteManga.dart';
import 'package:manga_reading_ware/responsive/layout_responsive.dart';
import 'package:manga_reading_ware/widgets/image_loader.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FavoriteProvider()),
        // add other providers if needed
      ],
      child: MyApp(), // hoặc App() tùy tên widget bạn dùng
    ),
  );
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

