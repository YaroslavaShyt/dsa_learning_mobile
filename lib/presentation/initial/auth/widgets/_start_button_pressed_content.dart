part of '../auth_screen.dart';

class _StartButtonPressedContent extends StatelessWidget {
  const _StartButtonPressedContent({
    required this.onBackTapped,
    required this.onSignInButtonPressed,
    required this.onSignUpButtonPressed,
  });

  final VoidCallback onBackTapped;
  final VoidCallback onSignInButtonPressed;
  final VoidCallback onSignUpButtonPressed;

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
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _BackButton(
              onBackPressed: onBackTapped,
            ),
            MainOutlinedButton(
              onPressed: onSignInButtonPressed,
              child: Text(
                context.tr('signIn'),
                style: getTextTheme(context).labelMedium?.copyWith(
                      color: getColorScheme(context).primaryFixed,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            MainOutlinedButton(
              onPressed: onSignUpButtonPressed,
              child: Text(
                context.tr('signUp'),
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
