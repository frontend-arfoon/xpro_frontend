import 'package:exact_pro/features/dashboard/widgets/dash_board_side_actions.dart';
import 'package:exact_pro/features/dashboard/widgets/dash_board_side_actions_bottom.dart';
import 'package:exact_pro/utils/app_utils/app_utils.dart';
import 'package:exact_pro/x_pro.dart';
import 'package:flutter_utils/flutter_utils.dart';

class DashBoardSide extends StatelessWidget {
  const DashBoardSide({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: Spaces.tinyMiniAll,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(children: [
            Row(children: [
              SvgIcon(SvgIcons.exact, size: 50),
              Spaces.tinyWidth,
              Expanded(
                child: Text(
                  "Ahmadi Srafi and money exchange services",
                  overflow: TextOverflow.visible,
                  style: context.theme.primaryTextTheme.labelLarge,
                ),
              ),
            ]),
            Spaces.smallHeight,
            AppTextField(
              height: 42,
              borderRadius: Radiuses.smallCircle,
              prefix: SvgIcon(SvgIcons.arrow),
              suffix: _buildTSeachSuffix(context),
            ),
            Spaces.smallHeight,
            const DashBoardSideActions(),
          ]),
          const DashBoardSideActionsBottom()
        ],
      ),
    );
  }

  AppCard _buildTSeachSuffix(BuildContext context) {
    return AppCard(
      color: context.colors.primary.withOpacity(.1),
      margin: Spaces.only(all: Spaces.mini + 2),
      borderRadius: Radiuses.miniCircle,
      child: Text(
        textAlign: TextAlign.center,
        "/",
        style: context.theme.primaryTextTheme.titleLarge,
      ),
    );
  }
}
