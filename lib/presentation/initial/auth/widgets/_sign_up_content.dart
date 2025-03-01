part of '../auth_screen.dart';

class _SignUpContent extends StatefulWidget {
  const _SignUpContent({
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
  State<_SignUpContent> createState() => _SignUpContentState();
}

class _SignUpContentState extends State<_SignUpContent> {
  late final FocusNode _nameFocusNode;
  late final FocusNode _emailFocusNode;
  late final FocusNode _passwordFocusNode;
  late final FocusNode _confirmPasswordFocusNode;

  @override
  void initState() {
    super.initState();
    _nameFocusNode = FocusNode();
    _emailFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
    _confirmPasswordFocusNode = FocusNode();
    _nameFocusNode.requestFocus();
  }

  @override
  void dispose() {
    _nameFocusNode.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 20,
      right: 20,
      bottom: 50,
      child: MainContainer(
        height: 560,
        padding: const EdgeInsetsDirectional.symmetric(
          vertical: 20,
          horizontal: 30,
        ),
        content: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _BackButton(
              onBackPressed: widget.onBackTapped,
            ),
            Text(
              context.tr('signUp'),
              style: getTextTheme(context).titleLarge?.copyWith(
                    color: getColorScheme(context).primaryFixed,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.symmetric(
                horizontal: 20,
              ),
              child: Column(
                spacing: 28,
                children: [
                  MainTextField(
                    labelText: context.tr('name'),
                    onChanged: widget.onEmailEntered,
                    focusNode: _nameFocusNode,
                  ),
                  MainTextField(
                    labelText: context.tr('email'),
                    onChanged: widget.onPasswordEntered,
                    focusNode: _emailFocusNode,
                  ),
                  MainTextField(
                    labelText: context.tr('password'),
                    onChanged: widget.onPasswordEntered,
                    focusNode: _passwordFocusNode,
                  ),
                  MainTextField(
                    labelText:
                        '${context.tr('confirm')} ${context.tr('password').toLowerCase()}',
                    onChanged: widget.onPasswordEntered,
                    focusNode: _confirmPasswordFocusNode,
                  ),
                  MainOutlinedButton(
                    isActive: widget.isButtonActive,
                    onPressed: widget.onConfirmButtonPressed,
                    child: Text(
                      context.tr('confirm'),
                      style: getTextTheme(context).labelMedium?.copyWith(
                            color: widget.isButtonActive
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
          ],
        ),
      ),
    );
  }
}
