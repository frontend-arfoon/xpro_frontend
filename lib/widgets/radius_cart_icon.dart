import 'package:flutter_utils/flutter_utils.dart';

class RadiusCartIcon extends StatelessWidget {
  const RadiusCartIcon({super.key, required this.icon, this.color});

  final SvgData icon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: Spaces.tinyAll,
      borderRadius: Radiuses.circle,
      color: context.colors.primary.withOpacity(.07),
      child: SvgIcon(icon, size: 19, color: color),
    );
  }
}
