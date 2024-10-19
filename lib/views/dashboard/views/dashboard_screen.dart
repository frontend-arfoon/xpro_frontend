import 'package:exact_pro/views/dashboard/widgets/dashboard_start_side.dart';
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

  List<AccountType> accountTypes = [
    AccountType.customer,
    AccountType.individual,
    AccountType.corporate,
    AccountType.assets,
    AccountType.system
  ];
  List<TransactionType> transactionTypes = [
    TransactionType.deposit,
    TransactionType.withdraw,
    TransactionType.accTransfer,
    TransactionType.exchange,
    TransactionType.income,
    TransactionType.outgoing
  ];
  List<ActionType> actionType = [
    ActionType.unPin,
    ActionType.pending,
    ActionType.activity,
    ActionType.average,
    ActionType.dabSanctionList,
    ActionType.adbReport,
    ActionType.dabAction,
    ActionType.dabExchangeRate
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: BlocBuilder<SideNavCubitCubit, SideNavCubitState>(
        bloc: cubit,
        builder: (context, state) {
          return Scaffold(
            body: Container(
              color: context.colors.background,
              child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
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
                    collapsed: state.collapsed,
                    onCollaps: () {
                      cubit.onCollapsed(!state.collapsed);
                    },
                  ),
                ),
                Expanded(
                  flex: state.collapsed ? 15 : 6,
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
                      accountTypes: accountTypes,
                      transactionTypes: transactionTypes,
                      actionType: actionType,
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
