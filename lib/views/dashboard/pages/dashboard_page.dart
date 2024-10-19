import 'package:exact_pro/views/dashboard/widgets/dashboard_page_end_side.dart';
import 'package:exact_pro/views/dashboard/widgets/dashboard_start_side.dart';
import 'package:flutter_utils/flutter_utils.dart';

class DashBoardPage extends StatelessWidget {
  const DashBoardPage({
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
      child: Column(children: [
        Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          DashboardPageStartSide(
            accountTypes: accountTypes,
            transactionTypes: transactionTypes,
            actionType: actionType,
          ),
          const DashboardPageEndSide(),
        ]),
      ]),
    );
  }
}
