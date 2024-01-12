import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/widgets/form_button.dart';
import 'package:tiktok_clone/features/onboarding/interests_screen.dart';

class LoginFormScreen extends StatefulWidget {
  const LoginFormScreen({super.key});

  @override
  State<LoginFormScreen> createState() => _LoginFormScreenState();
}

class _LoginFormScreenState extends State<LoginFormScreen> {
  // GlobalKey 공부 필요
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Map<String, String> formData = {};

  // 유휴성 검사 방법
  void _onSubmitTap() {
    // 하나라도 값이 문제있으면 false 날라옴
    // _formKey.currentState?.validate();
    // ?는 이제 NULL 일수도 있음을 의미함, !는 절대 NULL 이 아니라고 의미함
    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        // save 하면 Form 마다 onSaved 실행
        _formKey.currentState!.save();

        // 임시 코드
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const InterestsScreen(),
          ),
        );
        // print(formData);
      }
    }

    // _formKey.currentState?.validate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Log in"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size28,
        ),
        // Form 제작하기, TextFormField
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Gaps.v28,
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Email",
                ),
                //validator is 유효성 검사
                validator: (value) {
                  // return "I don't like your email";
                  if (value != null && value.isEmpty) {
                    return "Plase write your eamil";
                  }
                  return null;
                },
                // callback 콜백 함수
                onSaved: (newValue) {
                  if (newValue != null) {
                    formData["email"] = newValue;
                  }
                },
              ),
              Gaps.v16,
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Password",
                ),
                validator: (value) {
                  // return "wrong password"; 오류 메세지
                  if (value != null && value.isEmpty) {
                    return "Plase write your password";
                  }
                  return null;
                },
                onSaved: (newValue) {
                  if (newValue != null) {
                    formData["Password"] = newValue;
                  }
                },
              ),
              Gaps.v28,
              GestureDetector(
                onTap: _onSubmitTap,
                child: const FormButton(
                  disabled: false,
                  buttonText: "Log in",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
