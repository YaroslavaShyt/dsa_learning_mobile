part of '../../home_screen.dart';

class _BarChart extends StatelessWidget {
  const _BarChart({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = getColorScheme(context);
    final TextTheme textTheme = getTextTheme(context);

    return BlocBuilder<StatisticsCubit, StatisticsState>(
      builder: (BuildContext context, StatisticsState state) {
        return BarChart(
          BarChartData(
            barTouchData: _barTouchData(textTheme),
            backgroundColor: colorScheme.surface,
            maxY: state.maxValue.toDouble(),
            gridData: _gridData(colorScheme),
            borderData: FlBorderData(show: false),
            titlesData: _buildTitlesData(
              colorScheme,
              textTheme,
              state.statistics,
            ),
            extraLinesData: _buildExtraLinesData(colorScheme, state.maxValue),
            barGroups: _barChartGroupData(colorScheme, state),
          ),
        );
      },
    );
  }

  BarChartRodData _buildData({
    required int value,
    required Color color,
  }) {
    return BarChartRodData(
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(10),
        topLeft: Radius.circular(10),
      ),
      toY: value.toDouble(),
      width: 50,
      color: color,
    );
  }

  FlTitlesData _buildTitlesData(
    ColorScheme colorScheme,
    TextTheme textTheme,
    List<IStatistics> statistics,
  ) {
    return FlTitlesData(
      leftTitles: const AxisTitles(
        sideTitles: SideTitles(
          showTitles: false,
        ),
      ),
      rightTitles: const AxisTitles(
          sideTitles: SideTitles(
        showTitles: false,
      )),
      topTitles: const AxisTitles(
        sideTitles: SideTitles(
          showTitles: false,
        ),
      ),
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          getTitlesWidget: (double value, TitleMeta meta) {
            final int index = value.toInt();
            final String month = statistics[index].month;

            return Padding(
              padding: const EdgeInsetsDirectional.only(top: 6),
              child: Text(
                month.replaceFirst(
                  month[0],
                  month[0].toUpperCase(),
                ),
                style: textTheme.bodyMedium?.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: index == 2
                      ? colorScheme.onSurface
                      : colorScheme.onSurface.withValues(
                          alpha: 0.6,
                        ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  ExtraLinesData _buildExtraLinesData(ColorScheme colorScheme, int maxValue) {
    return ExtraLinesData(
      extraLinesOnTop: false,
      horizontalLines: [
        HorizontalLine(
          y: 0,
          color: colorScheme.onSurface,
          strokeWidth: 1.5,
        ),
      ],
      verticalLines: [
        VerticalLine(
          x: 1.5,
          color: colorScheme.onSurface,
          strokeWidth: 1,
          dashArray: [0, 1, 1],
        ),
        VerticalLine(
          x: 2.5,
          color: colorScheme.onSurface,
          strokeWidth: 1,
          dashArray: [0, 1, 1],
        ),
        VerticalLine(
          x: 3.5,
          color: colorScheme.error,
          strokeWidth: 15,
          dashArray: [0, 1, 1],
        ),
      ],
    );
  }

  BarTouchData _barTouchData(TextTheme textTheme) {
    return BarTouchData(
      enabled: false,
      touchTooltipData: BarTouchTooltipData(
        fitInsideVertically: true,
        tooltipMargin: -50,
        getTooltipColor: (spot) => Colors.transparent,
        getTooltipItem: (_, __, dot, ___) {
          return BarTooltipItem(
            dot.toY.toInt().toString(),
            textTheme.bodyMedium!.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          );
        },
      ),
    );
  }

  FlGridData _gridData(ColorScheme colorScheme) {
    return FlGridData(
      verticalInterval: 0.335,
      horizontalInterval: 5,
      getDrawingVerticalLine: (_) {
        return FlLine(
          color: colorScheme.onSurface.withValues(alpha: 0.4),
          dashArray: [0, 1, 1],
          strokeWidth: 1.2,
        );
      },
      getDrawingHorizontalLine: (_) {
        return FlLine(
          color: colorScheme.onSurface.withValues(alpha: 0.4),
          dashArray: [0, 1, 1],
          strokeWidth: 1.2,
        );
      },
    );
  }

  List<BarChartGroupData> _barChartGroupData(
      ColorScheme colorScheme, StatisticsState state) {
    return [
      ...state.statistics.map<BarChartGroupData>(
        (item) => BarChartGroupData(
          showingTooltipIndicators: [
            if (item.algorithms > 0) 0,
            if (item.dataStructures > 0) 1
          ],
          x: state.statistics.indexOf(item),
          barRods: [
            _buildData(
              value: item.algorithms,
              color: colorScheme.error,
            ),
            _buildData(
              value: item.dataStructures,
              color: colorScheme.onSecondaryContainer,
            ),
          ],
        ),
      ),
    ];
  }
}
