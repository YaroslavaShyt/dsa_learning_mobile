part of '../profile_screen.dart';

class _UserInfoWidget extends StatelessWidget {
  const _UserInfoWidget({
    required this.userName,
    required this.avatarPath,
    required this.onAvatarTap,
  });

  final String userName;
  final String avatarPath;
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
            child: SizedBox(
              width: 140,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  AvatarWidget(
                    size: 100,
                    avatarPath: avatarPath,
                  ),
                  Positioned(
                    right: 20,
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
