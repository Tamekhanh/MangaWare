import 'package:flutter/material.dart';
import 'package:manga_reading_ware/responsive/desktop_responsive.dart';
import 'package:manga_reading_ware/responsive/mobile_responsive.dart';
import 'package:manga_reading_ware/responsive/tablet_responsive.dart';

class LayoutResponsive extends StatelessWidget {
  const LayoutResponsive({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth < 600) {
              return const MobileResponsive();
            } else if (constraints.maxWidth < 1200) {
              if (constraints.maxWidth > constraints.maxHeight) {
                if(constraints.maxHeight < 600) {
                  return const MobileResponsive();
                } else {
                  return TabletResponsive();
                }
              } else {
                return const TabletResponsive();
              }
            } else {
              return const DesktopResponsive();
            }
          }
      ),
    );
  }
}
