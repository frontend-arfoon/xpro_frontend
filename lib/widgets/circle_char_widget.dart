import 'package:exact_pro/x_pro.dart';

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
    return XPCard(
      alignment: AlignmentDirectional.center,
      width: size,
      height: size,
      color: color,
      borderRadius: Radiuses.circle,
      // child: Text(
      //   char,
      //   style: context.theme.backgroundTextTheme.body!
      //       .copyWith(fontSize: size - size / 2.4),
      // ),
      padding: Spaces.only(bottom: size / 18),
      child: Center(
        child: Text(
          char,
          // style: context.theme.backgroundTextTheme.body
          // ?.copyWith(fontSize: size - size / 2.4, height: 0),
        ),
      ),
    );
  }
}
