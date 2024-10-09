import 'package:exact_pro/x_pro.dart';

class FieldLabel extends StatelessWidget {
  const FieldLabel({
    super.key,
    this.svg,
    this.label,
    this.localize = true,
    this.endLabel,
    this.color,
  });

  final SvgData? svg;
  final String? label;
  final bool localize;
  final Widget? endLabel;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      padding: Spaces.only(bottom: Spaces.xmini),
      child: Row(
        children: [
          if (svg != null)
            SvgIcon(
              svg!,
              color: color ?? context.theme.textColor,
              size: 18,
              margin: Spaces.miniEnd,
            ),
          if (label != null)
            Text(
              localize ? label?.localize(context) ?? "" : label ?? "",
              style: TextStyle(
                color: color ?? context.theme.textColor,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          Spaces.miniWidth,
          endLabel ?? const SizedBox.shrink(),
        ],
      ),
    );
  }
}
