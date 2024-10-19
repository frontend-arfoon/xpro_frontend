import 'package:exact_pro/utils/app_utils/svg_icons.dart';
import 'package:exact_pro/widgets/app_label_cart.dart';
import 'package:exact_pro/widgets/radius_cart_icon.dart';
import 'package:flutter_utils/flutter_utils.dart';

class DashboardLabelCart extends StatelessWidget {
  const DashboardLabelCart({
    super.key,
    this.child,
    required this.title,
    required this.icon,
    this.value,
    this.onAction,
    this.isAccount = true,
    this.isActions = false,
    required this.color,
    this.actionsEndIcon,
  });

  final Widget? child;
  final String title;
  final SvgData icon;
  final String? value;
  final Function()? onAction;
  final bool isAccount, isActions;
  final Color color;
  final SvgData? actionsEndIcon;

  @override
  Widget build(BuildContext context) {
    return AppLabelCart(
      margin: Spaces.tinyEnd,
      padding: Spaces.tinyAll,
      borderRadius: Radiuses.smallCircle,
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                // if action
                if (isActions)
                  AppCard(
                      padding: Spaces.miniAll,
                      borderRadius: Radiuses.circle,
                      color: context.colors.primary.withOpacity(.05),
                      child: SvgIcon(icon, color: context.colors.primary)),
                if (isActions) Spaces.tinyWidth,
                if (isActions)
                  Text(title.localize(context),
                      style: context.theme.primaryTextTheme.bodyLarge),
                // if not  action
                if (!isActions)
                  Text(title.localize(context),
                      style: context.theme.textThemeOf(color).bodyMedium),
                Spaces.smallTinyWidth,
                if (isAccount && !isActions)
                  RadiusCartIcon(icon: icon, color: color),
                if (isActions)
                  SvgIcon(
                    actionsEndIcon ?? SvgIcons.plus,
                    color: context.colors.primary.withOpacity(.2),
                  )
              ]),
            ],
          ),
          if (!isActions) Spaces.miniHeight,
          if (!isActions)
            if (value != null)
              Text(value!,
                  style: context.theme
                      .textThemeOf(color)
                      .titleLarge
                      ?.copyWith(fontSize: isAccount ? 22 : 16)),
        ]),
        if (!isAccount) RadiusCartIcon(icon: icon, color: color),
      ]),
    );
  }
}
