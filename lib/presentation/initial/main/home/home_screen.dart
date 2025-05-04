import 'dart:async';

import 'package:dsa_learning/core/constants/animation_assets.dart';
import 'package:dsa_learning/core/constants/image_assets.dart';
import 'package:dsa_learning/core/utils/theme/app_color_theme.dart';
import 'package:dsa_learning/core/utils/theme/text_theme.dart';
import 'package:dsa_learning/data/rewards/achievements/streak.dart';
import 'package:dsa_learning/domain/rewards/achievements/iachievement.dart';
import 'package:dsa_learning/domain/rewards/achievements/istreak.dart';
import 'package:dsa_learning/domain/statistics/istatistics.dart';
import 'package:dsa_learning/presentation/initial/loader/loader_factory.dart';
import 'package:dsa_learning/presentation/initial/main/home/bloc/home_cubit.dart';
import 'package:dsa_learning/presentation/initial/main/home/bloc/home_state.dart';
import 'package:dsa_learning/presentation/initial/main/home/shop/shop_factory.dart';
import 'package:dsa_learning/presentation/initial/main/home/widgets/achievements/achievements_popup_content.dart';
import 'package:dsa_learning/presentation/initial/main/home/widgets/statistics/bloc/statistics_cubit.dart';
import 'package:dsa_learning/presentation/initial/main/home/widgets/statistics/bloc/statistics_state.dart';
import 'package:dsa_learning/presentation/initial/main/home/widgets/streak/lost_streak_content.dart';
import 'package:dsa_learning/presentation/initial/main/onboarding/onboarding_steps.dart';
import 'package:dsa_learning/presentation/widgets/animated_gestures/tap_animated_widget.dart';
import 'package:dsa_learning/presentation/widgets/lottie_animations/main_animation_widget.dart';
import 'package:dsa_learning/presentation/widgets/main_background.dart';
import 'package:dsa_learning/presentation/widgets/main_container.dart';
import 'package:dsa_learning/presentation/widgets/placeholders/error/error_factory.dart';
import 'package:dsa_learning/presentation/widgets/popup/popup_mixin.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

part 'widgets/achievements/_achievements_widget.dart';
part 'widgets/hello_user/_currency_item.dart';
part 'widgets/hello_user/_hello_user_widget.dart';
part 'widgets/statistics/_bar_chart.dart';
part 'widgets/statistics/_legend_item.dart';
part 'widgets/statistics/_statistics_widget.dart';
part 'widgets/streak/_streak_widget.dart';

class HomeScreen extends StatefulWidget with PopUpMixin {
  const HomeScreen({
    required this.cubit,
    super.key,
  });

  final HomeCubit cubit;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    widget.cubit.init(() => _onLostStreak(context));
  }

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
                if (state.status == HomeStatus.loading) LoaderFactory.build(),
                if (state.status == HomeStatus.failure)
                  ErrorFactory.build(
                    () => widget.cubit.init(
                      () => _onLostStreak(context),
                    ),
                  ),
                if (state.status == HomeStatus.success)
                  Container(
                    margin: const EdgeInsetsDirectional.symmetric(
                      horizontal: 3,
                      vertical: 14,
                    ),
                    width: double.infinity,
                    child: SingleChildScrollView(
                      padding: const EdgeInsetsDirectional.only(
                        start: 10,
                        top: 10,
                        end: 16.0,
                      ),
                      child: Column(
                        spacing: 20,
                        children: [
                          _StreakWidget(streak: state.streak),
                          _HelloUserWidget(
                            key: homeContentKey,
                            onTimerFinished: widget.cubit.onTimerFinished,
                            fansLastUpdated: widget.cubit.fansLastUpdated,
                            onManageCurrencyTap: () => _showShop(context),
                            userName: state.userName,
                            hash: state.hash,
                            fan: state.vent,
                            bytes: state.bytes,
                          ),
                          if (state.achievements.isNotEmpty)
                            _AchievementsWidget(
                              onSeeAllTap: () => _onSeeAllTap(context, state),
                              achievements: state.achievements,
                            ),
                          const _StatisticsWidget(),
                          const SizedBox(height: 80),
                        ],
                      ),
                    ),
                  ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          colorScheme.surface,
                          colorScheme.surface.withValues(alpha: 0),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        end: Alignment.topCenter,
                        begin: Alignment.bottomCenter,
                        colors: [
                          colorScheme.surface,
                          colorScheme.surface.withValues(alpha: 0),
                        ],
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

  void _onSeeAllTap(BuildContext context, HomeState state) {
    widget.cubit.playAudio();
    widget.showPopup(
      context: context,
      height: 400,
      child: AchievementsPopupContent(
        achievements: state.achievements,
        onCloseButtonTap: widget.cubit.onCloseButtonTap,
      ),
    );
  }

  void _showShop(BuildContext context) {
    widget.cubit.playAudio();
    widget.showPopup(
      height: 460,
      context: context,
      child: ShopFactory.build(),
    );
  }

  void _onLostStreak(BuildContext context) {
    widget.showPopup(
      height: 270,
      context: context,
      child: LostStreakContent(
        onCloseButtonTap: widget.cubit.onCloseButtonTap,
        onConfirmTap: widget.cubit.onLostStreakConfirmTap,
        onCancelTap: widget.cubit.onCloseButtonTap,
      ),
    );
  }
}
