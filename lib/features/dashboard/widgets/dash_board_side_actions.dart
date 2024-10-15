import 'package:exact_pro/utils/app_utils/svg_icons.dart';
import 'package:flutter_utils/flutter_utils.dart';

class DashBoardSideActions extends StatefulWidget {
  const DashBoardSideActions({super.key});

  @override
  State<DashBoardSideActions> createState() => _DashBoardSideActionsState();
}

class _DashBoardSideActionsState extends State<DashBoardSideActions> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ...List.generate(
        4,
        (i) => _buildItem(
          context,
          selected: i == selected,
          onTap: () {
            setState(() {
              selected = i;
            });
          },
        ),
      )
    ]);
  }

  AppCard _buildItem(BuildContext context,
      {required bool selected, required Function() onTap}) {
    var style = context.theme
        .textThemeOf(selected ? context.colors.background : context.colors.text)
        .bodySmall;
    return AppCard(
      onPressed: onTap,
      margin: Spaces.miniAll,
      padding: Spaces.only(horizontal: Spaces.tiny, vertical: Spaces.mini),
      borderRadius: Radiuses.smallCircle,
      color: selected ? context.colors.primary : context.colors.background,
      child: Row(
        children: [
          SvgIcon(
            SvgIcons.arrow,
            color: selected ? context.colors.background : context.colors.text,
          ),
          Spaces.tinyMiniWidth,
          Text("data", style: style),
        ],
      ),
    );
  }
}
