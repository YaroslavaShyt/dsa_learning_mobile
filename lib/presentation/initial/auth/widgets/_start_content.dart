part of '../auth_screen.dart';

class _StartContent extends StatelessWidget {
  const _StartContent({
    required this.onStartButtonPressed,
});

  final VoidCallback onStartButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 20,
      right: 20,
      bottom: 50,
      child: MainContainer(
        height: 300,
        padding: const EdgeInsetsDirectional.symmetric(
          horizontal: 80.0,
        ),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const _AuthText(),
            MainOutlinedButton(
              onPressed: onStartButtonPressed,
              child: Text(
                context.tr('start'),
                style: getTextTheme(context).labelMedium?.copyWith(
                  color: getColorScheme(context).primaryFixed,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
