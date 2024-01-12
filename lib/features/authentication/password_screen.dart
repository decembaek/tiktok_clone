import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/widgets/form_button.dart';
import 'package:tiktok_clone/features/birthday_screen.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _UsernameScreenState();
}

class _UsernameScreenState extends State<PasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();

  String _password = "";

  bool _obscureText = true;

  @override
  void initState() {
    super.initState();

    _passwordController.addListener(() {
      setState(() {
        _password = _passwordController.text;
      });
    });
  }

  // 메모리 과다 사용으로 충돌 방지를 위한 dispose
  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  bool _isPasswordValid() {
    return _password.isNotEmpty && _password.length > 8;
  }

  // 포커스 종료, 보통 키보드 내릴 때 씀
  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void _onSubmit() {
    if (!_isPasswordValid()) return;
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const BirthdayScreen()),
    );
  }

  // text 작성 삭제 기능
  void _onClearTap() {
    _passwordController.clear();
  }

  void _toggleObscureText() {
    // if (_obscureText == true) {
    //   _obscureText = false;
    // } else {
    //   _obscureText = true;
    // }
    _obscureText = !_obscureText;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // 포커스 종료, 보통 키보드 내릴 때 씀
      onTap: _onScaffoldTap,
      child: Scaffold(
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
                "Password",
                style: TextStyle(
                  fontSize: Sizes.size20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Gaps.v16,
              TextField(
                // obscureText 비밀번호 가리기, 모자이크
                obscureText: _obscureText,
                // TextField 컨트롤러 입력감지
                controller: _passwordController,
                // 앱 키보드에서 done 이나 완료 누를때 감지
                onEditingComplete: _onSubmit,
                // 자동완성 끄기
                autocorrect: false,
                decoration: InputDecoration(
                  // prefixIcon: const Icon(Icons.ac_unit),
                  // suffixIcon: const Icon(Icons.access_alarm),
                  suffix: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: _onClearTap,
                        child: FaIcon(
                          FontAwesomeIcons.circleXmark,
                          color: Colors.grey.shade400,
                          size: Sizes.size20,
                        ),
                      ),
                      Gaps.h16,
                      GestureDetector(
                        onTap: _toggleObscureText,
                        child: FaIcon(
                          _obscureText
                              ? FontAwesomeIcons.eyeSlash
                              : FontAwesomeIcons.eye,
                          color: Colors.grey.shade400,
                          size: Sizes.size20,
                        ),
                      ),
                    ],
                  ),
                  hintText: "Make it strong!",
                  // focus off 상태
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                    ),
                  ),
                  // focus on 상태
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                    ),
                  ),
                ),
                // cursor 색상
                cursorColor: Theme.of(context).primaryColor,
              ),
              Gaps.v10,
              const Text(
                "Your password must have ",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              Gaps.v10,
              Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.circleCheck,
                    color: _isPasswordValid()
                        ? Colors.green
                        : Colors.grey.shade400,
                  ),
                  Gaps.h10,
                  const Text("8 to 20 character"),
                ],
              ),
              Gaps.v28,
              GestureDetector(
                onTap: _onSubmit,
                child: FormButton(
                  disabled: !_isPasswordValid(),
                  buttonText: "Next",
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
