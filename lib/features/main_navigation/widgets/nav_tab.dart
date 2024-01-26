import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';

class NavTab extends StatelessWidget {
  const NavTab({
    super.key,
    required this.text,
    required this.isSelected,
    required this.icon,
    required this.onTap,
    required this.selectedIcon,
  });

  final String text;

  final bool isSelected;

  final IconData icon;
  final IconData selectedIcon;

  final Function onTap;

  @override
  Widget build(BuildContext context) {
    // Expanded 사용 공간을 최대로 쓰기
    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(),
        child: Container(
          color: Colors.black,
          child: AnimatedOpacity(
            duration: const Duration(microseconds: 300),
            opacity: isSelected ? 1 : 0.6,
            child: Column(
              // Column 자리 차지하는 크기 설정하기
              mainAxisSize: MainAxisSize.min,
              children: [
                FaIcon(
                  // FontAwesomeIcons.house,
                  isSelected ? selectedIcon : icon,
                  color: Colors.white,
                ),
                Gaps.v5,
                Text(
                  text,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
