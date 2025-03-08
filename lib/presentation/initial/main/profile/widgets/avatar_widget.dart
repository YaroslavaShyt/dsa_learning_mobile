part of '../profile_screen.dart';

class _UserInfoWidget extends StatelessWidget {
  const _UserInfoWidget({
    required this.userName,
    required this.onAvatarTap,
  });

  final String userName;
  final VoidCallback onAvatarTap;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = getColorScheme(context);
    final TextTheme textTheme = getTextTheme(context);
    return MainContainer(
      padding: const EdgeInsetsDirectional.all(10),
      margin: const EdgeInsetsDirectional.only(bottom: 28),
      width: double.infinity,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: onAvatarTap,
            child: Stack(
              children: [
                AvatarWidget(size: 100),
                Positioned(
                  right: 10,
                  bottom: -6,
                  child: Text(
                    '+',
                    style: textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 30,
                    ),
                  ),
                )
              ],
            ),
          ),
          Text(
            userName,
            style: textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
