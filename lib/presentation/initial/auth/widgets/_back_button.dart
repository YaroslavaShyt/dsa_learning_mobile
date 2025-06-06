part of '../auth_screen.dart';

class _BackButton extends StatelessWidget {
  const _BackButton({
    required this.onBackPressed,
  });

  final VoidCallback onBackPressed;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = getColorScheme(context);
    final TextTheme textTheme = getTextTheme(context);

    return TapAnimatedWidget(
      onTap: onBackPressed,
      child: Row(
        children: [
          Icon(
            Icons.arrow_back_ios_rounded,
            color: colorScheme.onSurface.withValues(alpha: 1),
            shadows: [mainBoxShadow(context)],
          ),
          Text(
            context.tr('back'),
            style: textTheme.labelSmall?.copyWith(
              fontWeight: FontWeight.w700,
              color: colorScheme.onSurface.withValues(alpha: 1),
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
