import 'package:jiffy/jiffy.dart';
import 'package:jiffy/src/enums/units.dart';

main() async {
//  FORMATTING DATES
  Jiffy([2019, 10, 19]).format('MMMM do yyyy, h:mm:ss a'); // October 19th 2019, 7:00:53 PM
  Jiffy().format('EEEE'); // Saturday
  Jiffy().format('MMM do yy'); // Oct 19th 19
  Jiffy().format('yyyy "escaped" yyyy'); // 2019 escaped 2019

//  await Jiffy.locale("es");
  print(Jiffy().format('yyyy \'escaped\' yyyy'));
  print(Jiffy().format("yyyy \'escaped\' yyyy"));
  print(Jiffy().format("yyyy 'escaped' yyyy"));
  print(Jiffy().format('yyyy "escaped" yyyy'));
  print(Jiffy().format('yyyy [escaped] yyyy'));

//  Not passing a string pattern for format method will return an ISO Date format
  Jiffy().format(); // 2019-10-19T19:00:53.090646

//  You can also use default formats
  Jiffy([2019, 10, 19]).yMMMMd; // October 19, 2019
  Jiffy({
    'year': 2019,
    'month': 10,
    'day': 19,
    'hour': 19
  }).yMMMMEEEEdjm; // Saturday, October 19, 2019 7:00 PM

//  RELATIVE TIME
  Jiffy('2011-10-31').fromNow(); // 8 years ago
  Jiffy(DateTime(2012, 6, 20)).fromNow(); // 7 years ago

  var jiffy1 = Jiffy()
    ..startOf(Units.DAY);
  jiffy1.fromNow(); // 19 hours ago

  var jiffy2 = Jiffy()
    ..endOf(Units.DAY);
  jiffy2.fromNow(); // in 5 hours

  var jiffy3 = Jiffy()
    ..startOf(Units.HOUR);
  jiffy3.fromNow(); // 9 minutes ago

//  MANIPULATING DATES
  var jiffy4 = Jiffy()
    ..add(duration: Duration(days: 1));
  jiffy4.yMMMMd; // October 20, 2019

  var jiffy5 = Jiffy()
    ..subtract(days: 1);
  jiffy5.yMMMMd; // October 18, 2019

//  You can chain methods by using Dart method cascading
  var jiffy6 = Jiffy()
    ..add(hours: 3, days: 1)
    ..subtract(minutes: 30, months: 1);
  jiffy6.yMMMMEEEEdjm; // Friday, September 20, 2019 9:50 PM

//  LOCALES
//  The locale method always return a future
//  To get locale (The default locale is English)
  await Jiffy.locale(); // en
//  To set locale
  await Jiffy.locale('fr');
  Jiffy().yMMMMEEEEdjm; // samedi 19 octobre 2019 19:25
  await Jiffy.locale('ar');
  Jiffy().yMMMMEEEEdjm; // السبت، ١٩ أكتوبر ٢٠١٩ ٧:٢٧ م
  await Jiffy.locale('zh-cn');
  Jiffy().yMMMMEEEEdjm; // 2019年10月19日星期六 下午7:28

  return 0;
}
