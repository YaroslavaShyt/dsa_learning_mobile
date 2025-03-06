part of '../../home_screen.dart';

class _BarChart extends StatelessWidget {
  const _BarChart({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = getColorScheme(context);
    return BarChart(
      BarChartData(
        backgroundColor: colorScheme.surface,
        maxY: 12,
        gridData: const FlGridData(
          show: false,
        ),
        borderData: FlBorderData(
          show: false,
        ),
        titlesData: _buildTitlesData(colorScheme),
        extraLinesData: _buildExtraLinesData(colorScheme),
        barGroups: [
          BarChartGroupData(
            x: 0,
            barRods: [
              BarChartRodData(
                toY: 9,
                width: 50,
                color: colorScheme.error,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(10),
                  topLeft: Radius.circular(10),
                ),
              ),
              BarChartRodData(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(10),
                  topLeft: Radius.circular(10),
                ),
                toY: 10,
                width: 50,
                color: colorScheme.onSecondaryContainer,
              ),
            ],
          ),
          BarChartGroupData(
            x: 1,
            barRods: [
              BarChartRodData(
                toY: 10,
                width: 50,
                color: colorScheme.error,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(10),
                  topLeft: Radius.circular(10),
                ),
              ),
              BarChartRodData(
                toY: 3,
                width: 50,
                color: colorScheme.onSecondaryContainer,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(10),
                  topLeft: Radius.circular(10),
                ),
              ),
            ],
          ),
          BarChartGroupData(
            x: 2,
            barRods: [
              BarChartRodData(
                toY: 4,
                width: 50,
                color: colorScheme.error,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(10),
                  topLeft: Radius.circular(10),
                ),
              ),
              BarChartRodData(
                toY: 8,
                width: 50,
                color: colorScheme.onSecondaryContainer,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(10),
                  topLeft: Radius.circular(10),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  FlTitlesData _buildTitlesData(ColorScheme colorScheme) {
    return const FlTitlesData(
        leftTitles: AxisTitles(
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
        )));
  }

  ExtraLinesData _buildExtraLinesData(ColorScheme colorScheme) {
    return ExtraLinesData(
      extraLinesOnTop: false,
      horizontalLines: [
        HorizontalLine(
          y: 0,
          color: colorScheme.onSurface,
          strokeWidth: 1,
        ),
        HorizontalLine(
          y: 3,
          color: colorScheme.onSurface.withValues(alpha: 0.5),
          strokeWidth: 1,
          dashArray: [0, 1, 1],
        ),
        HorizontalLine(
          y: 6,
          color: colorScheme.onSurface.withValues(alpha: 0.5),
          strokeWidth: 1,
          dashArray: [0, 1, 1],
        ),
      ],
      verticalLines: [
        VerticalLine(
          x: 1,
          color: colorScheme.onSurface,
          strokeWidth: 1,
          dashArray: [0, 1, 1],
        ),
        VerticalLine(
          x: 2,
          color: colorScheme.onSurface,
          strokeWidth: 1,
          dashArray: [0, 1, 1],
        ),
        VerticalLine(
          x: 3,
          color: colorScheme.onSurface,
          strokeWidth: 1,
          dashArray: [0, 1, 1],
        ),
      ],
    );
  }
}
