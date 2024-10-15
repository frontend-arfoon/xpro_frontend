import 'package:exact_pro/x_pro.dart';
import 'package:flutter_utils/flutter_utils.dart';

class DashBoardBody extends StatelessWidget {
  const DashBoardBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.max, children: [
      DashBoardBodyTop(context: context),
      _buildDashboardFrame(
        context,
        ListView(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Dashboard", style: context.theme.textTheme.displayLarge),
              ],
            ),
          ],
        ),
      ),
    ]);
  }

  Widget _buildDashboardFrame(BuildContext context, Widget body) {
    return Expanded(
      child: AppCard(
        padding: Spaces.tinyAll,
        color: context.colors.disabledLight.withOpacity(.5),
        borderRadius: context.ltr
            ? Radiuses.only(left: Radiuses.mediumRadius)
                .copyWith(bottomLeft: Radius.zero)
            : Radiuses.only(right: Radiuses.mediumRadius)
                .copyWith(bottomRight: Radius.zero),
        child: body,
      ),
    );
  }
}
