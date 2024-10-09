import 'package:exact_pro/x_pro.dart';

class AppCurrencyLabel extends StatelessWidget {
  const AppCurrencyLabel({
    super.key,
    required this.color,
    this.name,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.style,
    this.firstChaStyle,
  });

  final Color color;
  final String? name;
  final double? width, height;
  final EdgeInsets? padding, margin;

  final TextStyle? style, firstChaStyle;

  @override
  Widget build(BuildContext context) {
    return XPCard(
      borderRadius: Radiuses.miniCircle,
      padding: padding ?? Spaces.only(bottom: .3),
      margin: margin,
      width: width ?? 32,
      height: height ?? 19,
      color: color,
      alignment: AlignmentDirectional.center,
      child: RichText(
        text: TextSpan(
          text: name?.substring(0, 1) ?? "",
          style: firstChaStyle ??
              context.theme.textThemeOf(context.theme.warningColor).labelMedium,
          children: [
            TextSpan(
              text: name?.substring(1),
              style: style ?? context.theme.backgroundTextTheme.labelMedium,
            ),
          ],
        ),
      ),
    );
  }
}
