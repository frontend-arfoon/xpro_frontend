import 'package:exact_pro/x_pro.dart';
import 'package:flutter_utils/flutter_utils.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 1, title: const Text("Dashboard")),
      body: AppCard(
        width: double.infinity,
        height: double.infinity,
        color: context.colors.background,
        child: const Row(children: [
          Expanded(child: DashBoardSide()),
          Expanded(flex: 6, child: DashBoardBody())
        ]),
      ),
    );
  }
}
