import 'package:dsa_learning/core/utils/theme/app_color_theme.dart';
import 'package:dsa_learning/core/utils/theme/text_theme.dart';
import 'package:dsa_learning/domain/category/icategory.dart';
import 'package:dsa_learning/domain/lesson/ilesson.dart';
import 'package:dsa_learning/presentation/initial/loader/loader_factory.dart';
import 'package:dsa_learning/presentation/initial/main/home/shop/shop_factory.dart';
import 'package:dsa_learning/presentation/initial/main/learn/bloc/learn_cubit.dart';
import 'package:dsa_learning/presentation/initial/main/learn/bloc/learn_state.dart';
import 'package:dsa_learning/presentation/initial/main/learn/widgets/bottom_sheet/pre_lesson_info.dart';
import 'package:dsa_learning/presentation/initial/main/learn/widgets/levels/_dotted_line.dart';
import 'package:dsa_learning/presentation/initial/main/learn/widgets/levels/_pattern.dart';
import 'package:dsa_learning/presentation/widgets/animated_gestures/tap_animated_widget.dart';
import 'package:dsa_learning/presentation/widgets/bottomsheet/bottom_sheet_mixin.dart';
import 'package:dsa_learning/presentation/widgets/main_background.dart';
import 'package:dsa_learning/presentation/widgets/main_container.dart';
import 'package:dsa_learning/presentation/widgets/main_shadow.dart';
import 'package:dsa_learning/presentation/widgets/placeholders/error/error_factory.dart';
import 'package:dsa_learning/presentation/widgets/popup/popup_mixin.dart';
import 'package:dsa_learning/presentation/widgets/scroll/main_scroll_bar.dart';
import 'package:dsa_learning/presentation/widgets/tab_bar/main_tab_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'lesson/widgets/knowledge_check/all_vents_used_popup_content.dart';

part 'widgets/_category_container.dart';
part 'widgets/_learn_tab_bar.dart';
part 'widgets/algorithms/_algorithms_content.dart';
//part 'widgets/data_structures_content/_data_structures_content.dart';
part 'widgets/levels/_level_widget.dart';

class LearnScreen extends StatelessWidget {
  const LearnScreen({
    required this.cubit,
    super.key,
  });

  final LearnCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: BlocBuilder<LearnCubit, LearnState>(
          builder: (BuildContext context, LearnState state) {
            return Stack(
              children: [
                const MainBackground(),
                if (state.status == LearnStatus.loading) LoaderFactory.build(),
                if (state.status == LearnStatus.failure)
                  ErrorFactory.build(cubit.init),
                if (state.status == LearnStatus.loaded)
                  _LearnTabBar(
                    lessonsSummary: state.lessonsSummary,
                    onStartButtonTap: cubit.onStartButtonTap,
                    onCloseButtonTap: cubit.onCloseButtonTap,
                  ),
                if (state.status == LearnStatus.failure)
                  ErrorFactory.build(cubit.init),
              ],
            );
          },
        ),
      ),
    );
  }
}
