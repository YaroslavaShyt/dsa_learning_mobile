part of '../profile_screen.dart';

class _AvatarWidget extends StatelessWidget {
  const _AvatarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = getColorScheme(context);
    final TextTheme textTheme = getTextTheme(context);
    return MainContainer(
      padding: EdgeInsetsDirectional.only(bottom: 10),
      margin: EdgeInsetsDirectional.only(bottom: 28),
      width: double.infinity,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsetsDirectional.symmetric(
              vertical: 22,
            ),
            height: 130,
            width: 130,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: getColorScheme(context).onSurface,
              boxShadow: [
                BoxShadow(
                  color: colorScheme.shadow.withValues(alpha: 0.2),
                  offset: Offset(4, 4),
                  blurRadius: 8,
                  spreadRadius: 1,
                ),
              ],
            ),
          ),
          Text(
            "Yaroslava Shyt",
            style: textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
