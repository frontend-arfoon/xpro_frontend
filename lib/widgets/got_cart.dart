import 'package:flutter_utils/flutter_utils.dart';

class GotoCart extends StatelessWidget {
  const GotoCart({super.key, required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push(Scaffold(appBar: AppBar(title: Text(title)), body: child));
      },
      child: AppCard(
        color: context.colors.primary,
        padding: Spaces.tinyAll,
        margin: Spaces.miniAll,
        borderRadius: Radiuses.miniCircle,
        child: Text(title, style: context.theme.backgroundTextTheme.bodyMedium),
      ),
    );
  }
}
