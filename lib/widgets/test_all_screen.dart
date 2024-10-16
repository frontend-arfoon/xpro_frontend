import 'package:exact_pro/views/dashboard/views/dashboard_screen.dart';
import 'package:exact_pro/x_pro.dart';
import 'package:flutter_utils/flutter_utils.dart';

class TestAllScreen extends StatelessWidget {
  const TestAllScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("All Screens"), centerTitle: true),
      body: ListView(
        shrinkWrap: true,
        children: [
          GotoCart(
            title: 'Login Page',
            child: LoginPage(
              onLogin: (data) {
                context.push(const DashboardScreen());
              },
            ),
          ),
        ],
      ),
    );
  }
}
