import 'package:dsa_learning/core/constants/image_assets.dart';
import 'package:dsa_learning/core/utils/theme/app_color_theme.dart';
import 'package:dsa_learning/core/utils/theme/text_theme.dart';
import 'package:dsa_learning/presentation/initial/main/widgets/avatar_widget.dart';
import 'package:dsa_learning/presentation/widgets/lottie_animations/robot_animation.dart';
import 'package:dsa_learning/presentation/widgets/main_background.dart';
import 'package:dsa_learning/presentation/widgets/main_container.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

part 'widgets/_achievements_widget.dart';
part 'widgets/_streak_widget.dart';
part 'widgets/hello_user/_currency_item.dart';
part 'widgets/hello_user/_hello_user_widget.dart';
part 'widgets/statistics/_bar_chart.dart';
part 'widgets/statistics/_legend_item.dart';
part 'widgets/statistics/_statistics_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = getColorScheme(context);
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            const MainBackground(),
            Container(
              margin: const EdgeInsetsDirectional.symmetric(
                horizontal: 6,
                vertical: 14,
              ),
              width: double.infinity,
              child: Scrollbar(
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(
                    start: 6,
                    end: 10.0,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const _StreakWidget(),
                        const SizedBox(height: 20),
                        const _HelloUserWidget(),
                        const SizedBox(height: 20),
                        const _AchievementsWidget(),
                        const SizedBox(height: 20),
                        const _StatisticsWidget(),
                        const SizedBox(height: 100),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
