import 'package:exact_pro/x_pro.dart';
import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    super.key,
    this.top,
    required this.child,
    this.height,
    this.width,
    required this.direction,
    this.fractionalOffset,
  });

  final Widget? top;
  final Widget child;
  final double? height;
  final double? width;
  final AlignmentDirectional direction;
  final FractionalOffset? fractionalOffset;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: fractionalOffset ?? direction,
      child: Material(
        color: Colors.transparent,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            XPCard(
              color: Colors.transparent,
              height: height,
              width: width,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (top != null) top!,
                  // ExpandedWhen(
                  //   when: top != null && height != null,
                  //   child: child,
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
