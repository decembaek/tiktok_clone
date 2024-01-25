import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;

  final screens = [
    const Center(
      child: Text("Home"),
    ),
    const Center(
      child: Text("Search"),
    ),
    const Center(
      child: Text("1"),
    ),
    const Center(
      child: Text("2"),
    ),
    const Center(
      child: Text("3"),
    ),
  ];

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onTap,
        destinations: const [
          NavigationDestination(
            icon: FaIcon(
              FontAwesomeIcons.house,
              color: Colors.teal,
            ),
            label: "Home",
          ),
          NavigationDestination(
            icon: FaIcon(
              FontAwesomeIcons.magnifyingGlass,
              color: Colors.amber,
            ),
            label: "Search",
          ),
        ],
      ),
      // bottomNavigationBar 아래에 선택 네비게이션
      // Type을 정할 수 있음
      // bottomNavigationBar: BottomNavigationBar(
      //   // 선택시 색상
      //   selectedItemColor: Theme.of(context).primaryColor,
      //   // unselectedItemColor: Color,
      //   // 현재 페이지 인덱스
      //   currentIndex: _selectedIndex,
      //   onTap: _onTap,
      //   items: const [
      //     BottomNavigationBarItem(
      //         icon: FaIcon(FontAwesomeIcons.house),
      //         label: "Home",
      //         tooltip: "Hello World",
      //         backgroundColor: Colors.amber),
      //     BottomNavigationBarItem(
      //         icon: FaIcon(FontAwesomeIcons.magnifyingGlass),
      //         label: "Search",
      //         tooltip: "Hello World",
      //         backgroundColor: Colors.blue),
      //     BottomNavigationBarItem(
      //         icon: FaIcon(FontAwesomeIcons.magnifyingGlass),
      //         label: "Search",
      //         tooltip: "Hello World",
      //         backgroundColor: Colors.red),
      //     BottomNavigationBarItem(
      //         icon: FaIcon(FontAwesomeIcons.magnifyingGlass),
      //         label: "Search",
      //         tooltip: "Hello World",
      //         backgroundColor: Colors.black),
      //     BottomNavigationBarItem(
      //         icon: FaIcon(FontAwesomeIcons.magnifyingGlass),
      //         label: "Search",
      //         tooltip: "Hello World",
      //         backgroundColor: Colors.green),
      //   ],
      // ),
    );
  }
}
