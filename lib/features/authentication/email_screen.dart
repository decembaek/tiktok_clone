import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/password_screen.dart';
import 'package:tiktok_clone/features/authentication/widgets/form_button.dart';

class EmailScreen extends StatefulWidget {
  const EmailScreen({super.key});

  @override
  State<EmailScreen> createState() => _UsernameScreenState();
}

class _UsernameScreenState extends State<EmailScreen> {
  final TextEditingController _emailController = TextEditingController();

  String _email = "";

  @override
  void initState() {
    super.initState();

    _emailController.addListener(() {
      setState(() {
        _email = _emailController.text;
      });
    });
  }

  // 메모리 과다 사용으로 충돌 방지를 위한 dispose
  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  String? _isEmailValid() {
    if (_email.isEmpty) return null;
    // perform some val.
    final regExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!regExp.hasMatch(_email)) {
      return "Email not valiod";
    }
    return null;
  }

  // 포커스 종료, 보통 키보드 내릴 때 씀
  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void _onSubmit() {
    if (_email.isEmpty || _isEmailValid() != null) return;
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const PasswordScreen()),
    );
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
                "What is your email",
                style: TextStyle(
                  fontSize: Sizes.size20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Gaps.v16,
              TextField(
                // TextField 컨트롤러 입력감지
                controller: _emailController,
                // 키보드 타입 정하기
                keyboardType: TextInputType.emailAddress,
                // 앱 키보드에서 done 이나 완료 누를때 감지
                onEditingComplete: _onSubmit,
                // 자동완성 끄기
                autocorrect: false,
                decoration: InputDecoration(
                  hintText: "Email",
                  errorText: _isEmailValid(),
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
              Gaps.v16,
              GestureDetector(
                onTap: _onSubmit,
                child: FormButton(
                  disabled: _email.isEmpty || _isEmailValid() != null,
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
