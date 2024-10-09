 
// import 'package:device_info_plus/device_info_plus.dart';
// import 'package:exact/app.dart';
// import 'package:exact_server/server.dart';
// import 'package:flutter_udid/flutter_udid.dart';

// class DeviceUtils {
//   static late DeviceData currentHost;
//   static late String? model;
//   static late String? hardware;
//   static late String? version;
//   static String platformName() {
//     if (Platform.isIOS) return 'iOS';
//     if (Platform.isMacOS) return 'MacOs';
//     if (Platform.isWindows) return 'Windows';
//     return 'Android';
//   }

//   static Future init() async {
//     if (Platform.isAndroid) {
//       final info = await DeviceInfoPlugin().androidInfo;
//       model = info.model;
//       hardware = info.hardware;
//     } else if (kIsMacOs) {
//       final info = await DeviceInfoPlugin().macOsInfo;
//       model = info.model;
//       hardware = info.arch;
//     } else if (kIsIos) {
//       final info = await DeviceInfoPlugin().iosInfo;
//       kIsIpod = info.model.contains('ipod');
//       model = info.model;
//       hardware = info.identifierForVendor;
//     }
//     currentHost = await getCurrentHost;
//   }

//   static Future<DeviceData> get getCurrentHost async {
//     String trim(String s) => s
//         .trim()
//         .replaceAll('\n', '')
//         .replaceAll(' ', '')
//         .replaceAll(RegExp('\\s+'), '');

//     try {
//       if (Platform.isWindows) {
//         var res = await AppUtils.run(
//             'wmic csproduct get UUID & echo *#;#* & wmic cpu get ProcessorId & echo *#;#* & wmic baseboard get SerialNumber ');
//         final list = res.split('*#;#*');

//         final uuid = trim(list[0]);
//         final cpu = trim(list[1]);
//         final motherboard = trim(list[2]);
//         return DeviceData(
//           uuid: uuid,
//           cpu: cpu,
//           motherboard: motherboard,
//         );
//       } else {
//         return DeviceData(
//           uuid: await FlutterUdid.udid,
//           cpu: "${platformName()} $model",
//           motherboard: hardware,
//         );
//       }
//     } catch (e) {
//       log('DeviceUtils getcurrentHost: $e');
//       return const DeviceData(
//         uuid: '',
//         cpu: '',
//         motherboard: '',
//       );
//     }
//   }
// }
