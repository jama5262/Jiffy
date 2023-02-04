import 'package:jiffy/jiffy.dart';
import 'package:jiffy/src/enums/startOfWeek.dart';
import 'package:jiffy/src/getter.dart';
import 'package:jiffy/src/manipulator.dart';
import 'package:jiffy/src/query.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  final getter = Getter();
  final manipulator = Manipulator(getter);
  final underTest = Query(getter, manipulator);

  group('Test isBefore query', () {
    for (var testData in isBeforeDateTimeTestData()) {
      test('Should successfully return if datetime is before', () {
        // Setup
        final startOfWeek = StartOfWeek.MONDAY;

        // Execute
        final actualIsBefore = underTest.isBefore(testData['firstDateTime'],
            testData['secondDateTime'], testData['unit'], startOfWeek);

        // Verify
        expect(actualIsBefore, testData['expectedIsBefore']);
      });
    }

    for (var testData in isBeforeDateTimeWithStartOfWeekTestData()) {
      test(
          'Should successfully return if datetime is before with start of week',
          () {
        // Setup
        final unit = Unit.WEEK;

        // Execute
        final actualIsBefore = underTest.isBefore(testData['firstDateTime'],
            testData['secondDateTime'], unit, testData['startOfWeek']);

        // Verify
        expect(actualIsBefore, testData['expectedIsBefore']);
      });
    }
  });

  group('Test isAfter query', () {
    for (var testData in isAfterDateTimeTestData()) {
      test('Should successfully return if datetime is after', () {
        // Setup
        final startOfWeek = StartOfWeek.MONDAY;

        // Execute
        final actualIsAfter = underTest.isAfter(testData['firstDateTime'],
            testData['secondDateTime'], testData['unit'], startOfWeek);

        // Verify
        expect(actualIsAfter, testData['expectedIsAfter']);
      });
    }

    for (var testData in isAfterDateTimeWithStartOfWeekTestData()) {
      test('Should successfully return if datetime is after with start of week',
          () {
        // Setup
        final unit = Unit.WEEK;

        // Execute
        final actualIsAfter = underTest.isAfter(testData['firstDateTime'],
            testData['secondDateTime'], unit, testData['startOfWeek']);

        // Verify
        expect(actualIsAfter, testData['expectedIsAfter']);
      });
    }
  });

  group('Test isSame query', () {
    for (var testData in isSameDateTimeTestData()) {
      test('Should successfully return if datetime is same', () {
        // Setup
        final startOfWeek = StartOfWeek.MONDAY;

        // Execute
        final actualIsSame = underTest.isSame(testData['firstDateTime'],
            testData['secondDateTime'], testData['unit'], startOfWeek);

        // Verify
        expect(actualIsSame, testData['expectedIsSame']);
      });
    }

    for (var testData in isSameDateTimeWithStartOfWeekTestData()) {
      test('Should successfully return if datetime is same with start of week',
          () {
        // Setup
        final unit = Unit.WEEK;

        // Execute
        final actualIsSame = underTest.isSame(testData['firstDateTime'],
            testData['secondDateTime'], unit, testData['startOfWeek']);

        // Verify
        expect(actualIsSame, testData['expectedIsSame']);
      });
    }
  });

  group('Test isSameOrBefore query', () {
    for (var testData in isSameOrBeforeTimeTestData()) {
      test('Should successfully return if datetime is same or before', () {
        // Setup
        final startOfWeek = StartOfWeek.MONDAY;

        // Execute
        final actualIsSameOrBefore = underTest.isSameOrBefore(
            testData['firstDateTime'],
            testData['secondDateTime'],
            testData['unit'],
            startOfWeek);

        // Verify
        expect(actualIsSameOrBefore, testData['expectedIsSameOrBefore']);
      });
    }

    for (var testData in isSameOrBeforeDateTimeWithStartOfWeekTestData()) {
      test(
          'Should successfully return if datetime is same or before with start of week',
          () {
        // Setup
        final unit = Unit.WEEK;

        // Execute
        final actualIsSameOrBefore = underTest.isSameOrBefore(
            testData['firstDateTime'],
            testData['secondDateTime'],
            unit,
            testData['startOfWeek']);

        // Verify
        expect(actualIsSameOrBefore, testData['expectedIsSameOrBefore']);
      });
    }
  });

  group('Test isSameOrAfter query', () {
    for (var testData in isSameOrAfterTimeTestData()) {
      test('Should successfully return if datetime is same or after', () {
        // Setup
        final startOfWeek = StartOfWeek.MONDAY;

        // Execute
        final actualIsSameOrAfter = underTest.isSameOrAfter(
            testData['firstDateTime'],
            testData['secondDateTime'],
            testData['unit'],
            startOfWeek);

        // Verify
        expect(actualIsSameOrAfter, testData['expectedIsSameOrAfter']);
      });
    }

    for (var testData in isSameOrAfterDateTimeWithStartOfWeekTestData()) {
      test(
          'Should successfully return if datetime is same or before with start of week',
          () {
        // Setup
        final unit = Unit.WEEK;

        // Execute
        final actualIsSameOrAfter = underTest.isSameOrAfter(
            testData['firstDateTime'],
            testData['secondDateTime'],
            unit,
            testData['startOfWeek']);

        // Verify
        expect(actualIsSameOrAfter, testData['expectedIsSameOrAfter']);
      });
    }
  });

  group('Test isBetween query', () {
    for (var testData in isBetweenTimeTestData()) {
      test('Should successfully return if datetime is between', () {
        // Setup
        final startOfWeek = StartOfWeek.MONDAY;

        // Execute
        final actualIsBetween = underTest.isBetween(
            testData['firstDateTime'],
            testData['secondDateTime'],
            testData['thirdDateTime'],
            testData['unit'],
            startOfWeek);

        // Verify
        expect(actualIsBetween, testData['expectedIsBetween']);
      });
    }

    for (var testData in isBetweenDateTimeWithStartOfWeekTestData()) {
      test(
          'Should successfully return if datetime is between with start of week',
          () {
        // Setup
        final unit = Unit.WEEK;

        // Execute
        final actualIsBetween = underTest.isBetween(
            testData['firstDateTime'],
            testData['secondDateTime'],
            testData['thirdDateTime'],
            unit,
            testData['startOfWeek']);

        // Verify
        expect(actualIsBetween, testData['expectedIsBetween']);
      });
    }
  });

  for (var testData in isUtcDateTimeTestData()) {
    test('Should successfully check if date time is utc', () {
      // Execute
      final actualIsUtc = Query.isUtc(testData['dateTime']);

      // Verify
      expect(actualIsUtc, testData['expectedIsUtc']);
    });
  }

  for (var testData in isLeapYearTestData()) {
    test('Should successfully check if year is a leap year', () {
      // Execute
      final actualIsLeapYear = Query.isLeapYear(testData['year']);

      // Verify
      expect(actualIsLeapYear, testData['expectedIsLeapYear']);
    });
  }
}

List<Map<String, dynamic>> isBeforeDateTimeTestData() {
  return [
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 1),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 2),
      'unit': Unit.MICROSECOND,
      'expectedIsBefore': true
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 3),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 2),
      'unit': Unit.MICROSECOND,
      'expectedIsBefore': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 2),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 2),
      'unit': Unit.MICROSECOND,
      'expectedIsBefore': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 22, 1),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 22, 2),
      'unit': Unit.MILLISECOND,
      'expectedIsBefore': true
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 22, 3),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 22, 2),
      'unit': Unit.MILLISECOND,
      'expectedIsBefore': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 22, 2),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 22, 2),
      'unit': Unit.MILLISECOND,
      'expectedIsBefore': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 1),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 2),
      'unit': Unit.SECOND,
      'expectedIsBefore': true
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 3),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 2),
      'unit': Unit.SECOND,
      'expectedIsBefore': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 2),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 2),
      'unit': Unit.SECOND,
      'expectedIsBefore': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 1),
      'secondDateTime': DateTime(1997, 9, 23, 12, 2),
      'unit': Unit.MINUTE,
      'expectedIsBefore': true
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 3),
      'secondDateTime': DateTime(1997, 9, 23, 12, 2),
      'unit': Unit.MINUTE,
      'expectedIsBefore': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 2),
      'secondDateTime': DateTime(1997, 9, 23, 12, 2),
      'unit': Unit.MINUTE,
      'expectedIsBefore': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 1),
      'secondDateTime': DateTime(1997, 9, 23, 2),
      'unit': Unit.HOUR,
      'expectedIsBefore': true
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 3),
      'secondDateTime': DateTime(1997, 9, 23, 2),
      'unit': Unit.HOUR,
      'expectedIsBefore': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 2),
      'secondDateTime': DateTime(1997, 9, 23, 2),
      'unit': Unit.HOUR,
      'expectedIsBefore': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 1),
      'secondDateTime': DateTime(1997, 9, 2),
      'unit': Unit.DAY,
      'expectedIsBefore': true
    },
    {
      'firstDateTime': DateTime(1997, 9, 3),
      'secondDateTime': DateTime(1997, 9, 2),
      'unit': Unit.DAY,
      'expectedIsBefore': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 2),
      'secondDateTime': DateTime(1997, 9, 2),
      'unit': Unit.DAY,
      'expectedIsBefore': false
    },
    {
      'firstDateTime': DateTime(2022, 12, 5),
      'secondDateTime': DateTime(2022, 12, 12),
      'unit': Unit.WEEK,
      'expectedIsBefore': true
    },
    {
      'firstDateTime': DateTime(2022, 12, 5),
      'secondDateTime': DateTime(2022, 12, 5),
      'unit': Unit.WEEK,
      'expectedIsBefore': false
    },
    {
      'firstDateTime': DateTime(2022, 12, 5),
      'secondDateTime': DateTime(2022, 12, 8),
      'unit': Unit.WEEK,
      'expectedIsBefore': false
    },
    {
      'firstDateTime': DateTime(2022, 12, 5),
      'secondDateTime': DateTime(2022, 12, 3),
      'unit': Unit.WEEK,
      'expectedIsBefore': false
    },
    {
      'firstDateTime': DateTime(1997, 1),
      'secondDateTime': DateTime(1997, 2),
      'unit': Unit.MONTH,
      'expectedIsBefore': true
    },
    {
      'firstDateTime': DateTime(1997, 3),
      'secondDateTime': DateTime(1997, 2),
      'unit': Unit.MONTH,
      'expectedIsBefore': false
    },
    {
      'firstDateTime': DateTime(1997, 2),
      'secondDateTime': DateTime(1997, 2),
      'unit': Unit.MONTH,
      'expectedIsBefore': false
    },
    {
      'firstDateTime': DateTime(1996),
      'secondDateTime': DateTime(1997),
      'unit': Unit.YEAR,
      'expectedIsBefore': true
    },
    {
      'firstDateTime': DateTime(1998),
      'secondDateTime': DateTime(1997),
      'unit': Unit.YEAR,
      'expectedIsBefore': false
    },
    {
      'firstDateTime': DateTime(1997),
      'secondDateTime': DateTime(1997),
      'unit': Unit.YEAR,
      'expectedIsBefore': false
    },
  ];
}

List<Map<String, dynamic>> isBeforeDateTimeWithStartOfWeekTestData() {
  return [
    {
      'firstDateTime': DateTime(2022, 12, 5),
      'secondDateTime': DateTime(2022, 12, 12),
      'startOfWeek': StartOfWeek.MONDAY,
      'expectedIsBefore': true
    },
    {
      'firstDateTime': DateTime(2022, 12, 6),
      'secondDateTime': DateTime(2022, 12, 7),
      'startOfWeek': StartOfWeek.MONDAY,
      'expectedIsBefore': false
    },
    {
      'firstDateTime': DateTime(2022, 12, 6),
      'secondDateTime': DateTime(2022, 12, 4),
      'startOfWeek': StartOfWeek.MONDAY,
      'expectedIsBefore': false
    },
    {
      'firstDateTime': DateTime(2022, 12, 6),
      'secondDateTime': DateTime(2022, 12, 11),
      'startOfWeek': StartOfWeek.MONDAY,
      'expectedIsBefore': false
    },
    {
      'firstDateTime': DateTime(2022, 12, 5),
      'secondDateTime': DateTime(2022, 12, 11),
      'startOfWeek': StartOfWeek.SUNDAY,
      'expectedIsBefore': true
    },
    {
      'firstDateTime': DateTime(2022, 12, 6),
      'secondDateTime': DateTime(2022, 12, 7),
      'startOfWeek': StartOfWeek.SUNDAY,
      'expectedIsBefore': false
    },
    {
      'firstDateTime': DateTime(2022, 12, 6),
      'secondDateTime': DateTime(2022, 12, 3),
      'startOfWeek': StartOfWeek.SUNDAY,
      'expectedIsBefore': false
    },
    {
      'firstDateTime': DateTime(2022, 12, 6),
      'secondDateTime': DateTime(2022, 12, 10),
      'startOfWeek': StartOfWeek.SUNDAY,
      'expectedIsBefore': false
    },
    {
      'firstDateTime': DateTime(2022, 12, 5),
      'secondDateTime': DateTime(2022, 12, 10),
      'startOfWeek': StartOfWeek.SATURDAY,
      'expectedIsBefore': true
    },
    {
      'firstDateTime': DateTime(2022, 12, 6),
      'secondDateTime': DateTime(2022, 12, 7),
      'startOfWeek': StartOfWeek.SATURDAY,
      'expectedIsBefore': false
    },
    {
      'firstDateTime': DateTime(2022, 12, 6),
      'secondDateTime': DateTime(2022, 12, 2),
      'startOfWeek': StartOfWeek.SATURDAY,
      'expectedIsBefore': false
    },
    {
      'firstDateTime': DateTime(2022, 12, 6),
      'secondDateTime': DateTime(2022, 12, 9),
      'startOfWeek': StartOfWeek.SATURDAY,
      'expectedIsBefore': false
    },
  ];
}

List<Map<String, dynamic>> isAfterDateTimeTestData() {
  return [
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 1),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 2),
      'unit': Unit.MICROSECOND,
      'expectedIsAfter': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 3),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 2),
      'unit': Unit.MICROSECOND,
      'expectedIsAfter': true
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 2),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 2),
      'unit': Unit.MICROSECOND,
      'expectedIsAfter': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 22, 1),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 22, 2),
      'unit': Unit.MILLISECOND,
      'expectedIsAfter': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 22, 3),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 22, 2),
      'unit': Unit.MILLISECOND,
      'expectedIsAfter': true
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 22, 2),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 22, 2),
      'unit': Unit.MILLISECOND,
      'expectedIsAfter': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 1),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 2),
      'unit': Unit.SECOND,
      'expectedIsAfter': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 3),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 2),
      'unit': Unit.SECOND,
      'expectedIsAfter': true
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 2),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 2),
      'unit': Unit.SECOND,
      'expectedIsAfter': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 1),
      'secondDateTime': DateTime(1997, 9, 23, 12, 2),
      'unit': Unit.MINUTE,
      'expectedIsAfter': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 3),
      'secondDateTime': DateTime(1997, 9, 23, 12, 2),
      'unit': Unit.MINUTE,
      'expectedIsAfter': true
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 2),
      'secondDateTime': DateTime(1997, 9, 23, 12, 2),
      'unit': Unit.MINUTE,
      'expectedIsAfter': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 1),
      'secondDateTime': DateTime(1997, 9, 23, 2),
      'unit': Unit.HOUR,
      'expectedIsAfter': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 3),
      'secondDateTime': DateTime(1997, 9, 23, 2),
      'unit': Unit.HOUR,
      'expectedIsAfter': true
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 2),
      'secondDateTime': DateTime(1997, 9, 23, 2),
      'unit': Unit.HOUR,
      'expectedIsAfter': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 1),
      'secondDateTime': DateTime(1997, 9, 2),
      'unit': Unit.DAY,
      'expectedIsAfter': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 3),
      'secondDateTime': DateTime(1997, 9, 2),
      'unit': Unit.DAY,
      'expectedIsAfter': true
    },
    {
      'firstDateTime': DateTime(1997, 9, 2),
      'secondDateTime': DateTime(1997, 9, 2),
      'unit': Unit.DAY,
      'expectedIsAfter': false
    },
    {
      'firstDateTime': DateTime(2022, 12, 5),
      'secondDateTime': DateTime(2022, 12, 12),
      'unit': Unit.WEEK,
      'expectedIsAfter': false
    },
    {
      'firstDateTime': DateTime(2022, 12, 5),
      'secondDateTime': DateTime(2022, 12, 5),
      'unit': Unit.WEEK,
      'expectedIsAfter': false
    },
    {
      'firstDateTime': DateTime(2022, 12, 5),
      'secondDateTime': DateTime(2022, 12, 8),
      'unit': Unit.WEEK,
      'expectedIsAfter': false
    },
    {
      'firstDateTime': DateTime(2022, 12, 5),
      'secondDateTime': DateTime(2022, 12, 3),
      'unit': Unit.WEEK,
      'expectedIsAfter': true
    },
    {
      'firstDateTime': DateTime(1997, 1),
      'secondDateTime': DateTime(1997, 2),
      'unit': Unit.MONTH,
      'expectedIsAfter': false
    },
    {
      'firstDateTime': DateTime(1997, 3),
      'secondDateTime': DateTime(1997, 2),
      'unit': Unit.MONTH,
      'expectedIsAfter': true
    },
    {
      'firstDateTime': DateTime(1997, 2),
      'secondDateTime': DateTime(1997, 2),
      'unit': Unit.MONTH,
      'expectedIsAfter': false
    },
    {
      'firstDateTime': DateTime(1996),
      'secondDateTime': DateTime(1997),
      'unit': Unit.YEAR,
      'expectedIsAfter': false
    },
    {
      'firstDateTime': DateTime(1998),
      'secondDateTime': DateTime(1997),
      'unit': Unit.YEAR,
      'expectedIsAfter': true
    },
    {
      'firstDateTime': DateTime(1997),
      'secondDateTime': DateTime(1997),
      'unit': Unit.YEAR,
      'expectedIsAfter': false
    },
  ];
}

List<Map<String, dynamic>> isAfterDateTimeWithStartOfWeekTestData() {
  return [
    {
      'firstDateTime': DateTime(2022, 12, 5),
      'secondDateTime': DateTime(2022, 12, 12),
      'startOfWeek': StartOfWeek.MONDAY,
      'expectedIsAfter': false
    },
    {
      'firstDateTime': DateTime(2022, 12, 6),
      'secondDateTime': DateTime(2022, 12, 7),
      'startOfWeek': StartOfWeek.MONDAY,
      'expectedIsAfter': false
    },
    {
      'firstDateTime': DateTime(2022, 12, 6),
      'secondDateTime': DateTime(2022, 12, 4),
      'startOfWeek': StartOfWeek.MONDAY,
      'expectedIsAfter': true
    },
    {
      'firstDateTime': DateTime(2022, 12, 6),
      'secondDateTime': DateTime(2022, 12, 5),
      'startOfWeek': StartOfWeek.MONDAY,
      'expectedIsAfter': false
    },
    {
      'firstDateTime': DateTime(2022, 12, 5),
      'secondDateTime': DateTime(2022, 12, 11),
      'startOfWeek': StartOfWeek.SUNDAY,
      'expectedIsAfter': false
    },
    {
      'firstDateTime': DateTime(2022, 12, 6),
      'secondDateTime': DateTime(2022, 12, 7),
      'startOfWeek': StartOfWeek.SUNDAY,
      'expectedIsAfter': false
    },
    {
      'firstDateTime': DateTime(2022, 12, 6),
      'secondDateTime': DateTime(2022, 12, 3),
      'startOfWeek': StartOfWeek.SUNDAY,
      'expectedIsAfter': true
    },
    {
      'firstDateTime': DateTime(2022, 12, 6),
      'secondDateTime': DateTime(2022, 12, 4),
      'startOfWeek': StartOfWeek.SUNDAY,
      'expectedIsAfter': false
    },
    {
      'firstDateTime': DateTime(2022, 12, 5),
      'secondDateTime': DateTime(2022, 12, 10),
      'startOfWeek': StartOfWeek.SATURDAY,
      'expectedIsAfter': false
    },
    {
      'firstDateTime': DateTime(2022, 12, 6),
      'secondDateTime': DateTime(2022, 12, 7),
      'startOfWeek': StartOfWeek.SATURDAY,
      'expectedIsAfter': false
    },
    {
      'firstDateTime': DateTime(2022, 12, 6),
      'secondDateTime': DateTime(2022, 12, 2),
      'startOfWeek': StartOfWeek.SATURDAY,
      'expectedIsAfter': true
    },
    {
      'firstDateTime': DateTime(2022, 12, 6),
      'secondDateTime': DateTime(2022, 12, 3),
      'startOfWeek': StartOfWeek.SATURDAY,
      'expectedIsAfter': false
    },
  ];
}

List<Map<String, dynamic>> isSameDateTimeTestData() {
  return [
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 1),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 2),
      'unit': Unit.MICROSECOND,
      'expectedIsSame': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 3),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 2),
      'unit': Unit.MICROSECOND,
      'expectedIsSame': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 2),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 2),
      'unit': Unit.MICROSECOND,
      'expectedIsSame': true
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 22, 1),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 22, 2),
      'unit': Unit.MILLISECOND,
      'expectedIsSame': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 22, 3),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 22, 2),
      'unit': Unit.MILLISECOND,
      'expectedIsSame': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 22, 2),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 22, 2),
      'unit': Unit.MILLISECOND,
      'expectedIsSame': true
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 1),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 2),
      'unit': Unit.SECOND,
      'expectedIsSame': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 3),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 2),
      'unit': Unit.SECOND,
      'expectedIsSame': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 2),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 2),
      'unit': Unit.SECOND,
      'expectedIsSame': true
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 1),
      'secondDateTime': DateTime(1997, 9, 23, 12, 2),
      'unit': Unit.MINUTE,
      'expectedIsSame': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 3),
      'secondDateTime': DateTime(1997, 9, 23, 12, 2),
      'unit': Unit.MINUTE,
      'expectedIsSame': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 2),
      'secondDateTime': DateTime(1997, 9, 23, 12, 2),
      'unit': Unit.MINUTE,
      'expectedIsSame': true
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 1),
      'secondDateTime': DateTime(1997, 9, 23, 2),
      'unit': Unit.HOUR,
      'expectedIsSame': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 3),
      'secondDateTime': DateTime(1997, 9, 23, 2),
      'unit': Unit.HOUR,
      'expectedIsSame': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 2),
      'secondDateTime': DateTime(1997, 9, 23, 2),
      'unit': Unit.HOUR,
      'expectedIsSame': true
    },
    {
      'firstDateTime': DateTime(1997, 9, 1),
      'secondDateTime': DateTime(1997, 9, 2),
      'unit': Unit.DAY,
      'expectedIsSame': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 3),
      'secondDateTime': DateTime(1997, 9, 2),
      'unit': Unit.DAY,
      'expectedIsSame': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 2),
      'secondDateTime': DateTime(1997, 9, 2),
      'unit': Unit.DAY,
      'expectedIsSame': true
    },
    {
      'firstDateTime': DateTime(2022, 12, 5),
      'secondDateTime': DateTime(2022, 12, 12),
      'unit': Unit.WEEK,
      'expectedIsSame': false
    },
    {
      'firstDateTime': DateTime(2022, 12, 5),
      'secondDateTime': DateTime(2022, 12, 5),
      'unit': Unit.WEEK,
      'expectedIsSame': true
    },
    {
      'firstDateTime': DateTime(2022, 12, 5),
      'secondDateTime': DateTime(2022, 12, 8),
      'unit': Unit.WEEK,
      'expectedIsSame': true
    },
    {
      'firstDateTime': DateTime(2022, 12, 5),
      'secondDateTime': DateTime(2022, 12, 3),
      'unit': Unit.WEEK,
      'expectedIsSame': false
    },
    {
      'firstDateTime': DateTime(1997, 1),
      'secondDateTime': DateTime(1997, 2),
      'unit': Unit.MONTH,
      'expectedIsSame': false
    },
    {
      'firstDateTime': DateTime(1997, 3),
      'secondDateTime': DateTime(1997, 2),
      'unit': Unit.MONTH,
      'expectedIsSame': false
    },
    {
      'firstDateTime': DateTime(1997, 2),
      'secondDateTime': DateTime(1997, 2),
      'unit': Unit.MONTH,
      'expectedIsSame': true
    },
    {
      'firstDateTime': DateTime(1996),
      'secondDateTime': DateTime(1997),
      'unit': Unit.YEAR,
      'expectedIsSame': false
    },
    {
      'firstDateTime': DateTime(1998),
      'secondDateTime': DateTime(1997),
      'unit': Unit.YEAR,
      'expectedIsSame': false
    },
    {
      'firstDateTime': DateTime(1997),
      'secondDateTime': DateTime(1997),
      'unit': Unit.YEAR,
      'expectedIsSame': true
    },
  ];
}

List<Map<String, dynamic>> isSameDateTimeWithStartOfWeekTestData() {
  return [
    {
      'firstDateTime': DateTime(2022, 12, 5),
      'secondDateTime': DateTime(2022, 12, 12),
      'startOfWeek': StartOfWeek.MONDAY,
      'expectedIsSame': false
    },
    {
      'firstDateTime': DateTime(2022, 12, 6),
      'secondDateTime': DateTime(2022, 12, 7),
      'startOfWeek': StartOfWeek.MONDAY,
      'expectedIsSame': true
    },
    {
      'firstDateTime': DateTime(2022, 12, 6),
      'secondDateTime': DateTime(2022, 12, 4),
      'startOfWeek': StartOfWeek.MONDAY,
      'expectedIsSame': false
    },
    {
      'firstDateTime': DateTime(2022, 12, 6),
      'secondDateTime': DateTime(2022, 12, 5),
      'startOfWeek': StartOfWeek.MONDAY,
      'expectedIsSame': true
    },
    {
      'firstDateTime': DateTime(2022, 12, 5),
      'secondDateTime': DateTime(2022, 12, 11),
      'startOfWeek': StartOfWeek.SUNDAY,
      'expectedIsSame': false
    },
    {
      'firstDateTime': DateTime(2022, 12, 6),
      'secondDateTime': DateTime(2022, 12, 7),
      'startOfWeek': StartOfWeek.SUNDAY,
      'expectedIsSame': true
    },
    {
      'firstDateTime': DateTime(2022, 12, 6),
      'secondDateTime': DateTime(2022, 12, 3),
      'startOfWeek': StartOfWeek.SUNDAY,
      'expectedIsSame': false
    },
    {
      'firstDateTime': DateTime(2022, 12, 6),
      'secondDateTime': DateTime(2022, 12, 4),
      'startOfWeek': StartOfWeek.SUNDAY,
      'expectedIsSame': true
    },
    {
      'firstDateTime': DateTime(2022, 12, 5),
      'secondDateTime': DateTime(2022, 12, 10),
      'startOfWeek': StartOfWeek.SATURDAY,
      'expectedIsSame': false
    },
    {
      'firstDateTime': DateTime(2022, 12, 6),
      'secondDateTime': DateTime(2022, 12, 7),
      'startOfWeek': StartOfWeek.SATURDAY,
      'expectedIsSame': true
    },
    {
      'firstDateTime': DateTime(2022, 12, 6),
      'secondDateTime': DateTime(2022, 12, 2),
      'startOfWeek': StartOfWeek.SATURDAY,
      'expectedIsSame': false
    },
    {
      'firstDateTime': DateTime(2022, 12, 6),
      'secondDateTime': DateTime(2022, 12, 3),
      'startOfWeek': StartOfWeek.SATURDAY,
      'expectedIsSame': true
    },
  ];
}

List<Map<String, dynamic>> isSameOrBeforeTimeTestData() {
  return [
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 1),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 2),
      'unit': Unit.MICROSECOND,
      'expectedIsSameOrBefore': true
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 3),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 2),
      'unit': Unit.MICROSECOND,
      'expectedIsSameOrBefore': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 2),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 2),
      'unit': Unit.MICROSECOND,
      'expectedIsSameOrBefore': true
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 22, 1),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 22, 2),
      'unit': Unit.MILLISECOND,
      'expectedIsSameOrBefore': true
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 22, 3),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 22, 2),
      'unit': Unit.MILLISECOND,
      'expectedIsSameOrBefore': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 22, 2),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 22, 2),
      'unit': Unit.MILLISECOND,
      'expectedIsSameOrBefore': true
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 1),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 2),
      'unit': Unit.SECOND,
      'expectedIsSameOrBefore': true
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 3),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 2),
      'unit': Unit.SECOND,
      'expectedIsSameOrBefore': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 2),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 2),
      'unit': Unit.SECOND,
      'expectedIsSameOrBefore': true
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 1),
      'secondDateTime': DateTime(1997, 9, 23, 12, 2),
      'unit': Unit.MINUTE,
      'expectedIsSameOrBefore': true
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 3),
      'secondDateTime': DateTime(1997, 9, 23, 12, 2),
      'unit': Unit.MINUTE,
      'expectedIsSameOrBefore': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 2),
      'secondDateTime': DateTime(1997, 9, 23, 12, 2),
      'unit': Unit.MINUTE,
      'expectedIsSameOrBefore': true
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 1),
      'secondDateTime': DateTime(1997, 9, 23, 2),
      'unit': Unit.HOUR,
      'expectedIsSameOrBefore': true
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 3),
      'secondDateTime': DateTime(1997, 9, 23, 2),
      'unit': Unit.HOUR,
      'expectedIsSameOrBefore': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 2),
      'secondDateTime': DateTime(1997, 9, 23, 2),
      'unit': Unit.HOUR,
      'expectedIsSameOrBefore': true
    },
    {
      'firstDateTime': DateTime(1997, 9, 1),
      'secondDateTime': DateTime(1997, 9, 2),
      'unit': Unit.DAY,
      'expectedIsSameOrBefore': true
    },
    {
      'firstDateTime': DateTime(1997, 9, 3),
      'secondDateTime': DateTime(1997, 9, 2),
      'unit': Unit.DAY,
      'expectedIsSameOrBefore': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 2),
      'secondDateTime': DateTime(1997, 9, 2),
      'unit': Unit.DAY,
      'expectedIsSameOrBefore': true
    },
    {
      'firstDateTime': DateTime(2022, 12, 5),
      'secondDateTime': DateTime(2022, 12, 12),
      'unit': Unit.WEEK,
      'expectedIsSameOrBefore': true
    },
    {
      'firstDateTime': DateTime(2022, 12, 5),
      'secondDateTime': DateTime(2022, 12, 5),
      'unit': Unit.WEEK,
      'expectedIsSameOrBefore': true
    },
    {
      'firstDateTime': DateTime(2022, 12, 5),
      'secondDateTime': DateTime(2022, 12, 8),
      'unit': Unit.WEEK,
      'expectedIsSameOrBefore': true
    },
    {
      'firstDateTime': DateTime(2022, 12, 5),
      'secondDateTime': DateTime(2022, 12, 3),
      'unit': Unit.WEEK,
      'expectedIsSameOrBefore': false
    },
    {
      'firstDateTime': DateTime(1997, 1),
      'secondDateTime': DateTime(1997, 2),
      'unit': Unit.MONTH,
      'expectedIsSameOrBefore': true
    },
    {
      'firstDateTime': DateTime(1997, 3),
      'secondDateTime': DateTime(1997, 2),
      'unit': Unit.MONTH,
      'expectedIsSameOrBefore': false
    },
    {
      'firstDateTime': DateTime(1997, 2),
      'secondDateTime': DateTime(1997, 2),
      'unit': Unit.MONTH,
      'expectedIsSameOrBefore': true
    },
    {
      'firstDateTime': DateTime(1996),
      'secondDateTime': DateTime(1997),
      'unit': Unit.YEAR,
      'expectedIsSameOrBefore': true
    },
    {
      'firstDateTime': DateTime(1998),
      'secondDateTime': DateTime(1997),
      'unit': Unit.YEAR,
      'expectedIsSameOrBefore': false
    },
    {
      'firstDateTime': DateTime(1997),
      'secondDateTime': DateTime(1997),
      'unit': Unit.YEAR,
      'expectedIsSameOrBefore': true
    },
  ];
}

List<Map<String, dynamic>> isSameOrBeforeDateTimeWithStartOfWeekTestData() {
  return [
    {
      'firstDateTime': DateTime(2022, 12, 5),
      'secondDateTime': DateTime(2022, 12, 12),
      'startOfWeek': StartOfWeek.MONDAY,
      'expectedIsSameOrBefore': true
    },
    {
      'firstDateTime': DateTime(2022, 12, 6),
      'secondDateTime': DateTime(2022, 12, 7),
      'startOfWeek': StartOfWeek.MONDAY,
      'expectedIsSameOrBefore': true
    },
    {
      'firstDateTime': DateTime(2022, 12, 6),
      'secondDateTime': DateTime(2022, 12, 4),
      'startOfWeek': StartOfWeek.MONDAY,
      'expectedIsSameOrBefore': false
    },
    {
      'firstDateTime': DateTime(2022, 12, 6),
      'secondDateTime': DateTime(2022, 12, 5),
      'startOfWeek': StartOfWeek.MONDAY,
      'expectedIsSameOrBefore': true
    },
    {
      'firstDateTime': DateTime(2022, 12, 5),
      'secondDateTime': DateTime(2022, 12, 11),
      'startOfWeek': StartOfWeek.SUNDAY,
      'expectedIsSameOrBefore': true
    },
    {
      'firstDateTime': DateTime(2022, 12, 6),
      'secondDateTime': DateTime(2022, 12, 7),
      'startOfWeek': StartOfWeek.SUNDAY,
      'expectedIsSameOrBefore': true
    },
    {
      'firstDateTime': DateTime(2022, 12, 6),
      'secondDateTime': DateTime(2022, 12, 3),
      'startOfWeek': StartOfWeek.SUNDAY,
      'expectedIsSameOrBefore': false
    },
    {
      'firstDateTime': DateTime(2022, 12, 6),
      'secondDateTime': DateTime(2022, 12, 4),
      'startOfWeek': StartOfWeek.SUNDAY,
      'expectedIsSameOrBefore': true
    },
    {
      'firstDateTime': DateTime(2022, 12, 5),
      'secondDateTime': DateTime(2022, 12, 10),
      'startOfWeek': StartOfWeek.SATURDAY,
      'expectedIsSameOrBefore': true
    },
    {
      'firstDateTime': DateTime(2022, 12, 6),
      'secondDateTime': DateTime(2022, 12, 7),
      'startOfWeek': StartOfWeek.SATURDAY,
      'expectedIsSameOrBefore': true
    },
    {
      'firstDateTime': DateTime(2022, 12, 6),
      'secondDateTime': DateTime(2022, 12, 2),
      'startOfWeek': StartOfWeek.SATURDAY,
      'expectedIsSameOrBefore': false
    },
    {
      'firstDateTime': DateTime(2022, 12, 6),
      'secondDateTime': DateTime(2022, 12, 3),
      'startOfWeek': StartOfWeek.SATURDAY,
      'expectedIsSameOrBefore': true
    },
  ];
}

List<Map<String, dynamic>> isSameOrAfterTimeTestData() {
  return [
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 1),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 2),
      'unit': Unit.MICROSECOND,
      'expectedIsSameOrAfter': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 3),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 2),
      'unit': Unit.MICROSECOND,
      'expectedIsSameOrAfter': true
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 2),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 2),
      'unit': Unit.MICROSECOND,
      'expectedIsSameOrAfter': true
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 22, 1),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 22, 2),
      'unit': Unit.MILLISECOND,
      'expectedIsSameOrAfter': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 22, 3),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 22, 2),
      'unit': Unit.MILLISECOND,
      'expectedIsSameOrAfter': true
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 22, 2),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 22, 2),
      'unit': Unit.MILLISECOND,
      'expectedIsSameOrAfter': true
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 1),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 2),
      'unit': Unit.SECOND,
      'expectedIsSameOrAfter': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 3),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 2),
      'unit': Unit.SECOND,
      'expectedIsSameOrAfter': true
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 2),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 2),
      'unit': Unit.SECOND,
      'expectedIsSameOrAfter': true
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 1),
      'secondDateTime': DateTime(1997, 9, 23, 12, 2),
      'unit': Unit.MINUTE,
      'expectedIsSameOrAfter': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 3),
      'secondDateTime': DateTime(1997, 9, 23, 12, 2),
      'unit': Unit.MINUTE,
      'expectedIsSameOrAfter': true
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 2),
      'secondDateTime': DateTime(1997, 9, 23, 12, 2),
      'unit': Unit.MINUTE,
      'expectedIsSameOrAfter': true
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 1),
      'secondDateTime': DateTime(1997, 9, 23, 2),
      'unit': Unit.HOUR,
      'expectedIsSameOrAfter': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 3),
      'secondDateTime': DateTime(1997, 9, 23, 2),
      'unit': Unit.HOUR,
      'expectedIsSameOrAfter': true
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 2),
      'secondDateTime': DateTime(1997, 9, 23, 2),
      'unit': Unit.HOUR,
      'expectedIsSameOrAfter': true
    },
    {
      'firstDateTime': DateTime(1997, 9, 1),
      'secondDateTime': DateTime(1997, 9, 2),
      'unit': Unit.DAY,
      'expectedIsSameOrAfter': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 3),
      'secondDateTime': DateTime(1997, 9, 2),
      'unit': Unit.DAY,
      'expectedIsSameOrAfter': true
    },
    {
      'firstDateTime': DateTime(1997, 9, 2),
      'secondDateTime': DateTime(1997, 9, 2),
      'unit': Unit.DAY,
      'expectedIsSameOrAfter': true
    },
    {
      'firstDateTime': DateTime(2022, 12, 5),
      'secondDateTime': DateTime(2022, 12, 12),
      'unit': Unit.WEEK,
      'expectedIsSameOrAfter': false
    },
    {
      'firstDateTime': DateTime(2022, 12, 5),
      'secondDateTime': DateTime(2022, 12, 5),
      'unit': Unit.WEEK,
      'expectedIsSameOrAfter': true
    },
    {
      'firstDateTime': DateTime(2022, 12, 5),
      'secondDateTime': DateTime(2022, 12, 8),
      'unit': Unit.WEEK,
      'expectedIsSameOrAfter': true
    },
    {
      'firstDateTime': DateTime(2022, 12, 5),
      'secondDateTime': DateTime(2022, 12, 3),
      'unit': Unit.WEEK,
      'expectedIsSameOrAfter': true
    },
    {
      'firstDateTime': DateTime(1997, 1),
      'secondDateTime': DateTime(1997, 2),
      'unit': Unit.MONTH,
      'expectedIsSameOrAfter': false
    },
    {
      'firstDateTime': DateTime(1997, 3),
      'secondDateTime': DateTime(1997, 2),
      'unit': Unit.MONTH,
      'expectedIsSameOrAfter': true
    },
    {
      'firstDateTime': DateTime(1997, 2),
      'secondDateTime': DateTime(1997, 2),
      'unit': Unit.MONTH,
      'expectedIsSameOrAfter': true
    },
    {
      'firstDateTime': DateTime(1996),
      'secondDateTime': DateTime(1997),
      'unit': Unit.YEAR,
      'expectedIsSameOrAfter': false
    },
    {
      'firstDateTime': DateTime(1998),
      'secondDateTime': DateTime(1997),
      'unit': Unit.YEAR,
      'expectedIsSameOrAfter': true
    },
    {
      'firstDateTime': DateTime(1997),
      'secondDateTime': DateTime(1997),
      'unit': Unit.YEAR,
      'expectedIsSameOrAfter': true
    },
  ];
}

List<Map<String, dynamic>> isSameOrAfterDateTimeWithStartOfWeekTestData() {
  return [
    {
      'firstDateTime': DateTime(2022, 12, 5),
      'secondDateTime': DateTime(2022, 12, 12),
      'startOfWeek': StartOfWeek.MONDAY,
      'expectedIsSameOrAfter': false
    },
    {
      'firstDateTime': DateTime(2022, 12, 6),
      'secondDateTime': DateTime(2022, 12, 7),
      'startOfWeek': StartOfWeek.MONDAY,
      'expectedIsSameOrAfter': true
    },
    {
      'firstDateTime': DateTime(2022, 12, 6),
      'secondDateTime': DateTime(2022, 12, 4),
      'startOfWeek': StartOfWeek.MONDAY,
      'expectedIsSameOrAfter': true
    },
    {
      'firstDateTime': DateTime(2022, 12, 6),
      'secondDateTime': DateTime(2022, 12, 5),
      'startOfWeek': StartOfWeek.MONDAY,
      'expectedIsSameOrAfter': true
    },
    {
      'firstDateTime': DateTime(2022, 12, 5),
      'secondDateTime': DateTime(2022, 12, 11),
      'startOfWeek': StartOfWeek.SUNDAY,
      'expectedIsSameOrAfter': false
    },
    {
      'firstDateTime': DateTime(2022, 12, 6),
      'secondDateTime': DateTime(2022, 12, 7),
      'startOfWeek': StartOfWeek.SUNDAY,
      'expectedIsSameOrAfter': true
    },
    {
      'firstDateTime': DateTime(2022, 12, 6),
      'secondDateTime': DateTime(2022, 12, 3),
      'startOfWeek': StartOfWeek.SUNDAY,
      'expectedIsSameOrAfter': true
    },
    {
      'firstDateTime': DateTime(2022, 12, 6),
      'secondDateTime': DateTime(2022, 12, 4),
      'startOfWeek': StartOfWeek.SUNDAY,
      'expectedIsSameOrAfter': true
    },
    {
      'firstDateTime': DateTime(2022, 12, 5),
      'secondDateTime': DateTime(2022, 12, 10),
      'startOfWeek': StartOfWeek.SATURDAY,
      'expectedIsSameOrAfter': false
    },
    {
      'firstDateTime': DateTime(2022, 12, 6),
      'secondDateTime': DateTime(2022, 12, 7),
      'startOfWeek': StartOfWeek.SATURDAY,
      'expectedIsSameOrAfter': true
    },
    {
      'firstDateTime': DateTime(2022, 12, 6),
      'secondDateTime': DateTime(2022, 12, 2),
      'startOfWeek': StartOfWeek.SATURDAY,
      'expectedIsSameOrAfter': true
    },
    {
      'firstDateTime': DateTime(2022, 12, 6),
      'secondDateTime': DateTime(2022, 12, 3),
      'startOfWeek': StartOfWeek.SATURDAY,
      'expectedIsSameOrAfter': true
    },
  ];
}

List<Map<String, dynamic>> isBetweenTimeTestData() {
  return [
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 2),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 1),
      'thirdDateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 3),
      'unit': Unit.MICROSECOND,
      'expectedIsBetween': true
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 0),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 1),
      'thirdDateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 3),
      'unit': Unit.MICROSECOND,
      'expectedIsBetween': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 4),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 1),
      'thirdDateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 3),
      'unit': Unit.MICROSECOND,
      'expectedIsBetween': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 1),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 1),
      'thirdDateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 3),
      'unit': Unit.MICROSECOND,
      'expectedIsBetween': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 3),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 1),
      'thirdDateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 3),
      'unit': Unit.MICROSECOND,
      'expectedIsBetween': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 22, 2),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 22, 1),
      'thirdDateTime': DateTime(1997, 9, 23, 12, 11, 22, 3),
      'unit': Unit.MILLISECOND,
      'expectedIsBetween': true
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 22, 0),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 22, 1),
      'thirdDateTime': DateTime(1997, 9, 23, 12, 11, 22, 3),
      'unit': Unit.MILLISECOND,
      'expectedIsBetween': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 22, 4),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 22, 1),
      'thirdDateTime': DateTime(1997, 9, 23, 12, 11, 22, 3),
      'unit': Unit.MILLISECOND,
      'expectedIsBetween': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 22, 1),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 22, 1),
      'thirdDateTime': DateTime(1997, 9, 23, 12, 11, 22, 3),
      'unit': Unit.MILLISECOND,
      'expectedIsBetween': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 22, 3),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 22, 1),
      'thirdDateTime': DateTime(1997, 9, 23, 12, 11, 22, 3),
      'unit': Unit.MILLISECOND,
      'expectedIsBetween': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 2),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 1),
      'thirdDateTime': DateTime(1997, 9, 23, 12, 11, 3),
      'unit': Unit.SECOND,
      'expectedIsBetween': true
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 0),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 1),
      'thirdDateTime': DateTime(1997, 9, 23, 12, 11, 3),
      'unit': Unit.SECOND,
      'expectedIsBetween': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 4),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 1),
      'thirdDateTime': DateTime(1997, 9, 23, 12, 11, 3),
      'unit': Unit.SECOND,
      'expectedIsBetween': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 1),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 1),
      'thirdDateTime': DateTime(1997, 9, 23, 12, 11, 3),
      'unit': Unit.SECOND,
      'expectedIsBetween': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 22, 3),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 22, 1),
      'thirdDateTime': DateTime(1997, 9, 23, 12, 11, 22, 3),
      'unit': Unit.SECOND,
      'expectedIsBetween': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 2),
      'secondDateTime': DateTime(1997, 9, 23, 12, 1),
      'thirdDateTime': DateTime(1997, 9, 23, 12, 3),
      'unit': Unit.MINUTE,
      'expectedIsBetween': true
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 0),
      'secondDateTime': DateTime(1997, 9, 23, 12, 1),
      'thirdDateTime': DateTime(1997, 9, 23, 12, 3),
      'unit': Unit.MINUTE,
      'expectedIsBetween': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 4),
      'secondDateTime': DateTime(1997, 9, 23, 12, 1),
      'thirdDateTime': DateTime(1997, 9, 23, 12, 3),
      'unit': Unit.MINUTE,
      'expectedIsBetween': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 1),
      'secondDateTime': DateTime(1997, 9, 23, 12, 1),
      'thirdDateTime': DateTime(1997, 9, 23, 12, 3),
      'unit': Unit.MINUTE,
      'expectedIsBetween': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 3),
      'secondDateTime': DateTime(1997, 9, 23, 12, 1),
      'thirdDateTime': DateTime(1997, 9, 23, 12, 3),
      'unit': Unit.MINUTE,
      'expectedIsBetween': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 2),
      'secondDateTime': DateTime(1997, 9, 23, 1),
      'thirdDateTime': DateTime(1997, 9, 23, 3),
      'unit': Unit.HOUR,
      'expectedIsBetween': true
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 0),
      'secondDateTime': DateTime(1997, 9, 23, 1),
      'thirdDateTime': DateTime(1997, 9, 23, 3),
      'unit': Unit.HOUR,
      'expectedIsBetween': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 4),
      'secondDateTime': DateTime(1997, 9, 23, 1),
      'thirdDateTime': DateTime(1997, 9, 23, 3),
      'unit': Unit.HOUR,
      'expectedIsBetween': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 1),
      'secondDateTime': DateTime(1997, 9, 23, 1),
      'thirdDateTime': DateTime(1997, 9, 23, 3),
      'unit': Unit.HOUR,
      'expectedIsBetween': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 3),
      'secondDateTime': DateTime(1997, 9, 23, 1),
      'thirdDateTime': DateTime(1997, 9, 23, 3),
      'unit': Unit.HOUR,
      'expectedIsBetween': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 2),
      'secondDateTime': DateTime(1997, 9, 1),
      'thirdDateTime': DateTime(1997, 9, 3),
      'unit': Unit.DAY,
      'expectedIsBetween': true
    },
    {
      'firstDateTime': DateTime(1997, 9, 0),
      'secondDateTime': DateTime(1997, 9, 1),
      'thirdDateTime': DateTime(1997, 9, 3),
      'unit': Unit.DAY,
      'expectedIsBetween': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 4),
      'secondDateTime': DateTime(1997, 9, 1),
      'thirdDateTime': DateTime(1997, 9, 3),
      'unit': Unit.DAY,
      'expectedIsBetween': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 1),
      'secondDateTime': DateTime(1997, 9, 1),
      'thirdDateTime': DateTime(1997, 9, 3),
      'unit': Unit.DAY,
      'expectedIsBetween': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 3),
      'secondDateTime': DateTime(1997, 9, 1),
      'thirdDateTime': DateTime(1997, 9, 3),
      'unit': Unit.DAY,
      'expectedIsBetween': false
    },
    {
      'firstDateTime': DateTime(1997, 2),
      'secondDateTime': DateTime(1997, 1),
      'thirdDateTime': DateTime(1997, 3),
      'unit': Unit.MONTH,
      'expectedIsBetween': true
    },
    {
      'firstDateTime': DateTime(1997, 1),
      'secondDateTime': DateTime(1997, 2),
      'thirdDateTime': DateTime(1997, 4),
      'unit': Unit.MONTH,
      'expectedIsBetween': false
    },
    {
      'firstDateTime': DateTime(1997, 4),
      'secondDateTime': DateTime(1997, 1),
      'thirdDateTime': DateTime(1997, 3),
      'unit': Unit.MONTH,
      'expectedIsBetween': false
    },
    {
      'firstDateTime': DateTime(1997, 1),
      'secondDateTime': DateTime(1997, 1),
      'thirdDateTime': DateTime(1997, 3),
      'unit': Unit.MONTH,
      'expectedIsBetween': false
    },
    {
      'firstDateTime': DateTime(1997, 3),
      'secondDateTime': DateTime(1997, 1),
      'thirdDateTime': DateTime(1997, 3),
      'unit': Unit.MONTH,
      'expectedIsBetween': false
    },
    {
      'firstDateTime': DateTime(1992),
      'secondDateTime': DateTime(1991),
      'thirdDateTime': DateTime(1993),
      'unit': Unit.YEAR,
      'expectedIsBetween': true
    },
    {
      'firstDateTime': DateTime(1991),
      'secondDateTime': DateTime(1992),
      'thirdDateTime': DateTime(1994),
      'unit': Unit.YEAR,
      'expectedIsBetween': false
    },
    {
      'firstDateTime': DateTime(1994),
      'secondDateTime': DateTime(1991),
      'thirdDateTime': DateTime(1993),
      'unit': Unit.YEAR,
      'expectedIsBetween': false
    },
    {
      'firstDateTime': DateTime(1991),
      'secondDateTime': DateTime(1991),
      'thirdDateTime': DateTime(1993),
      'unit': Unit.YEAR,
      'expectedIsBetween': false
    },
    {
      'firstDateTime': DateTime(1993),
      'secondDateTime': DateTime(1991),
      'thirdDateTime': DateTime(1993),
      'unit': Unit.YEAR,
      'expectedIsBetween': false
    },
  ];
}

List<Map<String, dynamic>> isBetweenDateTimeWithStartOfWeekTestData() {
  return [
    {
      'firstDateTime': DateTime(2022, 12, 14),
      'secondDateTime': DateTime(2022, 12, 5),
      'thirdDateTime': DateTime(2022, 12, 19),
      'startOfWeek': StartOfWeek.MONDAY,
      'expectedIsBetween': true
    },
    {
      'firstDateTime': DateTime(2022, 12, 8),
      'secondDateTime': DateTime(2022, 12, 12),
      'thirdDateTime': DateTime(2022, 12, 19),
      'startOfWeek': StartOfWeek.MONDAY,
      'expectedIsBetween': false
    },
    {
      'firstDateTime': DateTime(2022, 12, 20),
      'secondDateTime': DateTime(2022, 12, 5),
      'thirdDateTime': DateTime(2022, 12, 12),
      'startOfWeek': StartOfWeek.MONDAY,
      'expectedIsBetween': false
    },
    {
      'firstDateTime': DateTime(2022, 12, 7),
      'secondDateTime': DateTime(2022, 12, 5),
      'thirdDateTime': DateTime(2022, 12, 12),
      'startOfWeek': StartOfWeek.MONDAY,
      'expectedIsBetween': false
    },
    {
      'firstDateTime': DateTime(2022, 12, 15),
      'secondDateTime': DateTime(2022, 12, 5),
      'thirdDateTime': DateTime(2022, 12, 12),
      'startOfWeek': StartOfWeek.MONDAY,
      'expectedIsBetween': false
    },
    {
      'firstDateTime': DateTime(2022, 12, 14),
      'secondDateTime': DateTime(2022, 12, 4),
      'thirdDateTime': DateTime(2022, 12, 18),
      'startOfWeek': StartOfWeek.SUNDAY,
      'expectedIsBetween': true
    },
    {
      'firstDateTime': DateTime(2022, 12, 8),
      'secondDateTime': DateTime(2022, 12, 11),
      'thirdDateTime': DateTime(2022, 12, 18),
      'startOfWeek': StartOfWeek.SUNDAY,
      'expectedIsBetween': false
    },
    {
      'firstDateTime': DateTime(2022, 12, 20),
      'secondDateTime': DateTime(2022, 12, 4),
      'thirdDateTime': DateTime(2022, 12, 11),
      'startOfWeek': StartOfWeek.SUNDAY,
      'expectedIsBetween': false
    },
    {
      'firstDateTime': DateTime(2022, 12, 7),
      'secondDateTime': DateTime(2022, 12, 4),
      'thirdDateTime': DateTime(2022, 12, 11),
      'startOfWeek': StartOfWeek.SUNDAY,
      'expectedIsBetween': false
    },
    {
      'firstDateTime': DateTime(2022, 12, 15),
      'secondDateTime': DateTime(2022, 12, 4),
      'thirdDateTime': DateTime(2022, 12, 11),
      'startOfWeek': StartOfWeek.SUNDAY,
      'expectedIsBetween': false
    },
    {
      'firstDateTime': DateTime(2022, 12, 14),
      'secondDateTime': DateTime(2022, 12, 3),
      'thirdDateTime': DateTime(2022, 12, 17),
      'startOfWeek': StartOfWeek.SATURDAY,
      'expectedIsBetween': true
    },
    {
      'firstDateTime': DateTime(2022, 12, 8),
      'secondDateTime': DateTime(2022, 12, 10),
      'thirdDateTime': DateTime(2022, 12, 17),
      'startOfWeek': StartOfWeek.SATURDAY,
      'expectedIsBetween': false
    },
    {
      'firstDateTime': DateTime(2022, 12, 20),
      'secondDateTime': DateTime(2022, 12, 3),
      'thirdDateTime': DateTime(2022, 12, 10),
      'startOfWeek': StartOfWeek.SATURDAY,
      'expectedIsBetween': false
    },
    {
      'firstDateTime': DateTime(2022, 12, 7),
      'secondDateTime': DateTime(2022, 12, 3),
      'thirdDateTime': DateTime(2022, 12, 10),
      'startOfWeek': StartOfWeek.SATURDAY,
      'expectedIsBetween': false
    },
    {
      'firstDateTime': DateTime(2022, 12, 15),
      'secondDateTime': DateTime(2022, 12, 3),
      'thirdDateTime': DateTime(2022, 12, 10),
      'startOfWeek': StartOfWeek.SATURDAY,
      'expectedIsBetween': false
    },
  ];
}

List<Map<String, dynamic>> isUtcDateTimeTestData() {
  return [
    {'dateTime': DateTime.now(), 'expectedIsUtc': false},
    {'dateTime': DateTime.now().toUtc(), 'expectedIsUtc': true},
  ];
}

List<Map<String, dynamic>> isLeapYearTestData() {
  return [
    {'year': 1997, 'expectedIsLeapYear': false},
    {'year': 2022, 'expectedIsLeapYear': false},
    {'year': 2020, 'expectedIsLeapYear': true},
    {'year': 2018, 'expectedIsLeapYear': false},
    {'year': 2016, 'expectedIsLeapYear': true},
  ];
}
