part of '../profile_screen.dart';

class _ProfileMenu extends StatelessWidget {
  const _ProfileMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return MainContainer(
      content: Column(
        children: [
          _MenuComponent(
            title: context.tr('language'),
            onTap: () {},
            components: ['Українська', "English", "Espanol"],
            selectedComponent: 'Українська',
          ),
          _MenuComponent(
            title: context.tr('deleteAccount'),
            onTap: () {},
            icon: Icons.delete_outline_rounded,
          ),
          _MenuComponent(
            title: context.tr('exit'),
            onTap: () {},
            icon: Icons.exit_to_app_rounded,
          ),
          _MenuComponent(
            title: context.tr('aboutApp'),
            onTap: () {},
            isBottomBorderShown: false,
          ),
        ],
      ),
    );
  }
}
