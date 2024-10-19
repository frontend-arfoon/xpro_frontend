import 'package:exact_pro/views/dashboard/widgets/dashboard_start_side.dart';
import 'package:exact_pro/x_pro.dart';
import 'package:flutter_utils/flutter_utils.dart';

class SideNavBody extends StatelessWidget {
  const SideNavBody({
    super.key,
    required this.selectedTopNav,
    required this.selectedSideNav,
    required this.accountTypes,
    required this.transactionTypes,
    required this.actionType,
  });

  final TopNavType selectedTopNav;
  final SideNavType selectedSideNav;

  final List<AccountType> accountTypes;
  final List<TransactionType> transactionTypes;
  final List<ActionType> actionType;

  @override
  Widget build(BuildContext context) {
    var style = context.theme.textTheme.displayLarge;
    if (selectedTopNav == TopNavType.home) {
      switch (selectedSideNav) {
        case SideNavType.dashboard:
          return DashBoardPage(
            accountTypes: accountTypes,
            transactionTypes: transactionTypes,
            actionType: actionType,
          );
        case SideNavType.operations:
          return Text(selectedSideNav.name.enumWord, style: style);
        case SideNavType.account:
          return Text(selectedSideNav.name.enumWord, style: style);
        case SideNavType.monitoring:
          return Text(selectedSideNav.name.enumWord, style: style);
      }
    }
    return Column(children: [
      Text("this is the screen for reporting", style: style),
    ]);
  }
}
