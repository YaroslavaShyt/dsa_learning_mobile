part of '../auth_screen.dart';

class _SignInContent extends StatefulWidget {
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
  State<_SignInContent> createState() => _SignInContentState();
}

class _SignInContentState extends State<_SignInContent> {
  late final FocusNode _emailFocusNode;

  @override
  void initState() {
    super.initState();
    _emailFocusNode = FocusNode();
    _emailFocusNode.requestFocus();
  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = getTextTheme(context);
    final ColorScheme colorScheme = getColorScheme(context);

    return MainContainer(
      height: 400,
      margin: const EdgeInsetsDirectional.symmetric(horizontal: 20),
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _BackButton(
            onBackPressed: widget.onBackTapped,
          ),
          Text(
            context.tr('signIn'),
            style: textTheme.titleLarge?.copyWith(
              color: colorScheme.primaryFixed,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 30.0),
            child: Column(
              spacing: 50,
              children: [
                MainTextField(
                  labelText: context.tr('email'),
                  onChanged: widget.onEmailEntered,
                  focusNode: _emailFocusNode,
                ),
                MainTextField(
                  labelText: context.tr('password'),
                  obscureText: true,
                  onChanged: widget.onPasswordEntered,
                  inputAction: TextInputAction.done,
                ),
                MainOutlinedButton(
                  isActive: widget.isButtonActive,
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    widget.onConfirmButtonPressed();
                  },
                  child: Text(
                    context.tr('confirm'),
                    style: textTheme.labelMedium?.copyWith(
                      color: widget.isButtonActive
                          ? colorScheme.primaryFixed
                          : colorScheme.onSurface.withValues(alpha: 0.3),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
