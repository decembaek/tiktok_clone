import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VideoTimeLineScreen extends StatefulWidget {
  const VideoTimeLineScreen({super.key});

  @override
  State<VideoTimeLineScreen> createState() => _VideoTimeLineScreenState();
}

class _VideoTimeLineScreenState extends State<VideoTimeLineScreen> {
  @override
  Widget build(BuildContext context) {
    // PageView 스크롤 기능
    return PageView(
      // snapping bool
      // 4 m, 44 second
      pageSnapping: true,
      children: [
        Container(
          color: Colors.blue,
        ),
        Container(
          color: Colors.red,
        ),
        Container(
          color: Colors.amber,
        ),
        Container(
          color: Colors.green,
        ),
      ],
    );
  }
}
