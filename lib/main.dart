import 'package:exact_pro/x_pro.dart';
import 'package:flutter_utils/flutter_utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
//? locales
  await Locales.init(['en', 'fn', 'ps']); //

  runApp(const MainApp());
}
