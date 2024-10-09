import 'package:exact_pro/x_pro.dart';

class XPButton extends StatelessWidget {
  const XPButton({
    super.key,
    this.width,
    this.color,
    this.svgColor,
    this.backColor,
    this.borderColor,
    this.text,
    this.svg,
    required this.onAction,
    this.svgSize,
    this.height,
  });

  final Color? color, backColor, borderColor, svgColor;
  final String? text;
  final double? svgSize;
  final SvgData? svg;
  final VoidCallback onAction;
  final double? width, height;

  @override
  Widget build(BuildContext context) {
    return XPCard(
      onTap: onAction,
      color: backColor ?? context.theme.backgroundColor,
      border: Border.all(
          width: .5, color: borderColor ?? context.theme.disabledLightColor),
      width: width,
      height: height ?? 37,
      padding: Spaces.only(horizontal: Spaces.tiny),
      borderRadius: Radiuses.miniCircle,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // SvgIcon(svg, size: svgSize ?? 20, color: svgColor ?? color),
          if (text != null) Spaces.miniWidth,
          if (text != null)
            XPCard(
              padding: Spaces.only(end: Spaces.mini),
              child: Text(
                text!.localize(context),
                style: context.theme
                    .textThemeOf(color ?? context.theme.textColor)
                    .bodyMedium,
              ),
            ),
        ],
      ),
    );
  }
}
