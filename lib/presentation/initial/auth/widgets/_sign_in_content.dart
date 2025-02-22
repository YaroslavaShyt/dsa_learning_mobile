part of '../auth_screen.dart';

class _SignInContent extends StatelessWidget {
  const _SignInContent({
    required this.isButtonActive,
    required this.onEmailEntered,
    required this.onPasswordEntered,
    required this.onBackTapped,
    required this.onConfirmButtonPressed,
  });

  final bool isButtonActive;
  final Function(String) onEmailEntered;
  final Function(String) onPasswordEntered;
  final VoidCallback onBackTapped;
  final VoidCallback onConfirmButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 20,
      right: 20,
      bottom: 50,
      child: MainContainer(
        height: 500,
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
            Text(
              context.tr('signIn'),
              style: getTextTheme(context).titleLarge?.copyWith(
                    color: getColorScheme(context).primaryFixed,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            MainTextField(
              labelText: context.tr('email'),
              onChanged: onEmailEntered,
            ),
            MainTextField(
              labelText: context.tr('password'),
              onChanged: onPasswordEntered,
            ),
            MainOutlinedButton(
              isActive: isButtonActive,
              onPressed: onConfirmButtonPressed,
              child: Text(
                context.tr('signIn'),
                style: getTextTheme(context).labelMedium?.copyWith(
                      color: isButtonActive
                          ? getColorScheme(context).primaryFixed
                          : getColorScheme(context)
                              .onSurface
                              .withValues(alpha: 0.3),
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
