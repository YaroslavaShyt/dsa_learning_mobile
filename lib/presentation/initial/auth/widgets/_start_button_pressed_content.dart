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
    final Size size = MediaQuery.sizeOf(context);

    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        RobotAnimation(
          height: size.height / 2.5,
          width: size.width / 1.5,
        ),
        MainContainer(
          height: 300,
          margin: const EdgeInsetsDirectional.symmetric(horizontal: 20),
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
          content: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.only(top: 20),
                child: _BackButton(onBackPressed: onBackTapped),
              ),
              Expanded(
                child: Container(
                  padding:
                      const EdgeInsetsDirectional.symmetric(horizontal: 50),
                  child: Column(
                    spacing: 30,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MainOutlinedButton(
                        onPressed: onSignInButtonPressed,
                        child: Text(
                          context.tr('signIn'),
                          style: _getTextStyle(context),
                        ),
                      ),
                      MainOutlinedButton(
                        onPressed: onSignUpButtonPressed,
                        child: Text(
                          context.tr('signUp'),
                          style: _getTextStyle(context),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  TextStyle? _getTextStyle(BuildContext context) {
    return getTextTheme(context).labelMedium?.copyWith(
          color: getColorScheme(context).primaryFixed,
          fontWeight: FontWeight.bold,
        );
  }
}
