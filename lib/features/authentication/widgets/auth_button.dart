import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final FaIcon icon;
  final dynamic navigation;

  void _onNavigatorPage(BuildContext context, navigation) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => navigation(context),
      ),
    );
  }

  const AuthButton({
    super.key,
    required this.text,
    required this.icon,
    required this.navigation,
  });

  @override
  Widget build(BuildContext context) {
    // FractionallySizeBox 부모의 사이즈를 가져감
    // widthFactor 1 -> 부모사이즈, 0.5 -> 부모사이즈 2분의 1
    return GestureDetector(
      onTap: () => _onNavigatorPage(context, navigation),
      child: FractionallySizedBox(
        widthFactor: 1,
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: Sizes.size14,
            horizontal: Sizes.size14,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey.shade200,
              width: Sizes.size1,
            ),
          ),
          // Stack은 위에 쌓을 수 있음, 위치 같으면 위로 겹쳐짐
          child: Stack(
            alignment: Alignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: icon,
              ),
              // Expanded 공간을 전부 사용함
              Text(
                text,
                style: const TextStyle(
                  fontSize: Sizes.size16,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
