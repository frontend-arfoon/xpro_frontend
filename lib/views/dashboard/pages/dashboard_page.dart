import 'package:flutter_utils/flutter_utils.dart';

class DashBoardPage extends StatefulWidget {
  const DashBoardPage({super.key});

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: [
          _buildLabels(),
          _buildLabels(),
          _buildLabels(),
          _buildLabels(),
        ]),
        Spaces.tinyHeight,
        Row(children: [
          _buildLabels(),
          _buildLabels(),
          _buildLabels(),
          _buildLabels(),
        ]),
        Spaces.tinyHeight,
        Row(children: [
          _buildLabels(),
          _buildLabels(),
          _buildLabels(),
          _buildLabels(),
        ]),
        Spaces.tinyHeight,
        Row(children: [
          _buildLabels(),
          _buildLabels(),
          _buildLabels(),
          _buildLabels(),
        ]),
        Spaces.tinyHeight,
        Row(children: [
          _buildLabels(),
          _buildLabels(),
          _buildLabels(),
          _buildLabels(),
        ]),
        Spaces.tinyHeight,
        Row(children: [
          _buildLabels(),
          _buildLabels(),
          _buildLabels(),
          _buildLabels(),
        ]),
      ],
    );
  }

  Widget _buildLabels() {
    return Padding(
      padding: Spaces.tinyEnd,
      child: const AppLabelCart(
        child: Column(children: [
          Row(children: [
            Text("Data is this"),
            Text("Data is this"),
            Text("Data is this"),
          ]),
          Row(children: [
            Text("Data is this"),
            Text("Data is this"),
            Text("Data is this"),
            Text("Data is this"),
          ]),
          Row(children: [
            Text("Data is this"),
            Text("Data is this"),
            Text("Data is this"),
            Text("Data is this"),
          ]),
          Row(children: [
            Text("Data is this"),
            Text("Data is this"),
            Text("Data is this"),
            Text("Data is this"),
          ]),
          Row(children: [
            Text("Data is this"),
            Text("Data is this"),
            Text("Data is this"),
            Text("Data is this"),
          ]),
        ]),
      ),
    );
  }
}

class AppLabelCart extends StatelessWidget {
  const AppLabelCart({
    super.key,
    required this.child,
    this.onTap,
    this.color,
    this.borderColor,
  });

  final Widget child;
  final Function()? onTap;
  final Color? color, borderColor;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      color: color ?? context.colors.background,
      onPressed: onTap,
      border: Border.all(color: borderColor ?? context.colors.disabledLight),
      borderRadius: Radiuses.mediumCircle,
      padding: Spaces.tinyMiniAll,
      child: child,
    );
  }
}
