import 'package:exact_pro/x_pro.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
//? locales
  await Locales.init(['en', 'fn', 'ps']); //

  runApp(const MainApp());
}
