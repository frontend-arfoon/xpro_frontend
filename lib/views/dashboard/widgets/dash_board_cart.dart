import 'package:exact_pro/widgets/app_label_cart.dart';
import 'package:exact_pro/widgets/radius_cart_icon.dart';
import 'package:flutter_utils/flutter_utils.dart';

class DashBoardCart extends StatelessWidget {
  const DashBoardCart({
    super.key,
    this.child,
    required this.titleStart,
    required this.iconStart,
    this.titleEnd,
    this.iconEnd,
    this.onAction,
  });

  final Widget? child;
  final String titleStart;
  final SvgData iconStart;
  final String? titleEnd;
  final SvgData? iconEnd;
  final Function()? onAction;

  @override
  Widget build(BuildContext context) {
    return AppLabelCart(
      margin: Spaces.tinyBottom,
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                RadiusCartIcon(icon: iconStart),
                Spaces.miniWidth,
                Text(titleStart.localize(context),
                    style: context.theme.textTheme.titleLarge),
              ]),
              if (iconEnd != null)
                AppCard(
                  onPressed: onAction,
                  padding: Spaces.only(
                      horizontal: Spaces.tinyMini, vertical: Spaces.tiny),
                  borderRadius: Radiuses.circle,
                  color: context.colors.primary.withOpacity(.07),
                  child: Row(children: [
                    if (titleEnd != null)
                      Text(titleEnd!,
                          style: context.theme.textTheme.bodyMedium),
                    Spaces.tinyWidth,
                    SvgIcon(iconEnd!, size: 18),
                  ]),
                ),
            ]),
        Spaces.tinyMiniHeight,
        child ?? const SizedBox.shrink()
      ]),
    );
  }
}
