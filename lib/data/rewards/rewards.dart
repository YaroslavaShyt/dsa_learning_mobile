enum Rewards {
  endOfTheoryLesson(bytes: 10, hash: 0, vents: 0),
  endOfGame(bytes: 10, hash: 0, vents: 0);

  const Rewards({
    required this.bytes,
    required this.hash,
    required this.vents,
  });

  final int bytes;
  final int hash;
  final int vents;
}
