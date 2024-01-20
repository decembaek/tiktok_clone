import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/widgets/form_button.dart';
import 'package:tiktok_clone/features/onboarding/interests_screen.dart';

class BirthdayScreen extends StatefulWidget {
  const BirthdayScreen({super.key});

  @override
  State<BirthdayScreen> createState() => _BirthdayScreenState();
}

class _BirthdayScreenState extends State<BirthdayScreen> {
  final TextEditingController _birthdayControlloer = TextEditingController();

  DateTime initialDate = DateTime.now();
  //print 찍으면 아래와 같은 형태
  //2024-01-07 18:20:45.225431

  @override
  void initState() {
    super.initState();
    initialDate = DateTime(initialDate.year - 12);
    _setTextFieldDate(initialDate);
  }

  // 메모리 과다 사용으로 충돌 방지를 위한 dispose
  @override
  void dispose() {
    _birthdayControlloer.dispose();
    super.dispose();
  }

  void _onNextTap() {
    // Navigator.of(context).push(
    //   MaterialPageRoute(
    //     builder: (context) => const InterestsScreen(),
    //   ),
    // );
    // push 하고 페이지 remove 관리 ture(뒤로가기 가능), false(뒤로가기 불가능 )
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => const InterestsScreen(),
      ),
      (route) {
        return false;
      },
    );
  }

  void _setTextFieldDate(DateTime date) {
    final textDate = date.toString().split(" ").first;
    _birthdayControlloer.value = TextEditingValue(text: textDate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        // foregroundColor: Colors.black,
        // backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Sign up",
          // style: TextStyle(
          //   fontSize: Sizes.size20,
          //   fontWeight: FontWeight.w600,
          // ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size28,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gaps.v20,
            const Text(
              "When's your birthday?",
              style: TextStyle(
                fontSize: Sizes.size20,
                fontWeight: FontWeight.w700,
              ),
            ),
            Gaps.v8,
            const Text(
              "Your birthday won't be shown publicly.",
              style: TextStyle(
                fontSize: Sizes.size14,
                color: Colors.black54,
                fontWeight: FontWeight.w500,
              ),
            ),
            Gaps.v16,
            TextField(
              // enabled 입력 가능 여부
              enabled: false,
              // TextField 컨트롤러 입력감지
              controller: _birthdayControlloer,
              decoration: InputDecoration(
                // focus off 상태
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                ),
                // focus on 상태
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              style: const TextStyle(
                color: Colors.black,
              ),
              // cursor 색상
              cursorColor: Theme.of(context).primaryColor,
            ),
            Gaps.v16,
            GestureDetector(
              onTap: _onNextTap,
              child: const FormButton(
                disabled: false,
                buttonText: "Next",
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 300,
        // Cupertino 는 APPLE에 디자인 패턴을 토대로 제작함,
        child: SizedBox(
          height: 300,
          child: CupertinoDatePicker(
            // 달력 모드
            mode: CupertinoDatePickerMode.date,
            // 최대 선택 날짜
            maximumDate: initialDate,
            initialDateTime: initialDate,
            onDateTimeChanged: _setTextFieldDate,
          ),
        ),
      ),
    );
  }
}
