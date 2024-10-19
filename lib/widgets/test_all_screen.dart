import 'package:exact_pro/x_pro.dart';
import 'package:flutter_utils/flutter_utils.dart';

class TestAllScreen extends StatelessWidget {
  const TestAllScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("All Screens"), centerTitle: true),
      body: ListView(shrinkWrap: true, children: [
        GotoCart(
          title: 'Login Page',
          child: LoginPage(onLogin: (data) async {
            context.push(const DashboardScreen());
          }),
        ),
        const GotoCart(
          noBack: true,
          title: 'DashbOard Screen',
          child: DashboardScreen(),
        ),
      ]),
    );
  }
}
