import 'package:flutter_utils/flutter_utils.dart';

class GotoCart extends StatelessWidget {
  const GotoCart({
    super.key,
    required this.title,
    required this.child,
    this.noBack = false,
  });

  final String title;
  final Widget child;
  final bool noBack;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push(Scaffold(
            appBar: noBack ? null : AppBar(title: Text(title)), body: child));
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
