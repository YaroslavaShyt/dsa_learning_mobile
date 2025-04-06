import 'package:dsa_learning/core/utils/theme/app_color_theme.dart';
import 'package:dsa_learning/core/utils/theme/text_theme.dart';
import 'package:dsa_learning/presentation/initial/main/profile/avatar/avatar_factory.dart';
import 'package:dsa_learning/presentation/initial/main/profile/bloc/profile_cubit.dart';
import 'package:dsa_learning/presentation/initial/main/profile/bloc/profile_state.dart';
import 'package:dsa_learning/presentation/initial/main/profile/widgets/confirm_exit/confirm_exit_popup_content.dart';
import 'package:dsa_learning/presentation/initial/main/widgets/avatar_widget.dart';
import 'package:dsa_learning/presentation/widgets/animated_gestures/tap_animated_widget.dart';
import 'package:dsa_learning/presentation/widgets/main_background.dart';
import 'package:dsa_learning/presentation/widgets/main_container.dart';
import 'package:dsa_learning/presentation/widgets/popup/popup_mixin.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'widgets/avatar_widget.dart';
part 'widgets/component_border.dart';
part 'widgets/menu_component.dart';
part 'widgets/menu_subcomponent.dart';
part 'widgets/menu_subcomponents_list.dart';
part 'widgets/profile_menu.dart';

class ProfileScreen extends StatelessWidget with PopUpMixin {
  const ProfileScreen({
    required this.cubit,
    super.key,
  });

  final ProfileCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (_, ProfileState state) {
            return Stack(
              children: [
                const MainBackground(),
                Positioned(
                  left: 20,
                  top: 40,
                  right: 20,
                  child: Column(
                    children: [
                      _UserInfoWidget(
                        avatarPath: state.profilePhoto,
                        userName: cubit.userName,
                        onAvatarTap: () => _onAvatarTap(context),
                      ),
                      _ProfileMenu(
                        isAnimationsEnabled: state.isAnimationEnabled,
                        isSoundEnabled: state.isSoundEnabled,
                        isVibrationEnabled: state.isVibrationEnabled,
                        onSoundTap: cubit.onSoundTap,
                        onVibrationTap: cubit.onVibrationTap,
                        isAboutInfoShown: state.isAboutInfoShown,
                        isLanguageShown: state.isLanguageShown,
                        onAboutInfoTap: cubit.onAboutInfoTap,
                        onDeleteAccountTap: cubit.onDeleteAccountTap,
                        onAnimationTap: cubit.onAnimationTap,
                        onExitTap: () => _onExitTap(context),
                        onLanguageTap: cubit.onLanguageTap,
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void _onAvatarTap(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return AvatarFactory.build();
      },
    );
  }

  void _onExitTap(BuildContext context) {
    showPopup(
      context: context,
      child: ConfirmExitPopupContent(
        onCancelTap: cubit.onCancelTap,
        onConfirmTap: cubit.onExitTap,
      ),
    );
  }
}
