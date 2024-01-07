import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/widgets/form_button.dart';

class EmailScreen extends StatefulWidget {
  const EmailScreen({super.key});

  @override
  State<EmailScreen> createState() => _UsernameScreenState();
}

class _UsernameScreenState extends State<EmailScreen> {
  final TextEditingController _usernameController = TextEditingController();

  String _username = "";

  @override
  void initState() {
    super.initState();

    _usernameController.addListener(() {
      setState(() {
        _username = _usernameController.text;
      });
    });
  }

  // 메모리 과다 사용으로 충돌 방지를 위한 dispose
  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
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
              "What is your email",
              style: TextStyle(
                fontSize: Sizes.size20,
                fontWeight: FontWeight.w700,
              ),
            ),
            Gaps.v16,
            TextField(
              // TextField 컨트롤러 입력감지
              controller: _usernameController,
              decoration: InputDecoration(
                hintText: "Email",
                // focus off 상태
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade400,
                  ),
                ),
                // focus on 상태
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              // cursor 색상
              cursorColor: Theme.of(context).primaryColor,
            ),
            Gaps.v16,
            FormButton(disabled: _username.isEmpty)
          ],
        ),
      ),
    );
  }
}
