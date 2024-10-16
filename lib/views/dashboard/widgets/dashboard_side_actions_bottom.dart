import 'package:exact_pro/utils/app_utils/svg_icons.dart';
import 'package:flutter_utils/flutter_utils.dart';

enum SideBottomActionType { changeThem, support, settings }

class DashboardSideActionsBottom extends StatelessWidget {
  const DashboardSideActionsBottom({super.key, required this.onACtion});

  final Function(SideBottomActionType t) onACtion;

  List<SideBottomActionType> get sidBottomTabs => ([
        SideBottomActionType.changeThem,
        SideBottomActionType.support,
        SideBottomActionType.settings
      ]);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...List.generate(
          sidBottomTabs.length,
          (index) => _buildItem(context, t: sidBottomTabs[index], onTap: () {
            onACtion.call(sidBottomTabs[index]);
          }),
        ),
      ],
    );
  }

  AppCard _buildItem(
    BuildContext context, {
    required Function() onTap,
    required SideBottomActionType t,
  }) {
    var style = context.theme.textThemeOf(context.colors.text).bodySmall;

    return AppCard(
      onPressed: onTap,
      margin: Spaces.miniAll,
      padding: Spaces.only(horizontal: Spaces.tiny, vertical: Spaces.mini),
      borderRadius: Radiuses.smallCircle,
      color: context.colors.background,
      child: Row(
        children: [
          SvgIcon(SvgIcons.dashboardBottomSideIcons(t),
              color: context.colors.text),
          Spaces.tinyMiniWidth,
          Text(t.name.enumWord.localize(context), style: style),
        ],
      ),
    );
  }
}
