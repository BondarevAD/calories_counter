import 'package:calories_counter/presentation/pages/main/tabs/profile_body/profile_body.dart';
import 'package:calories_counter/presentation/pages/main/utils/main_tab.dart';
import 'package:calories_counter/presentation/pages/main/tabs/home_body/home_body.dart';
import 'package:calories_counter/presentation/pages/main/tabs/search_body/search_body.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  MainTabs tab = MainTabs.home;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      body: _body,
      bottomNavigationBar: _bottomNavigationBar,
    );
  }

  AppBar get _appBar {
    return AppBar(
      title: Text(tab.title),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.more_vert,
          ),
        )
      ],
    );
  }

  Widget get _body {
    switch (tab) {
      case MainTabs.home:
        return HomeBody();
      case MainTabs.search:
        return SearchBody();
      case MainTabs.profile:
        return ProfileBody();
    }
  }

  Widget get _bottomNavigationBar {
    return BottomNavigationBar(
      currentIndex: tab.index,
      onTap: (index) {
        setState(() {
          tab = MainTabs.values[index];
        });
      },
      unselectedItemColor: Colors.grey,
      selectedItemColor: Colors.blue,
      items: MainTabs.values
          .map(
            (tab) => BottomNavigationBarItem(
              icon: Icon(tab.icon),
              label: "",
            ),
          )
          .toList(),
    );
  }
}
