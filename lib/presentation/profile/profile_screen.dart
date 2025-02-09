import 'package:dsa_learning/core/utils/theme/app_color_theme.dart';
import 'package:dsa_learning/core/utils/theme/text_theme.dart';
import 'package:dsa_learning/presentation/widgets/main_background.dart';
import 'package:flutter/material.dart';
import 'package:dsa_learning/presentation/widgets/main_container.dart';

part 'widgets/avatar_widget.dart';
part 'widgets/profile_menu.dart';
part 'widgets/menu_component.dart';
part 'widgets/component_border.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const MainBackground(),
          Positioned.directional(
            start: 20,
            top: 40,
            end: 20,
            bottom: 40,
            textDirection: TextDirection.ltr,
            child: Column(
              children: [
                const _AvatarWidget(),
                _ProfileMenu(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
