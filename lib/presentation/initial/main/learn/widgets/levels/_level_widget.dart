part of '../../learn_screen.dart';

class _LevelWidget extends StatelessWidget {
  const _LevelWidget({
    required this.levelNum,
    required this.position,
    required this.onTap,
    this.isGame = false,
  });

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
            color: colorScheme.surface,
            border: Border.all(color: colorScheme.onSurface, width: 2),
            shape: BoxShape.circle,
            boxShadow: [
              mainBoxShadow(context).copyWith(
                color: colorScheme.primaryFixed,
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
            ),
          ),
        ),
      ),
    );
  }
}
