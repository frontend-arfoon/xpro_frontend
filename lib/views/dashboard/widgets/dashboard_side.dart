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
    required this.collapsed,
  });

  final SideNavType selected;
  final List<SideNavType> sidTabs;
  final Function(SideNavType nav) onNav;
  final Function(SideBottomActionType t) onAction;
  final Function() onCollaps;
  final Function() onAccount;
  final bool collapsed;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: Spaces.tinyMiniAll,
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(children: [
          AppCard(
            borderRadius: Radiuses.smallCircle,
            onPressed: () {
              context.popIfCan();
            },
            child: Row(
              mainAxisAlignment: collapsed
                  ? MainAxisAlignment.center
                  : MainAxisAlignment.start,
              children: [
                SvgIcon(SvgIcons.exact, size: 50),
                if (!collapsed) Spaces.tinyWidth,
                if (!collapsed)
                  Expanded(
                    child: Text(
                      "Ahmadi Srafi and money exchange services",
                      overflow: TextOverflow.visible,
                      style: context.theme.primaryTextTheme.labelLarge,
                    ),
                  ),
              ],
            ),
          ),
          Spaces.smallHeight,
          AppCard(
            padding: Spaces.miniHorizontal,
            child: AppTextField(
              height: 38,
              autoFocus: true,
              hintText: "search".localize(context),
              borderRadius: Radiuses.smallCircle,
              prefix: SvgIcon(SvgIcons.search),
              suffix: collapsed ? null : _buildSearchSuffix(context),
              readOnly: true,
              onTap: () {
                context.pushDialog(CenterDialog(
                  padding: Spaces.smallAll,
                  maxWidth: 500,
                  child: Column(children: [
                    AppTextField(
                      autoFocus: true,
                      borderRadius: Radiuses.smallCircle,
                      hintText: "Search you content",
                    ),
                  ]),
                ));
              },
            ),
          ),
          Spaces.tinyMiniHeight,
          DashboardSideNaves(
            collapsed: collapsed,
            sidTabs: sidTabs,
            selected: selected,
            onNav: onNav,
          ),
        ]),
        Column(children: [
          DashboardSideActionsBottom(onACtion: onAction, collapsed: collapsed),
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
        if (!collapsed) const Text("Collaps"),
        if (!collapsed) Spaces.tinyWidth,
        AppCard(
            onPressed: onCollaps,
            border: Border.all(color: context.colors.disabledLight),
            borderRadius: Radiuses.smallCircle,
            padding: Spaces.miniAll,
            child: RotatedBox(
              quarterTurns: collapsed ? 2 : 0,
              child: SvgIcon(
                SvgIcons.collaps,
                color: context.colors.disabled,
                size: 18,
              ),
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
        if (!collapsed) Spaces.miniWidth,
        if (!collapsed)
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
