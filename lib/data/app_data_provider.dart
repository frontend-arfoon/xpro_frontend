import 'package:exact_pro/data/app_data.dart';
import 'package:exact_pro/x_pro.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppDataProvider extends StatelessWidget {
  const AppDataProvider(
      {super.key, required this.appData, required this.builder});

  final AppData appData;
  final Widget Function(ThemeMode mode) builder;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(
          create: (_) => ThemeCubit(
            initialMode: appData.initialMode,
          ),
        ),
      ],
      child: RepositoryProvider(
        create: (context) => appData,
        child: AppTheme(
          data: appData.theme,
          child: BlocBuilder<ThemeCubit, ThemeMode>(
            builder: (context, mode) {
              return builder(mode);
            },
          ),
        ),
      ),
    );
  }
}
