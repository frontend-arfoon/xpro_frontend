import 'package:exact_pro/utils/utils.dart';
import 'package:exact_pro/x_pro.dart';
import 'package:flutter_utils/flutter_utils.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = AppThemeData(
      fontFamily: 'SegoeUi',
      lightColors: lightColors,
      darkColors: darkColors,
    );
    //

    return AppDataProvider(
      appData: AppData(
        imageHttpHeaders: () => {},
        theme: theme,
        defaultImage: SvgIcons.circleAdd,
        closeIcon: SvgIcons.arrow,
      ),
      builder: (mode) {
        return LocaleBuilder(
          builder: (locale) {
            return MaterialApp(
              title: "XPro App",
              debugShowCheckedModeBanner: false,
              localizationsDelegates: Locales.delegates,
              supportedLocales: Locales.supportedLocales,
              locale: locale,
              theme: theme.light,
              darkTheme: theme.dark,
              themeMode: mode,
              home: const LoginPage(),
            );
          },
        );
      },
    );
  }
}
