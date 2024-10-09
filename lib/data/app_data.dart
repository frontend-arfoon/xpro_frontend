import 'package:exact_pro/x_pro.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppData {
  final Map<String, String> Function() imageHttpHeaders;
  final AppThemeData theme;
  final ThemeMode? initialMode;

  AppData(
      {required this.imageHttpHeaders, required this.theme, this.initialMode});

  static AppData of(BuildContext context) =>
      RepositoryProvider.of<AppData>(context);

  AppData copyWith({
    Map<String, String> Function()? imageHttpHeaders,
    AppThemeData? theme,
    ThemeMode? initialMode,
  }) {
    return AppData(
      imageHttpHeaders: imageHttpHeaders ?? this.imageHttpHeaders,
      theme: theme ?? this.theme,
      initialMode: initialMode ?? this.initialMode,
    );
  }
}
