part of 'side_nav_cubit_cubit.dart';

// @immutable
// sealed class SideNavCubitState {}

class SideNavCubitState {
  final SideNavType nav;
  final bool collapsed;

  SideNavCubitState({required this.nav, this.collapsed = false});

  SideNavCubitState copyWith({
    SideNavType? nav,
    bool? collapsed,
  }) {
    return SideNavCubitState(
        nav: nav ?? this.nav, collapsed: collapsed ?? this.collapsed);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SideNavCubitState &&
        other.nav == nav &&
        other.collapsed == collapsed;
  }

  @override
  int get hashCode => nav.hashCode ^ collapsed.hashCode;
}
