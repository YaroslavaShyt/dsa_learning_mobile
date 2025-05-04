part of '../../home_screen.dart';

class _StatisticsWidget extends StatelessWidget {
  const _StatisticsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = getColorScheme(context);

    return MainContainer(
      padding: const EdgeInsetsDirectional.all(10),
      content: Container(
        padding: const EdgeInsetsDirectional.all(10),
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.tr("statistics"),
              style: getTextTheme(context).labelSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
            ),
            const SizedBox(
              height: 200,
              child: _BarChart(),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _LegendItem(
                  title: "algorithms",
                  color: colorScheme.error,
                ),
                _LegendItem(
                  title: "dataStructures",
                  color: colorScheme.secondaryContainer,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              context.tr("minutesQuantity"),
              style: getTextTheme(context).labelSmall?.copyWith(
                    fontSize: 12,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
