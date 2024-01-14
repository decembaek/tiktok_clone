import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/onboarding/tutorial_screen.dart';
import 'package:tiktok_clone/features/onboarding/widgets/interest_button.dart';

const interests = [
  "Daily Life",
  "Comedy",
  "Entertainment",
  "Animals",
  "Food",
  "Beauty & Style",
  "Drama",
  "Learning",
  "Talent",
  "Sports",
  "Auto",
  "Family",
  "Fitness & Health",
  "DIY & Life Hacks",
  "Arts & Crafts",
  "Dance",
  "Outdoors",
  "Oddly Satisfying",
  "Home & Garden",
  "Daily Life",
  "Comedy",
  "Entertainment",
  "Animals",
  "Food",
  "Beauty & Style",
  "Drama",
  "Learning",
  "Talent",
  "Sports",
  "Auto",
  "Family",
  "Fitness & Health",
  "DIY & Life Hacks",
  "Arts & Crafts",
  "Dance",
  "Outdoors",
  "Oddly Satisfying",
  "Home & Garden",
];

class InterestsScreen extends StatefulWidget {
  const InterestsScreen({super.key});

  @override
  State<InterestsScreen> createState() => _InterestsScreenState();
}

class _InterestsScreenState extends State<InterestsScreen> {
  // ScrollController
  final ScrollController _scrollController = ScrollController();

  bool _showTitle = false;

  void _onScroll() {
    if (_scrollController.offset > 100) {
      // 만약 계속 100 이상이면 무한 실행이 되니 이미 true 면 그냥 리턴
      if (_showTitle) return;
      setState(() {
        _showTitle = true;
      });
    } else {
      setState(() {
        _showTitle = false;
      });
    }
  }

  void _onNextTop() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const TutorialScreen(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      _onScroll();
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // 투명도 애니메이션
        title: AnimatedOpacity(
          opacity: _showTitle ? 1 : 0,
          duration: const Duration(microseconds: 300),
          child: const Text("Choose your interests"),
        ),
      ),
      // 스크롤바 생성
      body: Scrollbar(
        controller: _scrollController,
        child: SingleChildScrollView(
          // controller 추가
          controller: _scrollController,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size24,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gaps.v12,
                const Text(
                  "Choose your interests",
                  style: TextStyle(
                    fontSize: Sizes.size40,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Gaps.v24,
                const Text(
                  "Get better video recommendations",
                  style: TextStyle(
                    fontSize: Sizes.size20,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Gaps.v52,
                // Wrap 은 children 을 가로로 정렬하는데
                // 사이즈가 넘어가면 아래줄로 넘어감
                Wrap(
                  runSpacing: 20,
                  spacing: 20,
                  children: [
                    for (var interest in interests)
                      InterestButton(interest: interest)
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: Sizes.size96,
        elevation: 1,
        child: Padding(
          padding: const EdgeInsets.only(
            // bottom: Sizes.size80,
            top: Sizes.size16,
            left: Sizes.size24,
            right: Sizes.size24,
          ),
          // child: Container(
          //   alignment: Alignment.center,
          //   padding: const EdgeInsets.symmetric(
          //       // vertical: Sizes.size10,
          //       // horizontal: Sizes.size12,
          //       ),
          //   decoration: BoxDecoration(
          //     color: Theme.of(context).primaryColor,
          //   ),
          //   child: const Text(
          //     "Next",
          //     textAlign: TextAlign.center,
          //     style: TextStyle(
          //       fontSize: Sizes.size16,
          //       color: Colors.white,
          //       fontWeight: FontWeight.w600,
          //     ),
          //   ),
          // ),
          // Button 디자인할때 Cupertino 쓰면 편함
          child: CupertinoButton(
            onPressed: _onNextTop,
            color: Theme.of(context).primaryColor,
            child: const Text("Next"),
          ),
        ),
      ),
    );
  }
}
