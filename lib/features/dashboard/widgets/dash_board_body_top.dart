import 'package:exact_pro/utils/app_utils/svg_icons.dart';
import 'package:flutter_utils/flutter_utils.dart';

class DashBoardBodyTop extends StatelessWidget {
  const DashBoardBodyTop({
    super.key,
    required this.context,
  });

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: Spaces.tinyAll,
      child: Row(children: [
        _buildItem(context, onTap: () {}),
        _buildItem(context, onTap: () {}),
      ]),
    );
  }

  Widget _buildItem(BuildContext context, {required Function() onTap}) {
    var style = context.theme.textThemeOf(context.colors.text).bodySmall;
    return AppCard(
      onPressed: onTap,
      padding: Spaces.only(horizontal: Spaces.tiny, vertical: Spaces.mini),
      borderRadius: Radiuses.smallCircle,
      margin: Spaces.tinyHorizontal,
      color: context.colors.background,
      child: Row(
        children: [
          SvgIcon(SvgIcons.arrow, color: context.colors.text),
          Spaces.tinyMiniWidth,
          Text("Data", style: style),
        ],
      ),
    );
  }
}
