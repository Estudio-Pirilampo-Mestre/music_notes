import 'dart:collection' show SplayTreeSet;

import 'package:music_notes/music_notes.dart';
import 'package:test/test.dart';

void main() {
  group('EnharmonicInterval', () {
    group('.intervalFromSemitones()', () {
      test('should return the correct Interval from semitones', () {
        expect(
          EnharmonicInterval.intervalFromSemitones(4),
          equals(const Interval(Intervals.third, Qualities.minor)),
        );
        expect(
          EnharmonicInterval.intervalFromSemitones(7),
          equals(const Interval(Intervals.fourth, Qualities.augmented)),
        );
        expect(
          EnharmonicInterval.intervalFromSemitones(7, Qualities.diminished),
          equals(const Interval(Intervals.fifth, Qualities.diminished)),
        );
      });
    });

    group('.transposeBy()', () {
      test(
        'should return the transposed EnharmonicInterval by semitones',
        () {
          expect(
            const EnharmonicInterval(1).transposeBy(2),
            const EnharmonicInterval(3),
          );
          expect(
            const EnharmonicInterval(6).transposeBy(-3),
            const EnharmonicInterval(3),
          );
          expect(
            const EnharmonicInterval(8).transposeBy(6),
            const EnharmonicInterval(2),
          );
          expect(
            const EnharmonicInterval(4).transposeBy(-6),
            const EnharmonicInterval(10),
          );
        },
      );
    });

    group('.hashCode', () {
      test('should ignore equal EnharmonicInterval instances in a Set', () {
        final collection = {
          const EnharmonicInterval(1),
          const EnharmonicInterval(5),
        };
        collection.addAll(collection);
        expect(collection.toList(), [
          const EnharmonicInterval(1),
          const EnharmonicInterval(5),
        ]);
      });
    });

    group('.compareTo()', () {
      test(
        'should correctly sort EnharmonicInterval items in a collection',
        () {
          final orderedSet = SplayTreeSet<EnharmonicInterval>.of([
            const EnharmonicInterval(2),
            const EnharmonicInterval(5),
            const EnharmonicInterval(1),
          ]);
          expect(orderedSet.toList(), [
            const EnharmonicInterval(1),
            const EnharmonicInterval(2),
            const EnharmonicInterval(5),
          ]);
        },
      );
    });
  });
}
