import 'package:exact_pro/extensions/theme_context_extension.dart';
import 'package:exact_pro/x_pro.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  static ThemeCubit of(BuildContext context) =>
      BlocProvider.of<ThemeCubit>(context);
  ThemeCubit({ThemeMode? initialMode}) : super(initialMode ?? ThemeMode.system);

  void toggle() {
    switch (state) {
      case ThemeMode.system:
        emit(ThemeMode.light);
      case ThemeMode.light:
        emit(ThemeMode.dark);
      case ThemeMode.dark:
        emit(ThemeMode.system);
    }
  }

  static bool isDarkMode(BuildContext context) {
    var mode = of(context).state;
    if (mode == ThemeMode.system) {
      return context.isSystemDarkMode;
    }
    return mode == ThemeMode.dark;
  }

  void changeTo(ThemeMode themeMode) {
    emit(themeMode);
  }
}
