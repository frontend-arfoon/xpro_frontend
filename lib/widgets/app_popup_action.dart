import 'package:exact_pro/utils/app_utils/svg_icons.dart';
import 'package:flutter_utils/flutter_utils.dart';

class AppPopupAction extends StatelessWidget {
  const AppPopupAction({
    super.key,
    this.onAction,
    required this.prefixSvg,
    required this.text,
  });

  final Function()? onAction;
  final SvgData prefixSvg;
  final String text;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      onLongPress: onAction,
      child: Row(children: [
        SvgIcon(prefixSvg),
        Spaces.miniWidth,
        Text(text, style: context.theme.primaryDarkTextTheme.bodyMedium),
        Spaces.miniWidth,
        SvgIcon(
          SvgIcons.arrow,
          size: 16,
          color: context.colors.primary.withOpacity(.5),
        ),
      ]),
    );
  }
}
