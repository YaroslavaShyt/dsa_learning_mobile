part of '../main_screen.dart';

class _MainFloatingActionButton extends StatelessWidget {
  const _MainFloatingActionButton({
    required this.selectedIndex,
    required this.onHomeTapped,
    required this.onLearnTapped,
    required this.onProfileTapped,
});

  final int selectedIndex;
  final VoidCallback onHomeTapped;
  final VoidCallback onLearnTapped;
  final VoidCallback onProfileTapped;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = getColorScheme(context);
    return Container(
      padding: const EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
        color: colorScheme.primaryFixed,
        borderRadius: BorderRadius.circular(50),
        boxShadow: [mainBoxShadow(context)],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _ButtonComponent(
            isSelected: selectedIndex == 0,
            icon: Icons.home_outlined,
            onTapped: onHomeTapped,
          ),
          _ButtonComponent(
            isSelected: selectedIndex == 1,
            icon: Icons.book_outlined,
            onTapped: onLearnTapped,
          ),
          _ButtonComponent(
            isSelected: selectedIndex == 2,
            icon: Icons.person_outline_outlined,
            onTapped: onProfileTapped,
          ),
        ],
      ),
    );
  }
}
