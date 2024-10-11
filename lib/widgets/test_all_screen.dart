import 'package:exact_pro/widgets/app_divider.dart';
import 'package:exact_pro/x_pro.dart';
import 'package:flutter_utils/flutter_utils.dart';

class TestAllScreen extends StatefulWidget {
  const TestAllScreen({super.key});

  @override
  State<TestAllScreen> createState() => _TestAllScreenState();
}

class _TestAllScreenState extends State<TestAllScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("All Feature Test Screen"), centerTitle: true),
      body: ListView(
        shrinkWrap: true,
        padding: Spaces.tinyAll,
        children: const [
          CircleAvatar(
            maxRadius: 70,
            minRadius: 20,
            child: Text("S", style: TextStyle(fontSize: 70)),
            // backgroundImage: AssetImage("assets/images/me.jpeg"),
          ),
          Spaces.smallHeight,
          AppDivider(),
          Spaces.smallHeight,
          GotoCart(title: 'Login Page', child: LoginPage()),
        ],
      ),
    );
  }
}
