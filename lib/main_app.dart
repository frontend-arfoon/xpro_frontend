import 'package:exact_pro/x_pro.dart';

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
