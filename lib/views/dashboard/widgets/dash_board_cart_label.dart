import 'package:exact_pro/widgets/app_label_cart.dart';
import 'package:exact_pro/widgets/radius_cart_icon.dart';
import 'package:flutter_utils/flutter_utils.dart';

class DashBoardCartLabel extends StatelessWidget {
  const DashBoardCartLabel({
    super.key,
    required this.child,
    required this.title,
    required this.icon,
    this.value,
    this.onAction,
    this.isAccount = true,
  });

  final Widget child;
  final String title;
  final SvgData icon;
  final String? value;
  final Function()? onAction;
  final bool isAccount;

  @override
  Widget build(BuildContext context) {
    return AppLabelCart(
      margin: Spaces.tinyEnd,
      padding: Spaces.tinyAll,
      borderRadius: Radiuses.smallCircle,
      child: Row(children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(title.localize(context),
                    style: context.theme.textTheme.bodyMedium),
                Spaces.largeWidth,
                if (isAccount) RadiusCartIcon(icon: icon),
              ]),
            ],
          ),
          Spaces.miniHeight,
          if (value != null)
            Text(value!,
                style: context.theme
                    .textThemeOf(context.colors.warning)
                    .titleLarge),
        ]),
        if (!isAccount) RadiusCartIcon(icon: icon),
      ]),
    );
  }
}
