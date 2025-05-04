part of '../profile_screen.dart';

class _ComponentBorder extends StatelessWidget {
  const _ComponentBorder({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = getColorScheme(context);

    return Container(
      height: 0.5,
      margin: const EdgeInsetsDirectional.symmetric(horizontal: 20),
      padding: const EdgeInsetsDirectional.symmetric(
        horizontal: 10,
        vertical: 20,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: colorScheme.onSurface),
        ),
        boxShadow: [
          BoxShadow(
            color: colorScheme.shadow.withValues(alpha: 0.3),
            offset: const Offset(0, 1),
            blurRadius: 10,
            spreadRadius: 1,
          ),
        ],
      ),
    );
  }
}
