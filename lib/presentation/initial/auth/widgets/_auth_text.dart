part of '../auth_screen.dart';

class _AuthText extends StatelessWidget {
  const _AuthText({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = getTextTheme(context);
    final ColorScheme colorScheme = getColorScheme(context);
    return  RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: textTheme.labelMedium?.copyWith(
          color: colorScheme.onSurface,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        children: [
          TextSpan(
            text: context.tr('learnWith'),
          ),
          TextSpan(
            text: " ${context.tr('DSA')}!",
            style: textTheme.labelMedium?.copyWith(
              color: colorScheme.primaryFixed,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
