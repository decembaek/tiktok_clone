import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/main_navigation/stf_screen.dart';
import 'package:tiktok_clone/features/main_navigation/widgets/nav_tab.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;

  // final screens = [
  //   StfScreen(key: GlobalKey()),
  //   StfScreen(key: GlobalKey()),
  //   Container(),
  //   StfScreen(key: GlobalKey()),
  //   StfScreen(key: GlobalKey()),
  // const Center(
  //   child: Text("Home"),
  // ),
  // const Center(
  //   child: Text("Discover"),
  // ),
  // Container(),
  // const Center(
  //   child: Text("InBox"),
  // ),
  // const Center(
  //   child: Text("Profile"),
  // ),
  // ];

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: screens[_selectedIndex],
      // body: screens.elementAt(_selectedIndex),
      // Stack -> Offstage 는 랜더는 되어있지만 안 보임
      // render 랜더가 되기 떄문에 너무 남발하면 앱 성능 감소 할수도 있음, 조심히 사용해야함
      body: Stack(
        children: [
          Offstage(
            // true 면 숨김, false 면 보임
            offstage: _selectedIndex != 0,
            child: const StfScreen(),
          ),
          Offstage(
            // true 면 숨김, false 면 보임
            offstage: _selectedIndex != 1,
            child: const StfScreen(),
          ),
          Offstage(
            // true 면 숨김, false 면 보임
            offstage: _selectedIndex != 3,
            child: const StfScreen(),
          ),
          Offstage(
            // true 면 숨김, false 면 보임
            offstage: _selectedIndex != 4,
            child: const StfScreen(),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(Sizes.size2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              NavTab(
                text: "Home",
                isSelected: _selectedIndex == 0,
                icon: FontAwesomeIcons.house,
                selectedIcon: FontAwesomeIcons.house,
                onTap: () => _onTap(0),
              ),
              NavTab(
                text: "Discover",
                isSelected: _selectedIndex == 1,
                icon: FontAwesomeIcons.magnifyingGlass,
                selectedIcon: FontAwesomeIcons.compass,
                onTap: () => _onTap(1),
              ),
              Gaps.h24,
              Stack(
                children: [
                  // 6분 45초
                  // Positioned 는 Stack 내부의 element를 이동시킬 수 있게 해줌
                  Positioned(
                    right: 20,
                    child: Container(
                      height: 30,
                      width: 25,
                      padding: const EdgeInsets.symmetric(
                        horizontal: Sizes.size8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(
                          Sizes.size11,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    child: Container(
                      height: 30,
                      width: 25,
                      padding: const EdgeInsets.symmetric(
                        horizontal: Sizes.size8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(
                          Sizes.size11,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 30,
                    decoration: const BoxDecoration(color: Colors.white),
                    child: const Center(
                      child: FaIcon(
                        FontAwesomeIcons.plus,
                        color: Colors.black,
                      ),
                    ),
                  )
                ],
              ),
              NavTab(
                text: "Inbox",
                isSelected: _selectedIndex == 3,
                icon: FontAwesomeIcons.message,
                selectedIcon: FontAwesomeIcons.solidMessage,
                onTap: () => _onTap(3),
              ),
              NavTab(
                text: "Profile",
                isSelected: _selectedIndex == 4,
                icon: FontAwesomeIcons.user,
                selectedIcon: FontAwesomeIcons.solidUser,
                onTap: () => _onTap(4),
              ),
              // Column(
              //   // Column 자리 차지하는 크기 설정하기
              //   mainAxisSize: MainAxisSize.min,
              //   children: [
              //     FaIcon(
              //       FontAwesomeIcons.house,
              //       color: Colors.white,
              //     ),
              //     Gaps.v5,
              //     Text(
              //       "Home",
              //       style: TextStyle(color: Colors.white),
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
    // return CupertinoTabScaffold(
    //   tabBar: CupertinoTabBar(
    //     items: const [
    //       BottomNavigationBarItem(
    //         // icon: FaIcon(FontAwesomeIcons.house),
    //         icon: Icon(CupertinoIcons.house),
    //         label: "Home",
    //       ),
    //       BottomNavigationBarItem(
    //         // icon: FaIcon(FontAwesomeIcons.magnifyingGlass),
    //         icon: Icon(CupertinoIcons.search),
    //         label: "Search",
    //       ),
    //     ],
    //   ),
    //   tabBuilder: (context, index) => screens[index],
    // );
    // return Scaffold(
    //   body: screens[_selectedIndex],
    //   bottomNavigationBar: NavigationBar(
    //     labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
    //     selectedIndex: _selectedIndex,
    //     onDestinationSelected: _onTap,
    //     destinations: const [
    //       NavigationDestination(
    //         icon: FaIcon(
    //           FontAwesomeIcons.house,
    //           color: Colors.teal,
    //         ),
    //         label: "Home",
    //       ),
    //       NavigationDestination(
    //         icon: FaIcon(
    //           FontAwesomeIcons.magnifyingGlass,
    //           color: Colors.amber,
    //         ),
    //         label: "Search",
    //       ),
    //     ],
    //   ),
    //   // bottomNavigationBar 아래에 선택 네비게이션
    //   // Type을 정할 수 있음
    //   // bottomNavigationBar: BottomNavigationBar(
    //   //   // 선택시 색상
    //   //   selectedItemColor: Theme.of(context).primaryColor,
    //   //   // unselectedItemColor: Color,
    //   //   // 현재 페이지 인덱스
    //   //   currentIndex: _selectedIndex,
    //   //   onTap: _onTap,
    //   //   items: const [
    //   //     BottomNavigationBarItem(
    //   //         icon: FaIcon(FontAwesomeIcons.house),
    //   //         label: "Home",
    //   //         tooltip: "Hello World",
    //   //         backgroundColor: Colors.amber),
    //   //     BottomNavigationBarItem(
    //   //         icon: FaIcon(FontAwesomeIcons.magnifyingGlass),
    //   //         label: "Search",
    //   //         tooltip: "Hello World",
    //   //         backgroundColor: Colors.blue),
    //   //     BottomNavigationBarItem(
    //   //         icon: FaIcon(FontAwesomeIcons.magnifyingGlass),
    //   //         label: "Search",
    //   //         tooltip: "Hello World",
    //   //         backgroundColor: Colors.red),
    //   //     BottomNavigationBarItem(
    //   //         icon: FaIcon(FontAwesomeIcons.magnifyingGlass),
    //   //         label: "Search",
    //   //         tooltip: "Hello World",
    //   //         backgroundColor: Colors.black),
    //   //     BottomNavigationBarItem(
    //   //         icon: FaIcon(FontAwesomeIcons.magnifyingGlass),
    //   //         label: "Search",
    //   //         tooltip: "Hello World",
    //   //         backgroundColor: Colors.green),
    //   //   ],
    //   // ),
    // );
  }
}
