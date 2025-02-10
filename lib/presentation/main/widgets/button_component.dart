part of '../main_screen.dart';

class _ButtonComponent extends StatelessWidget {
  const _ButtonComponent({
    required this.isSelected,
    required this.icon,
    required this.onTapped,
    super.key,
  });

  final bool isSelected;
  final IconData icon;
  final VoidCallback onTapped;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = getColorScheme(context);
    return GestureDetector(
      onTap: onTapped,
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected
              ? colorScheme.primaryFixedDim
              : colorScheme.primaryFixed,
        ),
        child: Icon(
          icon,
          size: 30,
          color: colorScheme.onSurface,
        ),
      ),
    );
  }
}
