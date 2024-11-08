import 'package:exact_pro/utils/app_utils/svg_icons.dart';
import 'package:exact_pro/x_pro.dart';
import 'package:flutter_utils/flutter_utils.dart';

class DashboardSideNaves extends StatelessWidget {
  const DashboardSideNaves({
    super.key,
    required this.sidTabs,
    required this.selected,
    required this.onNav,
    required this.collapsed,
  });

  final List<SideNavType> sidTabs;
  final SideNavType selected;
  final Function(SideNavType t) onNav;
  final bool collapsed;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ...List.generate(
        sidTabs.length,
        (i) => _buildItem(
          context,
          selected: sidTabs[i] == selected,
          onTap: () {
            onNav.call(sidTabs[i]);
          },
          t: sidTabs[i],
        ),
      )
    ]);
  }

  AppCard _buildItem(
    BuildContext context, {
    required bool selected,
    required Function() onTap,
    required SideNavType t,
  }) {
    var style = context.theme
        .textThemeOf(selected ? context.colors.background : context.colors.text)
        .bodySmall;

    return AppCard(
      onPressed: onTap,
      margin: Spaces.miniAll,
      padding: Spaces.only(horizontal: Spaces.tinyMini, vertical: Spaces.tiny),
      borderRadius: Radiuses.smallCircle,
      color: selected ? context.colors.primary : context.colors.background,
      child: Row(
        mainAxisAlignment:
            collapsed ? MainAxisAlignment.center : MainAxisAlignment.start,
        children: [
          SvgIcon(
            SvgIcons.dashboardSideIcons(t),
            color: selected ? context.colors.background : context.colors.text,
          ),
          if (!collapsed) Spaces.tinyMiniWidth,
          if (!collapsed) Text(t.name.enumWord.localize(context), style: style),
        ],
      ),
    );
  }
}
