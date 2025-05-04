part of '../profile_screen.dart';

class _MenuSubcomponent extends StatelessWidget {
  const _MenuSubcomponent({
    required this.item,
    required this.selectedComponent,
  });

  final String item;
  final String? selectedComponent;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = getColorScheme(context);
    final TextTheme textTheme = getTextTheme(context);

    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            item,
            style: textTheme.labelSmall,
          ),
          if (item == selectedComponent)
            Icon(
              Icons.check,
              size: 20,
              color: colorScheme.onSurface,
              shadows: [
                BoxShadow(
                  color: colorScheme.shadow.withValues(alpha: 0.5),
                  offset: const Offset(1, 1),
                  blurRadius: 10,
                  spreadRadius: 1,
                ),
              ],
            ),
        ],
      ),
    );
  }
}
