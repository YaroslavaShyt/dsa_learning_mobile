import 'package:dsa_learning/core/utils/theme/app_color_theme.dart';
import 'package:dsa_learning/core/utils/theme/text_theme.dart';
import 'package:dsa_learning/presentation/widgets/main_background.dart';
import 'package:flutter/material.dart';
import 'package:dsa_learning/presentation/widgets/main_container.dart';
import 'package:easy_localization/easy_localization.dart';

part 'widgets/avatar_widget.dart';
part 'widgets/profile_menu.dart';
part 'widgets/menu_component.dart';
part 'widgets/component_border.dart';
part 'widgets/menu_subcomponent.dart';
part 'widgets/menu_subcomponents_list.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const MainBackground(),
          Positioned(
            left: 20,
            top: 40,
            right: 20,
            bottom: 40,
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
