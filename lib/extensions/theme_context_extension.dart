import 'package:exact_pro/theme/app_theme.dart';
import 'package:exact_pro/theme/theme.dart';
import 'package:exact_pro/x_pro.dart';

extension ThemeContextExtension on BuildContext {
  AppThemeData get theme => AppTheme.of(this);
  ThemeColors get colors => AppTheme.of(this).colors;
  ThemeData get material => AppTheme.of(this).material;
  bool get isSystemDarkMode {
    final brightness = MediaQuery.of(this).platformBrightness;
    return brightness == Brightness.dark;
  }
}
