
// extension HealthContextExt on BuildContext {
//   PreferenceRepository get preference =>
//       RepositoryProvider.of<PreferenceRepository>(this);

//   SecureRepository get secure => RepositoryProvider.of<SecureRepository>(this);

//   ConfigsCubit get configsCubit => BlocProvider.of<ConfigsCubit>(this);
//   ConfigsState get configs => configsCubit.state;

//   AuthCubit get authCubit => BlocProvider.of<AuthCubit>(this);
//   AuthState get auth => authCubit.state;

//   AccountRecord get user => auth.login.accountRecord!;

//   List<Currency> get currencies => auth.login.currencies ?? [];
// }
