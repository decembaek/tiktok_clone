import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_clone/features/videos/widgets/video_post.dart';

class VideoTimeLineScreen extends StatefulWidget {
  const VideoTimeLineScreen({super.key});

  @override
  State<VideoTimeLineScreen> createState() => _VideoTimeLineScreenState();
}

class _VideoTimeLineScreenState extends State<VideoTimeLineScreen> {
  int _itemCount = 4;

  final PageController _pageController = PageController();

  final _scrollDuration = const Duration(milliseconds: 250);
  final _scrollCurve = Curves.linear;

  // List<Color> colors = [
  //   Colors.blue,
  //   Colors.red,
  //   Colors.yellow,
  //   Colors.teal,
  // ];

  void _onPageChanged(int page) {
    // page controller
    _pageController.animateToPage(
      page,
      duration: _scrollDuration,
      curve: _scrollCurve,
    );
    if (page == _itemCount - 1) {
      _itemCount = _itemCount + 4;
      // colors.addAll([
      //   Colors.blue,
      //   Colors.red,
      //   Colors.yellow,
      //   Colors.teal,
      // ]);
      setState(() {});
    }
  }

  void _onVideoFinished() {
    _pageController.nextPage(
      duration: _scrollDuration,
      curve: _scrollCurve,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // PageView 스크롤 기능
    return PageView.builder(
      controller: _pageController,
      // snapping bool
      pageSnapping: true,
      // scrollDirection 비디오 스크롤 방향
      scrollDirection: Axis.vertical,
      onPageChanged: _onPageChanged,
      itemCount: _itemCount,
      itemBuilder: (context, index) => VideoPost(
        onVideoFinished: _onVideoFinished,
        // color: colors[index],
        // child: Center(
        //   child: Text(
        //     "Screen $index",
        //     style: const TextStyle(
        //       fontSize: 68,
        //     ),
        //   ),
        // ),
      ),
      // children: [
      //   Container(
      //     color: Colors.blue,
      //   ),
      //   Container(
      //     color: Colors.red,
      //   ),
      //   Container(
      //     color: Colors.amber,
      //   ),
      //   Container(
      //     color: Colors.green,
      //   ),
      // ],
    );
  }
}
