part of '../profile_screen.dart';

class _ProfileMenu extends StatelessWidget {
  const _ProfileMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return MainContainer(
      content: Column(
        children: [
          _MenuComponent(
            title: 'title',
            onTap: () {},
            components: ['Українська', "English", "Espanol"],
            selectedComponent: 'Українська',
          ),
          _MenuComponent(title: 'title', onTap: () {}),
          _MenuComponent(title: 'title', onTap: () {}),
          _MenuComponent(
            title: 'title',
            onTap: () {},
            isBottomBorderShown: false,
          ),
        ],
      ),
    );
  }
}
