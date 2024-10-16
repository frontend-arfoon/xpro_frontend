import 'package:flutter_utils/flutter_utils.dart';

import 'package:exact_pro/x_pro.dart';

enum TopNavType { home, report }

class DashBoardBody extends StatelessWidget {
  const DashBoardBody({
    super.key,
    required this.child,
    required this.topNavTypes,
    required this.selectedTopNavType,
    required this.onSelectTopTYpe,
  });

  final Widget child;
  final List<TopNavType> topNavTypes;
  final TopNavType selectedTopNavType;
  final Function(TopNavType t) onSelectTopTYpe;

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.max, children: [
      DashboardBodyTop(
        context: context,
        topNavTypes: topNavTypes,
        onSelectTopTYpe: onSelectTopTYpe,
        selected: selectedTopNavType,
      ),
      _buildDashboardFrame(
        context,
        ListView(children: [
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [child]),
        ]),
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
