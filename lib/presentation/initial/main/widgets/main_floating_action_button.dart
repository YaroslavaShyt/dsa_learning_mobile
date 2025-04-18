part of '../main_screen.dart';

class _MainFloatingActionButton extends StatelessWidget {
  const _MainFloatingActionButton({
    required this.selectedIndex,
    required this.onHomeTapped,
    required this.onLearnTapped,
    required this.onProfileTapped,
    required this.onChanged,
  });

  final int selectedIndex;
  final VoidCallback onHomeTapped;
  final VoidCallback onLearnTapped;
  final VoidCallback onProfileTapped;
  final Function(int) onChanged;

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
            key: homeTabKey,
            isSelected: selectedIndex == 0,
            icon: Icons.home_rounded,
            onTapped: onHomeTapped,
          ),
          _ButtonComponent(
            key: learnTabKey,
            isSelected: selectedIndex == 1,
            icon: Icons.book_rounded,
            onTapped: onLearnTapped,
          ),
          _ButtonComponent(
            key: profileTabKey,
            isSelected: selectedIndex == 2,
            icon: Icons.person_rounded,
            onTapped: onProfileTapped,
          ),
        ],
      ),
    );
  }
}
