part of '../../auth_screen.dart';

class _AuthText extends StatelessWidget {
  const _AuthText({
    required this.text,
    required this.coloredText,
  });

  final String text;
  final String coloredText;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = getTextTheme(context);
    final ColorScheme colorScheme = getColorScheme(context);

    return Padding(
      padding: const EdgeInsetsDirectional.only(
        top: 24,
        bottom: 20,
      ),
      child: Wrap(
        alignment: WrapAlignment.center,
        children: [
          Text(
            context.tr(text),
            textAlign: TextAlign.center,
            style: textTheme.labelMedium?.copyWith(
              fontWeight: FontWeight.w800,
              fontSize: 20,
            ),
          ),
          Text(
            " ${context.tr(coloredText)}!",
            style: textTheme.labelMedium?.copyWith(
              color: colorScheme.primaryFixed,
              fontWeight: FontWeight.w800,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
