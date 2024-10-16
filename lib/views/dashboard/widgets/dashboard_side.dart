import 'package:exact_pro/views/dashboard/widgets/dashboard_side_actions.dart';
import 'package:exact_pro/views/dashboard/widgets/dashboard_side_actions_bottom.dart';
import 'package:exact_pro/utils/app_utils/app_utils.dart';
import 'package:exact_pro/x_pro.dart';
import 'package:flutter_utils/flutter_utils.dart';

enum SideNavType { dashboard, operations, account, monitoring }

class DashboardSide extends StatelessWidget {
  const DashboardSide({
    super.key,
    required this.selected,
    required this.sidTabs,
    required this.onNav,
    required this.onAction,
    required this.onCollaps,
    required this.onAccount,
  });

  final SideNavType selected;
  final List<SideNavType> sidTabs;
  final Function(SideNavType nav) onNav;
  final Function(SideBottomActionType t) onAction;
  final Function() onCollaps;
  final Function() onAccount;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: Spaces.tinyMiniAll,
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
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
            autoFocus: true,
            borderRadius: Radiuses.smallCircle,
            prefix: SvgIcon(SvgIcons.search),
            suffix: _buildSearchSuffix(context),
          ),
          Spaces.tinyMiniHeight,
          DashboardSideActions(
            sidTabs: sidTabs,
            selected: selected,
            onNav: onNav,
          ),
        ]),
        Column(children: [
          DashboardSideActionsBottom(onACtion: onAction),
          _buildUser(context),
          _buildCollops(context),
        ])
      ]),
    );
  }

  AppCard _buildCollops(BuildContext context) {
    return AppCard(
      margin: Spaces.tinyAll,
      child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        const Text("Coups"),
        Spaces.tinyWidth,
        AppCard(
            onPressed: onCollaps,
            border: Border.all(color: context.colors.disabledLight),
            borderRadius: Radiuses.smallCircle,
            padding: Spaces.miniAll,
            child: SvgIcon(
              SvgIcons.collaps,
              color: context.colors.disabled,
              size: 18,
            )),
      ]),
    );
  }

  Widget _buildUser(BuildContext context) {
    return AppCard(
      onPressed: onAccount,
      margin: Spaces.tinyAll,
      padding: Spaces.only(vertical: Spaces.mini + 1, horizontal: Spaces.tiny),
      borderRadius: Radiuses.smallCircle,
      color: context.colors.primary.withOpacity(0.07),
      child: Row(children: [
        CircleCharWidget(color: context.colors.primary, text: "M", size: 38),
        Spaces.miniWidth,
        Column(
          children: [
            Text("Mr.Msayed Q",
                style: context.theme.primaryTextTheme.bodyMedium),
            Text(" Manager of Srafi", style: context.theme.textTheme.label),
          ],
        ),
      ]),
    );
  }

  AppCard _buildSearchSuffix(BuildContext context) {
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
