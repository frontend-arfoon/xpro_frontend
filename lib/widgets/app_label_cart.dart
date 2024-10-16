import 'package:flutter_utils/flutter_utils.dart';

class AppLabelCart extends StatelessWidget {
  const AppLabelCart({
    super.key,
    required this.child,
    this.onTap,
    this.color,
    this.borderColor,
    this.border,
    this.borderRadius,
    this.padding,
    this.margin,
  });

  final Widget child;
  final Function()? onTap;
  final Color? color, borderColor;
  final Border? border;
  final BorderRadius? borderRadius;
  final EdgeInsets? padding;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      margin: margin,
      color: color ?? context.colors.background,
      onPressed: onTap,
      border: border ??
          Border.all(
              color: borderColor ?? context.colors.disabledLight, width: .5),
      borderRadius: borderRadius ?? Radiuses.mediumCircle,
      padding: padding ?? Spaces.tinyMiniAll,
      child: child,
    );
  }
}
