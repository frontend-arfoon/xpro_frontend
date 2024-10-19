import 'package:bloc/bloc.dart';
import 'package:exact_pro/x_pro.dart';

part 'side_nav_cubit_state.dart';

class SideNavCubitCubit extends Cubit<SideNavCubitState> {
  SideNavCubitCubit()
      : super(SideNavCubitState(nav: SideNavType.dashboard, collapsed: false));

  void changeTo(SideNavType nav) {
    return emit(state.copyWith(nav: nav));
  }

  void onCollapsed(bool collapsed) {
    return emit(state.copyWith(collapsed: collapsed));
  }
}
