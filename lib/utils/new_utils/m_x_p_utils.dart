import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:exact_pro/x_pro.dart';

class MXPUtils {
  static bool isValidEmail(String email) {
    return RegExp(r'^[\w-]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  static bool isValidPhoneNumber(String phoneNumber) {
    final RegExp phoneRegex = RegExp(
        r'^\+?(\d{1,3})?[-.\s]?\(?\d{1,4}\)?[-.\s]?\d{1,4}[-.\s]?\d{1,9}$');
    return phoneRegex.hasMatch(phoneNumber);
  }

  // String formatDate(DateTime date) {
  //   return DateFormat('yyyy-MM-dd').format(date);
  // }

  static double roundToTwoDecimals(double number) {
    return double.parse(number.toStringAsFixed(2));
  }

  static Widget verticalSpacing(double height) {
    return SizedBox(height: height);
  }

  static Future<void> fetchData() async {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  static Color hexToColor(String hexCode) {
    final hex = hexCode.replaceAll('#', '');
    return Color(int.parse('FF$hex', radix: 16));
  }

  static void goTo(BuildContext context, Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
  }

  static String formatPrice(double price, String sign) {
    return '$sign ${price.toStringAsFixed(2)}';
  }

  static bool isValidDiscountCode(String code) {
    return code.length == 8; // Example: All codes should be 8 characters
  }
}
