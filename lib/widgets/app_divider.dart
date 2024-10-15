
import 'package:flutter_utils/flutter_utils.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({
    super.key,
    this.height,
    this.color,
    this.margin,
    this.padding,
  });

  final double? height;
  final Color? color;
  final EdgeInsets? margin, padding;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      margin: margin ?? Spaces.zero,
      padding: padding ?? Spaces.zero,
      width: double.infinity,
      height: .5,
      color: color ?? context.theme.disabledLightColor,
    );
  }
}
