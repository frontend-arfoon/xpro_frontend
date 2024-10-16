import 'package:flutter_utils/flutter_utils.dart';

class CircleCharWidget extends StatelessWidget {
  const CircleCharWidget({
    super.key,
    required this.color,
    this.text,
    this.size = 24,
  });

  final Color color;
  final String? text;
  final double size;

  @override
  Widget build(BuildContext context) {
    var char = text == null || text == '' ? '' : text![0];
    return AppCard(
      alignment: AlignmentDirectional.center,
      width: size,
      height: size,
      color: color,
      borderRadius: Radiuses.circle,
      padding: Spaces.only(bottom: size / 18),
      child: Text(
        char,
        style: context.theme.backgroundTextTheme.body!
            .copyWith(fontSize: size - size / 2.4),
      ),
    );
  }
}
