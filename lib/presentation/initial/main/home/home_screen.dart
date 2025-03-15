import 'package:dsa_learning/core/constants/image_assets.dart';
import 'package:dsa_learning/core/utils/theme/app_color_theme.dart';
import 'package:dsa_learning/core/utils/theme/text_theme.dart';
import 'package:dsa_learning/core/widgets/popup/popup_mixin.dart';
import 'package:dsa_learning/data/achievements/streak.dart';
import 'package:dsa_learning/domain/achievements/iachievement.dart';
import 'package:dsa_learning/domain/achievements/istreak.dart';
import 'package:dsa_learning/presentation/initial/main/home/bloc/home_cubit.dart';
import 'package:dsa_learning/presentation/initial/main/home/bloc/home_state.dart';
import 'package:dsa_learning/presentation/initial/main/home/widgets/achievements/achievements_popup_content.dart';
import 'package:dsa_learning/presentation/initial/main/widgets/avatar_widget.dart';
import 'package:dsa_learning/presentation/widgets/lottie_animations/robot_animation.dart';
import 'package:dsa_learning/presentation/widgets/main_background.dart';
import 'package:dsa_learning/presentation/widgets/main_container.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

part 'widgets/_streak_widget.dart';
part 'widgets/achievements/_achievements_widget.dart';
part 'widgets/hello_user/_currency_item.dart';
part 'widgets/hello_user/_hello_user_widget.dart';
part 'widgets/statistics/_bar_chart.dart';
part 'widgets/statistics/_legend_item.dart';
part 'widgets/statistics/_statistics_widget.dart';

class HomeScreen extends StatelessWidget with PopUpMixin {
  const HomeScreen({
    required this.cubit,
    super.key,
  });

  final HomeCubit cubit;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = getColorScheme(context);
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (_, HomeState state) {
            return Stack(
              children: [
                const MainBackground(),
                if (state.status == HomeStatus.loading)
                  const CircularProgressIndicator(),
                if (state.status == HomeStatus.success)
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
                              _StreakWidget(
                                streak: state.streak,
                                avatarPath: state.profilePhoto,
                              ),
                              const SizedBox(height: 20),
                              _HelloUserWidget(
                                userName: state.userName,
                                hash: state.hash,
                                fan: state.vent,
                                bytes: state.bytes,
                              ),
                              const SizedBox(height: 20),
                              _AchievementsWidget(
                                onSeeAllTap: () => showPopup(
                                  context: context,
                                  height: 400,
                                  child: AchievementsPopupContent(
                                    achievements: state.achievements,
                                  ),
                                ),
                                achievements: state.achievements,
                              ),
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
            );
          },
        ),
      ),
    );
  }
}
