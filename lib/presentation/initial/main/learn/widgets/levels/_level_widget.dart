part of '../../learn_screen.dart';

class _LevelWidget extends StatelessWidget {
  const _LevelWidget({
    required this.isOpened,
    required this.levelNum,
    required this.position,
    required this.onTap,
    this.isGame = false,
  });

  final bool isOpened;
  final String levelNum;
  final bool isGame;
  final Position position;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = getColorScheme(context);
    final TextTheme textTheme = getTextTheme(context);

    return Positioned(
      bottom: position.bottom,
      left: position.left,
      child: TapAnimatedWidget(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color:
                isOpened ? colorScheme.surface : colorScheme.onPrimaryContainer,
            border: Border.all(color: colorScheme.onSurface, width: 3),
            shape: BoxShape.circle,
            boxShadow: [
              mainBoxShadow(context).copyWith(
                color: isOpened ? colorScheme.primaryFixed : null,
                spreadRadius: 1,
                blurRadius: 10,
                offset: const Offset(0, 1),
              )
            ],
          ),
          padding: const EdgeInsetsDirectional.all(8),
          child: Text(
            levelNum,
            style: textTheme.labelMedium?.copyWith(
              fontWeight: FontWeight.w700,
              fontSize: 24,
              color: isOpened
                  ? colorScheme.onSurface
                  : colorScheme.onSurface.withValues(alpha: 0.6),
            ),
          ),
        ),
      ),
    );
  }
}
