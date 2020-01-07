import 'package:jiffy/src/relative_time/lookup_messages.dart';

class PlLocale extends LookUpMessages {
  String prefixAgo() => '';
  String prefixFromNow() => 'w';
  String suffixAgo() => 'temu';
  String suffixFromNow() => '';
  String lessThanOneMinute(int seconds) => 'chwilę temu';
  String aboutAMinute(int minutes) => 'minutę temu';
  String minutes(int minutes) => '$minutes min';
  String aboutAnHour(int minutes) => 'godzinę temu';
  String hours(int hours) => '$hours h';
  String aDay(int hours) => 'dzień temu';
  String days(int days) => '$days dni';
  String aboutAMonth(int days) => 'miesiąc temu';
  String months(int months) => '$months msc';
  String aboutAYear(int year) => 'rok temu';
  String years(int years) => '$years lat';
  String wordSeparator() => ' ';
}
