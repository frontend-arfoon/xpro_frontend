import 'package:flutter_utils/flutter_utils.dart';

class RateCart extends StatelessWidget {
  const RateCart({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(shrinkWrap: true, children: [
      ...List.generate(5, (i) {
        var color = (i % 2 != 0
            ? context.colors.background
            : context.colors.warning.withOpacity(.1));
        return _buildRateItem(context, color);
      }),
    ]);
  }

  Widget _buildRateItem(BuildContext context, Color color) {
    var style = context.theme.textThemeOf(context.colors.text).bodyLarge;

    return AppCard(
      onPressed: () {},
      color: color,
      padding: Spaces.tinyAll,
      borderRadius: const BorderRadius.only(),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text("AFN", style: style),
        Text(2000.toDouble().fix4Points.commaAmount, style: style),
      ]),
    );
  }
}
