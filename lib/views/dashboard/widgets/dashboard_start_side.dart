import 'package:exact_pro/theme/theme.dart';
import 'package:exact_pro/utils/app_utils/app_utils.dart';
import 'package:exact_pro/views/dashboard/widgets/dash_board_cart.dart';
import 'package:exact_pro/views/dashboard/widgets/dashboard_label_cart.dart';
import 'package:flutter_utils/flutter_utils.dart';

enum AccountType {
  customer,
  individual,
  corporate,
  assets,
  expense,
  system,
}

enum TransactionType {
  deposit,
  withdraw,
  accTransfer,
  exchange,
  income,
  outgoing,
}

enum ActionType {
  unPin,
  pending,
  activity,
  average,
  dabSanctionList,
  dabAction,
  dabExchangeRate,
  adbReport
}

class DashboardPageStartSide extends StatelessWidget {
  const DashboardPageStartSide({
    super.key,
    required this.accountTypes,
    required this.transactionTypes,
    required this.actionType,
  });

  final List<AccountType> accountTypes;
  final List<TransactionType> transactionTypes;
  final List<ActionType> actionType;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: AppCard(
        padding: Spaces.only(all: Spaces.mini, end: Spaces.tiny),
        child: Column(children: [
          _buildAccounts(),
          _buildTransaction(),
          _buildActions(context),
        ]),
      ),
    );
  }

  DashBoardCart _buildActions(BuildContext context) {
    return DashBoardCart(
      onAction: () {},
      titleStart: "Accounts",
      iconStart: SvgIcons.accountFill,
      titleEnd: "More",
      iconEnd: SvgIcons.arrow,
      child: Wrap(runSpacing: Spaces.tiny, children: [
        ...List.generate(
          actionType.length,
          (i) => DashboardLabelCart(
            isActions: true,
            title: actionType[i].name.enumWord,
            value: "66",
            icon: SvgIcons.actionTypeIcons(actionType[i]),
            color: context.colors.primary,
            actionsEndIcon: i <= 3 ? SvgIcons.arrow : SvgIcons.link,
          ),
        )
      ]),
    );
  }

  DashBoardCart _buildTransaction() {
    return DashBoardCart(
      onAction: () {},
      titleStart: "Accounts",
      iconStart: SvgIcons.accountFill,
      titleEnd: "Today",
      iconEnd: SvgIcons.arrow,
      child: Row(children: [
        ...List.generate(
          transactionTypes.length,
          (i) => DashboardLabelCart(
            isAccount: false,
            title: transactionTypes[i].name.enumWord,
            value: "32",
            icon: SvgIcons.transitionTypeIcons(transactionTypes[i]),
            color: AppColors.transitionTypeColor(transactionTypes[i]),
          ),
        )
      ]),
    );
  }

  DashBoardCart _buildAccounts() {
    return DashBoardCart(
      onAction: () {},
      titleStart: "Accounts",
      iconStart: SvgIcons.accountFill,
      titleEnd: "New",
      iconEnd: SvgIcons.plus,
      child: Row(children: [
        ...List.generate(
          accountTypes.length,
          (i) => DashboardLabelCart(
            isAccount: true,
            title: accountTypes[i].name.enumWord,
            value: "32",
            icon: SvgIcons.accountTypeIcons(accountTypes[i]),
            color: AppColors.accountTypeColor(accountTypes[i]),
          ),
        )
      ]),
    );
  }
}
