part of '../profile_screen.dart';

class _MenuComponent extends StatelessWidget {
  const _MenuComponent({
    required this.title,
    required this.onTap,
    this.isBottomBorderShown = true,
    this.isComponentsShown = false,
    this.icon = Icons.keyboard_arrow_down,
    this.components = const [],
    this.selectedComponent,
  });

  final String title;
  final bool isBottomBorderShown;
  final VoidCallback onTap;
  final bool isComponentsShown;
  final IconData icon;
  final List<String> components;
  final String? selectedComponent;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = getColorScheme(context);
    final TextTheme textTheme = getTextTheme(context);
    return TapAnimatedWidget(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsetsDirectional.symmetric(
              horizontal: 20,
            ),
            padding: EdgeInsetsDirectional.only(
              start: 10,
              top: 20,
              end: 10,
              bottom: isComponentsShown ? 10 : 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: textTheme.labelMedium,
                ),
                Icon(
                  isComponentsShown ? Icons.keyboard_arrow_up : icon,
                  size: 30,
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
          ),
          if (isComponentsShown)
            _MenuSubcomponentsList(
              components: components,
              selectedComponent: selectedComponent,
            ),
          if (isBottomBorderShown) const _ComponentBorder(),
        ],
      ),
    );
  }
}
