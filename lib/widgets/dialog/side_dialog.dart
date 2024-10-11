import 'package:flutter_utils/flutter_utils.dart';

class SideDialog extends StatelessWidget {
  const SideDialog({
    super.key,
    required this.body,
    this.showBack = true,
    this.top,
    this.width = 450,
  });
  final bool showBack;
  final Widget body;
  final Widget? top;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: Material(
        color: Colors.transparent,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: width,
              color: context.theme.backgroundColor,
              child: Column(
                children: [
                  if (top != null) top!,
                  Expanded(child: body),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
