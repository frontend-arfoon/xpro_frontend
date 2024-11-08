import 'package:flutter/material.dart';

class ListViewWhen extends StatelessWidget {
  const ListViewWhen({
    super.key,
    required this.children,
    required this.when,
    this.maxHeight,
  });
  final List<Widget> children;
  final bool when;
  final double? maxHeight;

  @override
  Widget build(BuildContext context) {
    Widget child = when
        ? ListView(children: children)
        : Column(
            mainAxisSize: MainAxisSize.min,
            children: children,
          );
    if (when && maxHeight != null) {
      child = Container(
        constraints: BoxConstraints(maxHeight: maxHeight!),
        child: child,
      );
    }
    return child;
  }
}
