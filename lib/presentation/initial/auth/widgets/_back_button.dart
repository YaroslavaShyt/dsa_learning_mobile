part of '../auth_screen.dart';

class _BackButton extends StatelessWidget {
  const _BackButton({
    required this.onBackPressed,
});

  final VoidCallback onBackPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onBackPressed,
      child: Row(
        children: [
          Icon(
            Icons.arrow_back_ios_rounded,
            color: getColorScheme(context).onSurface,
          ),
          Text(
            context.tr('back'),
          )
        ],
      ),
    );
  }
}
