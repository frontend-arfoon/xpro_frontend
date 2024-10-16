import 'package:exact_pro/views/dashboard/widgets/dashboard_body.dart';
import 'package:exact_pro/utils/app_utils/svg_icons.dart';
import 'package:flutter_utils/flutter_utils.dart';

class DashboardBodyTop extends StatelessWidget {
  const DashboardBodyTop({
    super.key,
    required this.context,
    required this.topNavTypes,
    required this.onSelectTopTYpe,
    required this.selected,
  });

  final BuildContext context;
  final List<TopNavType> topNavTypes;
  final Function(TopNavType t) onSelectTopTYpe;
  final TopNavType selected;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: Spaces.tinyAll,
      child: Row(children: [
        ...List.generate(
          topNavTypes.length,
          (i) => _buildItem(context, onTap: () {
            onSelectTopTYpe.call(topNavTypes[i]);
          }, t: topNavTypes[i], selected: topNavTypes[i] == selected),
        ),
      ]),
    );
  }

  Widget _buildItem(
    BuildContext context, {
    required Function() onTap,
    required TopNavType t,
    required bool selected,
  }) {
    var style = context.theme
        .textThemeOf(selected ? context.colors.primary : context.colors.text)
        .bodyLarge;

    return AppCard(
      onPressed: onTap,
      padding: Spaces.only(horizontal: Spaces.tiny, vertical: Spaces.mini),
      borderRadius: Radiuses.smallCircle,
      margin: Spaces.tinyHorizontal,
      color: context.colors.background,
      child: Row(
        children: [
          SvgIcon(SvgIcons.dashboardTopIcons(t),
              color: selected ? context.colors.primary : context.colors.text),
          Spaces.tinyMiniWidth,
          Text(t.name.enumWord.localize(context), style: style),
        ],
      ),
    );
  }
}
