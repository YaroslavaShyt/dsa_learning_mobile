part of '../learn_screen.dart';

class _CategoryContainer extends StatelessWidget {
  const _CategoryContainer({
    required this.pattern,
  });

  final Pattern pattern;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = getTextTheme(context);
    return MainContainer(
      height: 240,
      width: double.infinity,
      padding: const EdgeInsetsDirectional.all(20),
      margin: const EdgeInsetsDirectional.only(start: 4, end: 4, bottom: 20),
      content: Stack(
        children: [
          Positioned(
            child: SizedBox(
              width: 100,
              child: Text(
                context.tr("sortingAlgorithms"),
                style: textTheme.labelSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          ...List.generate(
            4,
            (int index) {
              return MainDottedLine(
                position: pattern.dashPositions[index],
              );
            },
          ),
          ...List.generate(
            5,
            (int index) {
              return _LevelWidget(
                levelNum: (index + 1).toString(),
                position: pattern.positions[index],
                onTap: () {},
              );
            },
          ),
        ],
      ),
    );
  }
}
