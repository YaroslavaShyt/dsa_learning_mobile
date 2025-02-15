part of '../profile_screen.dart';

class _MenuSubcomponentsList extends StatelessWidget {
  const _MenuSubcomponentsList({
    this.components = const [],
    this.selectedComponent,
  });

  final List<String> components;
  final String? selectedComponent;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(
        start: 40,
        end: 40,
        bottom: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: components
            .map(
              (item) => _MenuSubcomponent(
                item: item,
                selectedComponent: selectedComponent,
              ),
            )
            .toList(),
      ),
    );
  }
}
