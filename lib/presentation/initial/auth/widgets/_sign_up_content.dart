part of '../auth_screen.dart';

class _SignUpContent extends StatefulWidget {
  const _SignUpContent({
    required this.onNameEntered,
    required this.isButtonActive,
    required this.onEmailEntered,
    required this.onPasswordEntered,
    required this.onBackTapped,
    required this.onConfirmButtonPressed,
    required this.onConfirmPasswordEntered,
  });

  final bool isButtonActive;
  final Function(String) onNameEntered;
  final Function(String) onEmailEntered;
  final Function(String) onPasswordEntered;
  final Function(String) onConfirmPasswordEntered;
  final VoidCallback onBackTapped;
  final VoidCallback onConfirmButtonPressed;

  @override
  State<_SignUpContent> createState() => _SignUpContentState();
}

class _SignUpContentState extends State<_SignUpContent> {
  late final FocusNode _nameFocusNode;

  @override
  void initState() {
    super.initState();
    _nameFocusNode = FocusNode();
    _nameFocusNode.requestFocus();
  }

  @override
  void dispose() {
    _nameFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = getTextTheme(context);
    final ColorScheme colorScheme = getColorScheme(context);

    return MainContainer(
      height: 560,
      margin: const EdgeInsetsDirectional.symmetric(horizontal: 20),
      padding: const EdgeInsetsDirectional.symmetric(
        vertical: 20,
        horizontal: 30,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _BackButton(onBackPressed: widget.onBackTapped),
          Text(
            context.tr('signUp'),
            style: textTheme.titleLarge?.copyWith(
              color: colorScheme.primaryFixed,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
            child: Column(
              spacing: 28,
              children: [
                MainTextField(
                  labelText: context.tr('name'),
                  onChanged: widget.onNameEntered,
                  focusNode: _nameFocusNode,
                ),
                MainTextField(
                  labelText: context.tr('email'),
                  onChanged: widget.onEmailEntered,
                ),
                MainTextField(
                  labelText: context.tr('password'),
                  onChanged: widget.onPasswordEntered,
                  obscureText: true,
                ),
                MainTextField(
                  labelText:
                      '${context.tr('confirm')} ${context.tr('password').toLowerCase()}',
                  onChanged: widget.onConfirmPasswordEntered,
                  inputAction: TextInputAction.done,
                  obscureText: true,
                ),
                MainOutlinedButton(
                  isActive: widget.isButtonActive,
                  onPressed: widget.onConfirmButtonPressed,
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
