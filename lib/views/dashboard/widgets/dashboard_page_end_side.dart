import 'package:exact_pro/utils/app_utils/app_utils.dart';
import 'package:exact_pro/x_pro.dart';
import 'package:flutter_utils/flutter_utils.dart';

class DashboardPageEndSide extends StatelessWidget {
  const DashboardPageEndSide({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: AppCard(
        padding: Spaces.miniAll,
        child: Column(
          children: [
            DashBoardCart(
              titleStart: "Notifications",
              iconStart: SvgIcons.notification,
              child: const NotificationCart(),
            ),
            DashBoardCart(
              titleStart: "Rate",
              iconStart: SvgIcons.rate,
              titleEnd: "All",
              iconEnd: SvgIcons.arrow,
              child: const RateCart(),
            ),
            DashBoardCart(
              titleStart: "Treasure",
              iconStart: SvgIcons.transfer,
              titleEnd: "More",
              iconEnd: SvgIcons.arrow,
            ),
            DashBoardCart(
              titleStart: "Bank",
              iconStart: SvgIcons.bank,
              titleEnd: "More",
              iconEnd: SvgIcons.arrow,
            ),
          ],
        ),
      ),
    );
  }
}
