import 'package:jiffy/jiffy.dart';

Future<int> main() async {
//  DISPLAY
  Jiffy([2021, 1, 19])
      .format('MMM do yyyy, h:mm:ss a'); // January 1st 2021, 12:00:00 AM
  Jiffy().format('EEEE'); // Tuesday
  Jiffy().format('MMM do yy'); // Mar 2nd 21
  Jiffy().format('yyyy [escaped] yyyy'); // 2021 escaped 2021
  Jiffy().format(); // 2021-03-02T15:18:29.922343

// Not passing a string pattern for format method will return an ISO Date format
  Jiffy().format(); // 2021-03-02T15:18:29.922343

// Using lists
  Jiffy([2019, 10, 19]).yMMMMd; // January 19, 2021

// Using maps
  Jiffy({'year': 2019, 'month': 10, 'day': 19, 'hour': 19}).yMMMMEEEEdjm; // Monday, October 19, 2020 7:14 PM

  // 'From Now' implementation
  Jiffy('2007-1-29').fromNow(); // 14 years ago
  Jiffy([2022, 10, 29]).fromNow(); // in a year
  Jiffy(DateTime(2050, 10, 29)).fromNow(); // in 30 years
  
  // 'From Now' with maxRelativeTimeUnit
  Jiffy('2030-12-31').fromNow(maxRelativeTimeUnit: Units.MONTH); // 108 months
  Jiffy('2021-12-31').fromNow(maxRelativeTimeUnit: Units.MINUTE); // 59794 minutes ago
  Jiffy('2021-12-31').fromNow(maxRelativeTimeUnit: Units.HOUR); // 997 hours ago
  Jiffy('2021-12-31').fromNow(maxRelativeTimeUnit: Units.DAY); // 42 days ago
  Jiffy('2020-12-31').fromNow(maxRelativeTimeUnit: Units.MONTH); // 14 months ago
  Jiffy('2000-12-31').fromNow(maxRelativeTimeUnit: Units.MONTH); // 257 months ago
  Jiffy('2000-12-31').fromNow(maxRelativeTimeUnit: Units.YEAR); // 21 years ago

  Jiffy().startOf(Units.HOUR).fromNow(); // 9 minutes ago

//  'From X' implementation
  var jiffy2 = Jiffy('2007-1-28');
  var jiffy3 = Jiffy('2017-1-29', 'yyyy-MM-dd');

  jiffy2.from(jiffy3); // a day ago

  jiffy2.from([2017, 1, 30]); // 2 days ago
  jiffy2.from([2017, 1, 30], maxRelativeTimeUnit: Units.MONTH); // 122 months ago

//  Displaying the 'Difference' between two date times
//  By default, 'diff' method, get the difference in milliseconds
  var jiffy4 = Jiffy('2007-1-28', 'yyyy-MM-dd');
  var jiffy5 = Jiffy('2017-1-29', 'yyyy-MM-dd');
  jiffy4.diff(jiffy5); // 86400000

  // You can also get 'diff' in different units of time
  Jiffy([2007, 1, 28]).diff([2017, 1, 29], Units.DAY); // -3654

//  RELATIVE TIME
  Jiffy('2011-10-31').fromNow(); // 8 years ago
  Jiffy(DateTime(2012, 6, 20)).fromNow(); // 7 years ago

  Jiffy().startOf(Units.DAY).fromNow(); // 19 hours ago

  Jiffy().endOf(Units.DAY).fromNow(); // in 5 hours

  Jiffy().startOf(Units.HOUR).fromNow(); // 9 minutes ago

//  MANIPULATING DATES
  Jiffy().add(duration: Duration(days: 1)).yMMMMd; // October 20, 2019

  Jiffy().subtract(days: 1).yMMMMd; // October 18, 2019

// LOCALES
// The locale method always return a future
// To get locale (The default locale is English)
  await Jiffy.locale(); // en
//  To set locale
  await Jiffy.locale('fr');
  Jiffy().yMMMMEEEEdjm; // samedi 19 octobre 2019 19:25
  await Jiffy.locale('ar');
  Jiffy().yMMMMEEEEdjm; // السبت، ١٩ أكتوبر ٢٠١٩ ٧:٢٧ م
  await Jiffy.locale('zh_cn');
  Jiffy().yMMMMEEEEdjm; // 2019年10月19日星期六 下午7:28

  return 0;
}
