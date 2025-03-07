class Position {
  const Position({
    this.left,
    this.top,
    this.right,
    this.bottom,
    this.rotation,
  });

  final int? rotation;
  final double? left;
  final double? top;
  final double? right;
  final double? bottom;
}

class Pattern {
  const Pattern({
    required this.positions,
    required this.dashPositions,
  });

  final List<Position> positions;
  final List<Position> dashPositions;
}

const List<Pattern> patterns = [
  Pattern(
    positions: [
      Position(bottom: 10, left: 10),
      Position(bottom: 60, left: 60),
      Position(bottom: 40, left: 130),
      Position(bottom: 80, left: 200),
      Position(bottom: 120, left: 260),
    ],
    dashPositions: [
      Position(bottom: 50, left: 10, rotation: -45),
      Position(bottom: 80, left: 70, rotation: 20),
      Position(bottom: 80, left: 140, rotation: -30),
      Position(bottom: 120, left: 200, rotation: -30),
    ],
  ),
  Pattern(
    positions: [
      Position(bottom: 60, left: 10),
      Position(bottom: 10, left: 60),
      Position(bottom: 80, left: 130),
      Position(bottom: 30, left: 200),
      Position(bottom: 100, left: 260),
    ],
    dashPositions: [],
  ),
];
