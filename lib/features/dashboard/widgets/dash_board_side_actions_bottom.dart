import 'package:exact_pro/utils/app_utils/svg_icons.dart';
import 'package:flutter_utils/flutter_utils.dart';

class DashBoardSideActionsBottom extends StatelessWidget {
  const DashBoardSideActionsBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...List.generate(3, (index) => _buildItem(context, onTap: () {})),
      ],
    );
  }

  AppCard _buildItem(BuildContext context, {required Function() onTap}) {
    var style = context.theme.textThemeOf(context.colors.text).bodySmall;
    return AppCard(
      onPressed: onTap,
      margin: Spaces.miniAll,
      padding: Spaces.only(horizontal: Spaces.tiny, vertical: Spaces.mini),
      borderRadius: Radiuses.smallCircle,
      color: context.colors.background,
      child: Row(
        children: [
          SvgIcon(SvgIcons.arrow, color: context.colors.text),
          Spaces.tinyMiniWidth,
          Text("data", style: style),
        ],
      ),
    );
  }
}
