part of '../profile_screen.dart';

class _ProfileMenu extends StatelessWidget {
  const _ProfileMenu({
    required this.onLanguageTap,
    required this.isLanguageShown,
    required this.onDeleteAccountTap,
    required this.isAboutInfoShown,
    required this.onAboutInfoTap,
    required this.onExitTap,
    required this.isSoundEnabled,
    required this.isVibrationEnabled,
    required this.onSoundTap,
    required this.onVibrationTap,
    required this.isAnimationsEnabled,
    required this.onAnimationTap,
  });

  final bool isLanguageShown;
  final VoidCallback onLanguageTap;
  final VoidCallback onDeleteAccountTap;
  final bool isAboutInfoShown;
  final VoidCallback onAboutInfoTap;
  final VoidCallback onExitTap;
  final bool isVibrationEnabled;
  final bool isSoundEnabled;
  final bool isAnimationsEnabled;
  final VoidCallback onSoundTap;
  final VoidCallback onVibrationTap;
  final VoidCallback onAnimationTap;

  @override
  Widget build(BuildContext context) {
    return MainContainer(
      content: Column(
        children: [
          _MenuComponent(
            title: context.tr('vibration'),
            subtitle: context.tr(isVibrationEnabled ? 'yes' : 'no'),
            onTap: onVibrationTap,
            icon: Icons.vibration_rounded,
          ),
          _MenuComponent(
            title: context.tr('sound'),
            subtitle: context.tr(isSoundEnabled ? 'yes' : 'no'),
            onTap: onSoundTap,
            icon: Icons.music_note_rounded,
          ),
          _MenuComponent(
            title: context.tr('animations'),
            subtitle: context.tr(isAnimationsEnabled ? 'yes' : 'no'),
            onTap: onAnimationTap,
            icon: Icons.animation_rounded,
          ),
          _MenuComponent(
            title: context.tr('exit'),
            onTap: onExitTap,
            icon: Icons.exit_to_app_rounded,
          ),
          _MenuComponent(
            title: context.tr('deleteAccount'),
            onTap: onDeleteAccountTap,
            icon: Icons.delete_outline_rounded,
          ),
          _MenuComponent(
            isComponentsShown: isLanguageShown,
            title: context.tr('language'),
            onTap: onLanguageTap,
            components: ['Українська'],
            selectedComponent: 'Українська',
          ),
          _MenuComponent(
            isComponentsShown: isAboutInfoShown,
            components: ['Версія 1.0.0'],
            title: context.tr('aboutApp'),
            onTap: onAboutInfoTap,
            isBottomBorderShown: false,
          ),
        ],
      ),
    );
  }
}
