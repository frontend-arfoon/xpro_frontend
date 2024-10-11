import 'package:exact_pro/x_pro.dart';
import 'package:flutter_utils/flutter_utils.dart';

ThemeColors lightColors = const ThemeColors(
  primary: AppColors.purple,
  primaryDark: AppColors.purpleVariant,
  primaryLight: AppColors.purpleLight,
  secondary: AppColors.teal,
  secondaryDark: AppColors.tealVariant,
  secondaryLight: AppColors.tealLight,
  background: AppColors.white,
  surface: AppColors.whiteSmoke,
  text: AppColors.black,
  disabled: AppColors.grey,
  disabledLight: AppColors.greyLight,
  divider: AppColors.grey,
  positive: AppColors.green,
  negative: AppColors.red,
  error: AppColors.redDark,
  ok: AppColors.blue,
  warning: AppColors.orange,
  primarySwatch: Colors.purple,
);

ThemeColors darkColors = const ThemeColors(
  primary: AppColors.purpleWhite,
  primaryDark: AppColors.darkPurpleVariant,
  primaryLight: AppColors.darkPurpleLight,
  secondary: AppColors.darkTeal,
  secondaryDark: AppColors.darkTealVariant,
  secondaryLight: AppColors.darkTealLight,
  background: AppColors.darkBlack,
  surface: AppColors.darkSmoke,
  text: AppColors.whiteLight,
  disabled: AppColors.darkGrey,
  disabledLight: AppColors.darkGreyLight,
  divider: AppColors.darkGrey,
  positive: AppColors.greenLight,
  negative: AppColors.lightRed,
  error: AppColors.pinkRose,
  ok: AppColors.lavenderBlue,
  warning: AppColors.peach,
  primarySwatch: Colors.purple,
);

ThemeColors themeColors({bool dark = false}) {
  if (dark) return darkColors;
  return lightColors;
}

class AppColors {
  static const Color purple = Color(0xFF004A5C);
  static const Color purpleWhite = Color(0xFF1F798F);

  static const Color purpleVariant = Color(0xFF003745);
  static const Color darkPurpleVariant = Color(0xFF3E95AB);

  static const Color purpleLight = Color(0xFF7DCEE3);
  static const Color darkPurpleLight = Color(0xFF00252E);

  static const Color teal = Color(0xffB29361);
  static const Color darkTeal = Color(0xffF0CD95);

  static const Color tealVariant = Color(0xff6E5938);
  static const Color darkTealVariant = Color(0xffB29361);

  static const Color tealLight = Color(0xffF7F4EF);
  static const Color darkTealLight = Color(0xff1B1813);

  static const Color white = Color(0xffFFFFFF);
  static const Color darkBlack = Color(0xff000001);

  static const Color whiteSmoke = Color(0xffFAFAFA);
  static const Color darkSmoke = Color(0xff1E2023);

  static const Color black = Color(0xff1C1C1C);
  static const Color whiteLight = Color(0xffFFFFFF);

  static const Color grey = Color(0xff7C7C7C);
  static const Color darkGrey = Color(0xffABABAB);

  static const Color greyLight = Color(0xffE2E2E2);
  static const Color darkGreyLight = Color(0xff818181);

  static const Color red = Color(0xffFF3838);
  static const Color lightRed = Color(0xffFF9090);

  static const Color redDark = Color(0xff711818);
  static const Color pinkRose = Color(0xffECA6A6);

  static const Color green = Color(0xff03C04A);
  static const Color greenLight = Color(0xff8DFFB8);

  static const Color blue = Color(0xff4650E4);
  static const Color lavenderBlue = Color(0xff9096EF);

  static const Color orange = Color(0xffFF7417);
  static const Color peach = Color(0xffFFAD76);

  static AppColor appPrimaryColor = AppColor(
    id: 1,
    light: AppColors.purple.value,
    dark: AppColors.purpleLight.value,
    name: 'primary',
  );
  static AppColor appSecondaryColor = AppColor(
    id: 2,
    light: AppColors.teal.value,
    dark: AppColors.darkTeal.value,
    name: 'secondary',
  );
  static AppColor appErrorColor = AppColor(
    id: 3,
    light: AppColors.redDark.value,
    dark: AppColors.pinkRose.value,
    name: 'Error',
  );

  static const AppColor indigo = AppColor(
    id: 4,
    dark: 0xff26316D,
    light: 0xffB2B9E1,
    name: 'indigo',
  );

  static const AppColor ebony = AppColor(
    id: 5,
    dark: 0xffBDC1BB,
    light: 0xff333830,
    name: 'ebony',
  );

  static const AppColor gray = AppColor(
    id: 6,
    dark: 0xffC5C5C5,
    light: 0xff636363,
    name: 'gray',
  );

  static const AppColor slate = AppColor(
    id: 7,
    dark: 0xffC6CCD3,
    light: 0xff434D56,
    name: 'slate',
  );

  static const AppColor sage = AppColor(
    dark: 0xffD7D4B9,
    light: 0xff787657,
    name: 'sage',
    id: 8,
  );

  static const AppColor amber = AppColor(
    id: 9,
    dark: 0xffFFDA6A,
    light: 0xff997404,
    name: 'amber',
  );

  static const AppColor olive = AppColor(
    id: 10,
    dark: 0xffF2F298,
    light: 0xff4D4D00,
    name: 'olive',
  );

  static const AppColor lime = AppColor(
    id: 11,
    dark: 0xffE1EA88,
    light: 0xff7B8422,
    name: 'amber',
  );

  static const AppColor cyan = AppColor(
    id: 12,
    dark: 0xff65D7E5,
    light: 0xff00717F,
    name: 'cyan',
  );

  static const AppColor mint = AppColor(
    id: 13,
    dark: 0xff8BD2B8,
    light: 0xff256C52,
    name: 'mint',
  );

  static const AppColor teal2 = AppColor(
    id: 14,
    dark: 0xff4CC0B5,
    light: 0xff005A52,
    name: 'teal2',
  );

  static const AppColor scarlet = AppColor(
    id: 15,
    dark: 0xffFFBDB3,
    light: 0xff991600,
    name: 'scarlet',
  );

  static const AppColor pink = AppColor(
    id: 16,
    dark: 0xffF6A5C1,
    light: 0xff8C123B,
    name: 'pink',
  );

  static const AppColor crimson = AppColor(
    id: 17,
    dark: 0xffEA728A,
    light: 0xff840C24,
    name: 'crimson',
  );

  static const AppColor lilac = AppColor(
    id: 18,
    dark: 0xffDEC7DE,
    light: 0xff896B89,
    name: 'lilac',
  );

  static const AppColor orchid = AppColor(
    id: 19,
    dark: 0xffE9A9E6,
    light: 0xff8E468B,
    name: 'orchid',
  );

  static const AppColor rusted = AppColor(
    id: 20,
    dark: 0xffD38868,
    light: 0xff6E2708,
    name: 'rusted',
  );

  static const AppColor garnet = AppColor(
    id: 21,
    dark: 0xffE4CFCE,
    light: 0xff5C2B2A,
    name: 'garnet',
  );

  static const AppColor coral = AppColor(
    id: 22,
    dark: 0xffFFB296,
    light: 0xffA95130,
    name: 'coral',
  );

  static const AppColor brown = AppColor(
    id: 23,
    dark: 0xffEAE3E1,
    light: 0xff49332B,
    name: 'brown',
  );

  static const AppColor blue2 = AppColor(
    id: 24,
    dark: 0xffA6D5FA,
    light: 0xff4DABF5,
    name: 'blue2',
  );

  static AppColor tealLightesh = const AppColor(
    id: 25,
    dark: 0xff80D2FF,
    light: 0x470076B6,
    name: 'tealLightesh',
  );

  static List<AppColor> colors = [
    appPrimaryColor,
    appSecondaryColor,
    appErrorColor,
    indigo,
    ebony,
    gray,
    slate,
    sage,
    amber,
    olive,
    lime,
    cyan,
    mint,
    teal2,
    scarlet,
    pink,
    crimson,
    lilac,
    orchid,
    rusted,
    coral,
    blue2,
  ];

  // static Color ofId(int? id, {BuildContext? context}) {
  //   bool isDark = context?.theme.isDarkMode ?? false;
  //   int i = id ?? 0;
  //   if (i > 101) {
  //     i = i.last2CharWhenMorethen100 ?? 1;
  //   }

  //   try {
  //     while (i > (colors.length + 1)) {
  //       i = (i / 2).abs() as int;
  //     }
  //     return (i <= -1 ? colors.first : colors[i + 1]).copyWith(isDark: isDark);
  //   } catch (e) {
  //     return themeColors(dark: isDark).text;
  //   }
  // }

  // static Color ofCurrency(int currencyId, {BuildContext? context}) {
  //   var colors = themeColors();

  //   switch (currencyId) {
  //     case 1:
  //       return colors.primary;
  //     case 2:
  //       return colors.secondary!;
  //     case 3:
  //       return colors.error;
  //     case 4:
  //       return colors.positive;
  //     case 5:
  //       return colors.ok;
  //   }

  //   return ofId(currencyId, context: context);
  // }

  // static Color accountColor(AccountRecord record) {
  //   if (record.userType != null) {
  //     return userType(record.userType!.id);
  //   } else {
  //     return accountType(record.accountType.id);
  //   }
  // }

  // static userType(int userType) {
  //   var colors = themeColors();

  //   if (userType == UserTypes.admin.id) {
  //     return colors.primaryDark;
  //   } else if (userType == UserTypes.doctor.id) {
  //     return colors.secondaryDark;
  //   } else if (userType == UserTypes.laboratorian.id) {
  //     return colors.error;
  //   } else if (userType == UserTypes.pharmacist.id) {
  //     return AppColors.mint;
  //   }
  // }

  // static accountType(int accountTypeId) {
  //   var colors = themeColors();
  //   var lime = AppColors.lime;

  //   if (accountTypeId == AccountTypes.company.id) {
  //     return colors.ok;
  //   } else if (accountTypeId == AccountTypes.customer.id) {
  //     return lime;
  //   } else if (accountTypeId == AccountTypes.expense.id) {
  //     return colors.disabled;
  //   } else if (accountTypeId == AccountTypes.patient.id) {
  //     return colors.positive;
  //   } else if (accountTypeId == AccountTypes.system.id) {
  //     return colors.primary;
  //   } else if (accountTypeId == AccountTypes.user.id) {
  //     return colors.warning;
  //   }
  //   return colors.primary;
  // }

  // static accountTypeWithOpacity(int accountTypeId) {
  //   var colors = themeColors();
  //   var lime = AppColors.lime;

  //   if (accountTypeId == AccountTypes.company.id) {
  //     return colors.ok.withOpacity(.1);
  //   } else if (accountTypeId == AccountTypes.customer.id) {
  //     return lime.withOpacity(.1);
  //   } else if (accountTypeId == AccountTypes.expense.id) {
  //     return colors.disabled.withOpacity(.1);
  //   } else if (accountTypeId == AccountTypes.patient.id) {
  //     return colors.positive.withOpacity(.1);
  //   } else if (accountTypeId == AccountTypes.system.id) {
  //     return colors.primary.withOpacity(.1);
  //   } else if (accountTypeId == AccountTypes.user.id) {
  //     return colors.warning.withOpacity(.1);
  //   }
  //   return colors.primary.withOpacity(.1);
  // }

  static ofColorId(int id) {
    var color = AppColors.colors.where((element) => element.id == id);
    return color.firstOrNull;
  }

  // static optionDataColor(int id, BuildContext context) {
  //   var color = themeColors();
  //   switch (id) {
  //     case 1:
  //       return color.primary;
  //     case 2:
  //       return color.secondary;
  //     case 3:
  //       return color.warning;
  //     case 4:
  //       return color.error;
  //     case 5:
  //       return color.ok;
  //   }
  //   return ofId(id, context: context);
  // }
}
