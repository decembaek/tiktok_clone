import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/main_navigation/main_navigation_screen.dart';

enum Direction { right, left }

enum Page { first, second }

class TutorialScreen extends StatefulWidget {
  const TutorialScreen({super.key});

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  Direction _direction = Direction.right;
  Page _showingPage = Page.first;

  void _onPanUpdate(DragUpdateDetails details) {
    // dx 는 x 값
    if (details.delta.dx > 0) {
      // to the right
      setState(() {
        _direction = Direction.right;
      });
    } else {
      // to the left
      setState(() {
        _direction = Direction.left;
      });
    }
    // print(details);
  }

  // 사용자가 드래그 끝날때 실행
  void _onPanEnd(DragEndDetails details) {
    if (_direction == Direction.left) {
      setState(() {
        _showingPage = Page.second;
      });
    } else {
      setState(() {
        _showingPage = Page.first;
      });
    }
  }

  void _onEnterAppTap() {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => const MainNavigationScreen(),
      ),
      (route) {
        return false;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onPanUpdate 는 드래그 할때 사용
      onPanUpdate: _onPanUpdate,
      onPanEnd: _onPanEnd,
      child: Scaffold(
        // Fade in, Fade out 효과 추가
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size16,
          ),
          child: SafeArea(
            child: AnimatedCrossFade(
              // crossFadeState 처음에 보여줄 페이지
              crossFadeState: _showingPage == Page.first
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: const Duration(milliseconds: 300),
              firstChild: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gaps.v80,
                  Text(
                    "Watch cool videos!",
                    style: TextStyle(
                      fontSize: Sizes.size32,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Gaps.v20,
                  Text(
                    "Videos are personalized for you based on what you watch, like, and share.",
                    style: TextStyle(
                      fontSize: Sizes.size20,
                    ),
                  ),
                ],
              ),
              secondChild: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gaps.v80,
                  Text(
                    "Follow the rules",
                    style: TextStyle(
                      fontSize: Sizes.size32,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Gaps.v20,
                  Text(
                    "Take care of one another! BSG!",
                    style: TextStyle(
                      fontSize: Sizes.size20,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size24,
            ),
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 300),
              opacity: _showingPage == Page.first ? 0 : 1,
              child: CupertinoButton(
                onPressed: _onEnterAppTap,
                color: Theme.of(context).primaryColor,
                child: const Text("Enter the app!"),
              ),
            ),
          ),
        ),
      ),
    );
    // Tab Page Controller, length 페이지 계수 필수로 제작
    // page 계수만큼 옆으로 스크롤 가능
    // return DefaultTabController(
    //   length: 3,
    //   child: Scaffold(
    //     body: const SafeArea(
    //       // TabBarView
    //       child: TabBarView(
    //         children: [
    //           Padding(
    //             padding: EdgeInsets.symmetric(
    //               horizontal: Sizes.size24,
    //             ),
    //             child: Column(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: [
    //                 Gaps.v36,
    //                 Text(
    //                   "Watch cool videos!",
    //                   style: TextStyle(
    //                     fontSize: Sizes.size32,
    //                     fontWeight: FontWeight.w800,
    //                   ),
    //                 ),
    //                 Gaps.v20,
    //                 Text(
    //                   "Videos are personalized for you based on what you watch, like, and share.",
    //                   style: TextStyle(
    //                     fontSize: Sizes.size20,
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //           Padding(
    //             padding: EdgeInsets.symmetric(
    //               horizontal: Sizes.size24,
    //             ),
    //             child: Column(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: [
    //                 Gaps.v36,
    //                 Text(
    //                   "Follow the rulse",
    //                   style: TextStyle(
    //                     fontSize: Sizes.size32,
    //                     fontWeight: FontWeight.w800,
    //                   ),
    //                 ),
    //                 Gaps.v20,
    //                 Text(
    //                   "Videos are personalized for you based on what you watch, like, and share.",
    //                   style: TextStyle(
    //                     fontSize: Sizes.size20,
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //           Padding(
    //             padding: EdgeInsets.symmetric(
    //               horizontal: Sizes.size24,
    //             ),
    //             child: Column(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: [
    //                 Gaps.v36,
    //                 Text(
    //                   "Enjoy your ride",
    //                   style: TextStyle(
    //                     fontSize: Sizes.size32,
    //                     fontWeight: FontWeight.w800,
    //                   ),
    //                 ),
    //                 Gaps.v20,
    //                 Text(
    //                   "Videos are personalized for you based on what you watch, like, and share.",
    //                   style: TextStyle(
    //                     fontSize: Sizes.size20,
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //     bottomNavigationBar: BottomAppBar(
    //       child: Container(
    //         padding: const EdgeInsets.symmetric(
    //             // vertical: Sizes.size48,
    //             ),
    //         child: const Row(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: [
    //             // 현재 페이지 상태
    //             TabPageSelector(
    //               // indicatorSize: 30,
    //               selectedColor: Colors.black38,
    //               color: Colors.white,
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}
