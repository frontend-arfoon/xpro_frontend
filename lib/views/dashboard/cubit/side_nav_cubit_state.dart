part of 'side_nav_cubit_cubit.dart';

// @immutable
// sealed class SideNavCubitState {}

class SideNavCubitState {
  final SideNavType nav;

  SideNavCubitState({required this.nav});

  SideNavCubitState copyWith({
    SideNavType? nav,
  }) {
    return SideNavCubitState(
      nav: nav ?? this.nav,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SideNavCubitState && other.nav == nav;
  }

  @override
  int get hashCode => nav.hashCode;
}
