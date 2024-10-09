import 'package:exact_pro/x_pro.dart';

class XPCard extends StatelessWidget {
  const XPCard({
    super.key,
    this.width,
    this.height,
    this.margin,
    this.padding,
    this.child,
    this.borderRadius,
    this.gradient,
    this.color,
    this.boxShadow,
    this.alignment,
    this.onTap,
    this.border,
    this.shadowColor,
    this.shadowBlur,
    this.minHeight,
    this.minWidth,
    this.heroTag,
    this.duration,
    this.onPressed,
    this.splashColor,
    this.onLongPress,
    this.maxHeight,
    this.maxWidth,
    this.bindings,
    this.onDoubleTap,
  });

  final double? width;
  final double? height;
  final EdgeInsets? padding, margin;
  final BorderRadius? borderRadius;
  final Gradient? gradient;
  final BoxShadow? boxShadow;
  final Color? color, splashColor;
  final Color? shadowColor;
  final double? shadowBlur;
  final AlignmentGeometry? alignment;
  final Widget? child;
  final Function? onTap;
  final BoxBorder? border;
  final double? minHeight;
  final double? minWidth;
  final double? maxHeight;
  final double? maxWidth;
  final String? heroTag;
  final Duration? duration;
  final Function? onPressed;
  final VoidCallback? onLongPress, onDoubleTap;
  final Map<SingleActivator, VoidCallback>? bindings;

  @override
  Widget build(BuildContext context) {
    Widget xpCard;

    final decoration = BoxDecoration(
      color: color,
      borderRadius: borderRadius,
      boxShadow: [
        if (shadowColor != null)
          BoxShadow(color: shadowColor!, blurRadius: shadowBlur ?? 6),
        if (boxShadow != null) boxShadow!,
      ],
      gradient: gradient,
      border: border,
    );
    if (duration != null) {
      xpCard = AnimatedContainer(
        duration: duration!,
        width: width,
        height: height,
        padding: padding,
        alignment: alignment,
        constraints: BoxConstraints(
          minHeight: minHeight ?? 0,
          minWidth: minWidth ?? 0,
          maxHeight: maxHeight ?? double.infinity,
          maxWidth: maxWidth ?? double.infinity,
        ),
        decoration: onPressed != null ? null : decoration,
        child: child,
      );
    } else {
      xpCard = Container(
        width: width,
        height: height,
        padding: padding,
        alignment: alignment,
        constraints: BoxConstraints(
          minHeight: minHeight ?? 0,
          minWidth: minWidth ?? 0,
          maxHeight: maxHeight ?? double.infinity,
          maxWidth: maxWidth ?? double.infinity,
        ),
        decoration: onPressed != null ? null : decoration,
        child: child,
      );
    }

    if (heroTag != null) {
      xpCard = Hero(tag: heroTag!, child: xpCard);
    }

    if (bindings != null) {
      xpCard = CallbackShortcuts(bindings: bindings!, child: xpCard);
    }

    var primaryColor = Theme.of(context).primaryColor;

    if (onPressed != null) {
      xpCard = Container(
        decoration: decoration.copyWith(color: color),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            focusColor: primaryColor.withOpacity(.1),
            onTap: () {
              onPressed?.call();
            },
            borderRadius: borderRadius,
            highlightColor: splashColor ?? primaryColor.withOpacity(.05),
            splashColor: splashColor ?? primaryColor.withOpacity(.05),
            hoverColor: splashColor ?? primaryColor.withOpacity(.05),
            overlayColor: WidgetStateProperty.all(
              splashColor ?? primaryColor.withOpacity(.05),
            ),
            child: xpCard,
          ),
        ),
      );
    }

    if (onTap != null || onLongPress != null || onDoubleTap != null) {
      xpCard = GestureDetector(
        onTap: onTap == null ? null : () => onTap!(),
        onLongPress: onLongPress,
        onDoubleTap: onDoubleTap,
        child: xpCard,
      );
    }

    if ((onTap != null || onPressed != null || onLongPress != null)) {
      xpCard = MouseRegion(
        cursor: SystemMouseCursors.click,
        child: xpCard,
      );
    }

    final container = Container(margin: margin, child: xpCard);
    return container;
  }
}
