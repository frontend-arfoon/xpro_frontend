import 'package:exact_pro/utils/app_utils/app_utils.dart';
import 'package:exact_pro/utils/app_utils/svg_icons.dart';
import 'package:exact_pro/views/dashboard/widgets/dash_board_cart.dart';
import 'package:exact_pro/views/dashboard/widgets/dash_board_cart_label.dart';
import 'package:flutter_utils/flutter_utils.dart';

class DashBoardPage extends StatefulWidget {
  const DashBoardPage({super.key});

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(children: [
        Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(
            flex: 3,
            child: AppCard(
              padding: Spaces.only(all: Spaces.mini, end: Spaces.tiny),
              child: Column(children: [
                DashBoardCart(
                  onAction: () {},
                  titleStart: "Accounts",
                  iconStart: SvgIcons.accountFill,
                  titleEnd: "New",
                  iconEnd: SvgIcons.plus,
                  child: _buildAccounts(true),
                ),
                DashBoardCart(
                  onAction: () {},
                  titleStart: "Accounts",
                  iconStart: SvgIcons.transaction,
                  titleEnd: "New",
                  iconEnd: SvgIcons.plus,
                  child: _buildAccounts(false),
                ),
                DashBoardCart(
                  onAction: () {},
                  titleStart: "Accounts",
                  iconStart: SvgIcons.bankBenefits,
                  titleEnd: "New",
                  iconEnd: SvgIcons.plus,
                  child: _buildAccounts(true),
                ),
              ]),
            ),
          ),
          Expanded(
            flex: 1,
            child: AppCard(
              padding: Spaces.miniAll,
              child: Column(
                children: [
                  DashBoardCart(
                    titleStart: "Notifications",
                    iconStart: SvgIcons.notification,
                    child: const Text("data"),
                  ),
                  DashBoardCart(
                    titleStart: "Rate",
                    iconStart: SvgIcons.rate,
                    titleEnd: "All",
                    iconEnd: SvgIcons.arrow,
                    child: const Text("data"),
                  ),
                  DashBoardCart(
                    titleStart: "Treasure",
                    iconStart: SvgIcons.transfer,
                    titleEnd: "All",
                    iconEnd: SvgIcons.arrow,
                    child: const Text("data"),
                  ),
                  DashBoardCart(
                    titleStart: "Bank",
                    iconStart: SvgIcons.bank,
                    titleEnd: "All",
                    iconEnd: SvgIcons.arrow,
                    child: const Text("data"),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ]),
    );
  }

  Row _buildAccounts(bool isAccount) {
    return Row(children: [
      DashBoardCartLabel(
        isAccount: isAccount,
        icon: SvgIcons.arrow,
        title: "kook",
        value: "8877",
        onAction: () {},
        child: const Text("data"),
      ),
      DashBoardCartLabel(
        isAccount: isAccount,
        icon: SvgIcons.arrow,
        title: "ok ok",
        value: "8877",
        onAction: () {},
        child: const Text("data"),
      ),
      DashBoardCartLabel(
        isAccount: isAccount,
        icon: SvgIcons.arrow,
        title: "ok ok",
        value: "8877",
        onAction: () {},
        child: const Text("data"),
      ),
      DashBoardCartLabel(
        isAccount: isAccount,
        icon: SvgIcons.arrow,
        title: "ok ok",
        value: "8877",
        onAction: () {},
        child: const Text("data"),
      ),
      DashBoardCartLabel(
        isAccount: isAccount,
        icon: SvgIcons.arrow,
        title: "ok ok",
        value: "8877",
        onAction: () {},
        child: const Text("data"),
      ),
    ]);
  }
}
