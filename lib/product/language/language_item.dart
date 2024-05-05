enum LanguageItem { reqresApiUses, drawerHeader, home, business, school }

extension LanguageItemExtension on LanguageItem {
  String languageItem() {
    switch (this) {
      case LanguageItem.reqresApiUses:
        return 'Reqres Api Use';
      case LanguageItem.drawerHeader:
        return 'Drawer Header';
      case LanguageItem.home:
        return 'Home';
      case LanguageItem.business:
        return 'Business';
      case LanguageItem.school:
        return 'School';
    }
  }
}
