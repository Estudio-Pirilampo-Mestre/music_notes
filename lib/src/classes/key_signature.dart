part of music_notes;

class KeySignature {
  final int number;
  final Accidentals accidental;

  const KeySignature(this.number, [this.accidental])
      : assert(number != null),
        assert(number > 0 ? accidental != null : true);

  KeySignature.fromDistance(int distance)
      : this(
          distance.abs(),
          distance == 0
              ? null
              : distance > 0 ? Accidentals.Sostingut : Accidentals.Bemoll,
        );

  @override
  String toString() =>
      '$number' + (accidental != null ? ' × ${accidental.toText()}' : '');
}
