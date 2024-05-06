import 'package:flutter/material.dart';

enum MainTabs {
  home,
  search,
  profile,
}

extension MainTabsExt on MainTabs {
  IconData get icon {
    switch (this) {
      case MainTabs.home:
        return Icons.home;
      case MainTabs.search:
        return Icons.search;
      case MainTabs.profile:
        return Icons.person;
    }
  }

  String get title {
    switch (this) {
      case MainTabs.home:
        return "";
      case MainTabs.search:
        return "Find products";
      case MainTabs.profile:
        return "Profile";
    }
  }
}
