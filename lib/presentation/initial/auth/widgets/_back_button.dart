part of '../auth_screen.dart';

class _BackButton extends StatelessWidget with SoundMixin {
  _BackButton({
    required this.onBackPressed,
  });

  final VoidCallback onBackPressed;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = getColorScheme(context);
    return TapAnimatedWidget(
      onTap: () {
        sound(true);
        onBackPressed();
      },
      child: Row(
        children: [
          Icon(
            Icons.arrow_back_ios_rounded,
            color: colorScheme.onSurface.withValues(alpha: 1),
            shadows: [mainBoxShadow(context)],
          ),
          Text(
            context.tr('back'),
            style: getTextTheme(context).labelSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: colorScheme.onSurface.withValues(alpha: 1),
                  fontSize: 16,
                ),
          )
        ],
      ),
    );
  }
}
