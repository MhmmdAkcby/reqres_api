import 'package:flutter/material.dart';
import 'package:reqres_api/product/language/language_item.dart';

class NawDrawer extends StatelessWidget {
  const NawDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: _NawColor.blueColor,
            ),
            child: Text(LanguageItem.drawerHeader.languageItem(), style: const TextStyle(color: _NawColor.whiteColor)),
          ),
          ListTile(
            title: Text(LanguageItem.home.languageItem()),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text(LanguageItem.business.languageItem()),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text(LanguageItem.school.languageItem()),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

class _NawColor {
  static const blueColor = Colors.blue;
  static const whiteColor = Colors.white;
}
