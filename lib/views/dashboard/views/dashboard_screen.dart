import 'package:exact_pro/views/dashboard/widgets/dashboard_side_actions_bottom.dart';
import 'package:exact_pro/views/dashboard/widgets/side_nav_body.dart';
import 'package:exact_pro/x_pro.dart';
import 'package:flutter_utils/flutter_utils.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final SideNavCubitCubit cubit = SideNavCubitCubit();

  List<SideNavType> get sidNaves => [
        SideNavType.dashboard,
        SideNavType.operations,
        SideNavType.account,
        SideNavType.monitoring,
      ];

  List<TopNavType> get topNaves => [TopNavType.home, TopNavType.report];
  TopNavType selectedTopNav = TopNavType.home;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: BlocBuilder<SideNavCubitCubit, SideNavCubitState>(
        bloc: cubit,
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(elevation: 1, title: const Text("Dashboard")),
            body: Container(
              color: context.colors.background,
              child: Row(children: [
                Expanded(
                  child: DashboardSide(
                    selected: state.nav,
                    sidTabs: sidNaves,
                    onNav: (nav) {
                      cubit.changeTo(nav);
                    },
                    onAction: (t) {
                      switch (t) {
                        case SideBottomActionType.changeThem:
                          context.showSnackBar(t.name.enumWord);
                        case SideBottomActionType.support:
                          context.showSnackBar(t.name.enumWord);
                        case SideBottomActionType.settings:
                          context.showSnackBar(t.name.enumWord);
                      }
                    },
                    onAccount: () {},
                    onCollaps: () {},
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: DashBoardBody(
                    topNavTypes: topNaves,
                    selectedTopNavType: selectedTopNav,
                    onSelectTopTYpe: (t) {
                      setState(() {
                        selectedTopNav = t;
                      });
                      context.showSnackBar(t.name.enumWord);
                    },
                    child: SideNavBody(
                      selectedTopNav: selectedTopNav,
                      selectedSideNav: state.nav,
                    ),
                  ),
                ),
              ]),
            ),
          );
        },
      ),
    );
  }
}
