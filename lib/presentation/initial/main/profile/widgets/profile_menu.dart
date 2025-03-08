part of '../profile_screen.dart';

class _ProfileMenu extends StatelessWidget {
  const _ProfileMenu({
    required this.onLanguageTap,
    required this.isLanguageShown,
    required this.onDeleteAccountTap,
    required this.isAboutInfoShown,
    required this.onAboutInfoTap,
    required this.onExitTap,
  });

  final bool isLanguageShown;
  final VoidCallback onLanguageTap;
  final VoidCallback onDeleteAccountTap;
  final bool isAboutInfoShown;
  final VoidCallback onAboutInfoTap;
  final VoidCallback onExitTap;

  @override
  Widget build(BuildContext context) {
    return MainContainer(
      content: Column(
        children: [
          _MenuComponent(
            isComponentsShown: isLanguageShown,
            title: context.tr('language'),
            onTap: onLanguageTap,
            components: [
              'Українська', //"English", "Espanol",
            ],
            selectedComponent: 'Українська',
          ),
          _MenuComponent(
            title: context.tr('deleteAccount'),
            onTap: onDeleteAccountTap,
            icon: Icons.delete_outline_rounded,
          ),
          _MenuComponent(
            title: context.tr('exit'),
            onTap: onExitTap,
            icon: Icons.exit_to_app_rounded,
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
