import 'dart:async';

import 'package:dsa_learning/core/constants/animation_assets.dart';
import 'package:dsa_learning/core/constants/image_assets.dart';
import 'package:dsa_learning/core/utils/theme/app_color_theme.dart';
import 'package:dsa_learning/core/utils/theme/text_theme.dart';
import 'package:dsa_learning/data/rewards/achievements/streak.dart';
import 'package:dsa_learning/domain/handlers/iaudio_handler.dart';
import 'package:dsa_learning/domain/rewards/achievements/iachievement.dart';
import 'package:dsa_learning/domain/rewards/achievements/istreak.dart';
import 'package:dsa_learning/domain/statistics/istatistics.dart';
import 'package:dsa_learning/main.dart';
import 'package:dsa_learning/presentation/initial/loader/loader_factory.dart';
import 'package:dsa_learning/presentation/initial/main/home/bloc/home_cubit.dart';
import 'package:dsa_learning/presentation/initial/main/home/bloc/home_state.dart';
import 'package:dsa_learning/presentation/initial/main/home/shop/shop_factory.dart';
import 'package:dsa_learning/presentation/initial/main/home/widgets/achievements/achievements_popup_content.dart';
import 'package:dsa_learning/presentation/initial/main/home/widgets/statistics/bloc/statistics_cubit.dart';
import 'package:dsa_learning/presentation/initial/main/home/widgets/statistics/bloc/statistics_state.dart';
import 'package:dsa_learning/presentation/initial/main/home/widgets/streak/lost_streak_content.dart';
import 'package:dsa_learning/presentation/widgets/animated_gestures/tap_animated_widget.dart';
import 'package:dsa_learning/presentation/widgets/lottie_animations/main_animation_widget.dart';
import 'package:dsa_learning/presentation/widgets/lottie_animations/robot_animation.dart';
import 'package:dsa_learning/presentation/widgets/main_background.dart';
import 'package:dsa_learning/presentation/widgets/main_container.dart';
import 'package:dsa_learning/presentation/widgets/placeholders/error/error_factory.dart';
import 'package:dsa_learning/presentation/widgets/popup/popup_mixin.dart';
import 'package:dsa_learning/presentation/widgets/scroll/main_scroll_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
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
  late final ScrollController _scrollController;
  final IAudioHandler _audioHandler = sl.get<IAudioHandler>();

  @override
  void initState() {
    super.initState();
    widget.cubit.init(() => _onLostStreak(context));

    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                    child: MainScrollbar(
                      child: SingleChildScrollView(
                        controller: _scrollController,
                        child: Padding(
                          padding: const EdgeInsetsDirectional.only(
                            start: 10,
                            end: 16.0,
                          ),
                          child: Column(
                            children: [
                              _StreakWidget(
                                streak: state.streak,
                                avatarPath: state.profilePhoto,
                              ),
                              const SizedBox(height: 20),
                              _HelloUserWidget(
                                onTimerFinished: widget.cubit.onTimerFinished,
                                fansLastUpdated: widget.cubit.fansLastUpdated,
                                onManageCurrencyTap: () => _showShop(context),
                                userName: state.userName,
                                hash: state.hash,
                                fan: state.vent,
                                bytes: state.bytes,
                              ),
                              const SizedBox(height: 20),
                              if (state.achievements.isNotEmpty)
                                _AchievementsWidget(
                                  onSeeAllTap: () =>
                                      _onSeeAllTap(context, state),
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

  void _onSeeAllTap(BuildContext context, HomeState state) {
    _audioHandler.playButtonSound();
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
    _audioHandler.playButtonSound();
    widget.showPopup(
      height: 450,
      context: context,
      child: ShopFactory.build(),
    );
  }

  void _onLostStreak(BuildContext context) {
    widget.showPopup(
      height: 250,
      context: context,
      child: LostStreakContent(
        onCloseButtonTap: widget.cubit.onCloseButtonTap,
        onConfirmTap: widget.cubit.onLostStreakConfirmTap,
        onCancelTap: widget.cubit.onCloseButtonTap,
      ),
    );
  }
}
