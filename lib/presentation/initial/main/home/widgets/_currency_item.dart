part of '../home_screen.dart';

class _CurrencyItem extends StatelessWidget {
  const _CurrencyItem({
    required this.text,
    required this.icon,
    required this.value,
    this.shouldShowDivider = true,
  });

  final String text;
  final String icon;
  final int value;
  final bool shouldShowDivider;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  icon,
                  height: 44,
                  width: 44,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(bottom: 8.0),
              child: Text(
                context.tr(text),
                style: getTextTheme(context).labelSmall?.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
              ),
            ),
            Text(
              "${value}x",
              style: getTextTheme(context).labelSmall?.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: getColorScheme(context).primaryFixed),
            ),
          ],
        ),
        if (shouldShowDivider)
          Container(
            height: 1,
            width: double.infinity,
            color: getColorScheme(context).onSurface,
          ),
      ],
    );
  }
}
