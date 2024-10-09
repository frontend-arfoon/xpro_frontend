// import 'dart:developer';
// import 'package:age_calculator/age_calculator.dart';
// import 'package:health/health.dart';

// class AgeData {
//   int? years;
//   int? months;
//   int? days;
//   AgeData({
//     this.years,
//     this.months,
//     this.days,
//   });
// }

// class FormUtils {
//   static AgeData getAge(DateTime date) {
//     DateDuration myAge;
//     myAge = AgeCalculator.age(date);
//     log('Your age is $myAge');

//     AgeData age = AgeData(
//       days: myAge.days,
//       months: myAge.months,
//       years: myAge.years,
//     );

//     return age;
//   }

//   /// add method
//   static DateTime ageSubtract(
//       {required DateTime date, required DateDuration duration}) {
//     int years = date.year + duration.years;
//     years += ((date.month + duration.months) ~/ DateTime.monthsPerYear);
//     int months = ((date.month + duration.months) % DateTime.monthsPerYear);

//     int days = date.day + duration.days - 1;

//     return DateTime(years, months, 1).subtract(Duration(days: days));
//   }

//   static DateTime getDateOfBirth({
//     int? ageYear,
//     int? ageMonths,
//     int? ageDays,
//   }) {
//     var now = DateTime.now();

//     // Years
//     if ((ageYear != null && ageYear != 0) &&
//         ageDays == null &&
//         ageMonths == null) {
//       return DateTime.now().copyWith(year: now.year - ageYear);
//     }

//     // Years Month
//     if (ageYear != null && ageDays == null && ageMonths != null) {
//       return DateTime.now()
//           .copyWith(year: now.year - ageYear, month: now.month - ageMonths);
//     }
//     // Years Days
//     if (ageYear != null && ageDays != null && ageMonths == null) {
//       return DateTime.now()
//           .copyWith(year: now.year - ageYear, day: now.day - ageDays);
//     }

//     // MOnths
//     if (ageYear == null && ageDays == null && ageMonths != null) {
//       return DateTime.now().copyWith(month: now.month - ageMonths);
//     }

//     // MOnths year
//     if (ageYear != null && ageDays == null && ageMonths != null) {
//       return DateTime.now()
//           .copyWith(month: now.month - ageMonths, year: now.year - ageYear);
//     }

//     // MOnths day
//     if (ageYear == null && ageDays != null && ageMonths != null) {
//       return DateTime.now()
//           .copyWith(month: now.month - ageMonths, day: now.day - ageDays);
//     }

//     // day
//     if (ageYear == null && ageDays != null && ageMonths == null) {
//       return DateTime.now().copyWith(day: now.day - ageDays);
//     }

//     // day month year
//     if (ageYear != null && ageDays != null && ageMonths != null) {
//       return DateTime.now().copyWith(
//         day: now.day - ageDays,
//         year: now.year - ageYear,
//         month: now.month - ageMonths,
//       );
//     }

//     return DateTime.now();

//     // var days = ((ageYear ?? 0) * 366);
//     // log('getDateOfBirth: year: $days');

//     // days += (ageMonths ?? 1) * 30;
//     // log('getDateOfBirth: months: $days');

//     // days += (ageDays ?? 1);
//     // log('getDateOfBirth: days: $days');
//   }
// }
