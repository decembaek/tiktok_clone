import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class FormButton extends StatelessWidget {
  // const FormButton({
  //   super.key,
  //   required String username,
  // }) : _username = username;

  // final String _username;
  const FormButton({
    super.key,
    required this.disabled,
    required this.buttonText,
  });

  final bool disabled;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      // 부모의 사이즈게 맞게 제작됌
      widthFactor: 1,
      // 애니메이션 컨테이너
      child: AnimatedContainer(
        // 애니메이션 걸리는 시간
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.size16,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Sizes.size10),
          color:
              disabled ? Colors.grey.shade300 : Theme.of(context).primaryColor,
        ),
        // Text 애니메이션
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 300),
          style: TextStyle(
            color: disabled ? Colors.grey.shade400 : Colors.white,
            fontWeight: FontWeight.w700,
          ),
          child: Text(
            buttonText,
            textAlign: TextAlign.center,
            // style: TextStyle(
            //   color:
            //       _username.isEmpty ? Colors.grey.shade400 : Colors.white,
            //   fontWeight: FontWeight.w700,
            // ),
          ),
        ),
      ),
    );
  }
}
