part of '../auth_screen.dart';

class _AuthText extends StatelessWidget {
  const _AuthText({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = getTextTheme(context);
    final ColorScheme colorScheme = getColorScheme(context);
    return Padding(
      padding: const EdgeInsetsDirectional.only(
        start: 10.0,
        top: 24,
        end: 10,
        bottom: 20,
      ),
      child: RichText(
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
      ),
    );
  }
}
