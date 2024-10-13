import 'package:exact_pro/utils/utils.dart';
import 'package:exact_pro/x_pro.dart';
import 'package:flutter_utils/flutter_utils.dart';

// ignore: depend_on_referenced_packages
import 'package:provider/single_child_widget.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildApp(home: const TestAllScreen(), blocs: [], repositories: []);
  }

  Widget _buildApp({
    List<SingleChildWidget>? blocs,
    List<SingleChildWidget>? repositories,
    required Widget home,
  }) {
    var theme = AppThemeData(
      fontFamily: 'SegoeUi',
      lightColors: lightColors,
      darkColors: darkColors,
    );

    Widget child = AppDataProvider(
      appData: AppData(
        theme: theme,
        closeIcon: SvgIcons.close,
        defaultImage: SvgIcons.defaultImage,
        imageHttpHeaders: () => {},
      ),
      builder: (mode) {
        return LocaleBuilder(
          builder: (locale) {
            return MaterialApp(
              title: "Exact Pro App",
              debugShowCheckedModeBanner: false,
              localizationsDelegates: Locales.delegates,
              supportedLocales: Locales.supportedLocales,
              locale: locale,
              theme: theme.light,
              darkTheme: theme.dark,
              themeMode: mode,
              home: home,
            );
          },
        );
      },
    );

    if (blocs != null && blocs.isNotEmpty) {
      child = MultiBlocProvider(providers: blocs, child: child);
    }

    if (repositories != null && repositories.isNotEmpty) {
      child = MultiRepositoryProvider(providers: repositories, child: child);
    }

    return child;
  }
}
