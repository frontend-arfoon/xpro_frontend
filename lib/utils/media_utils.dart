// import 'dart:developer';

// import 'package:file_picker/file_picker.dart';
// import 'package:health/health.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:url_launcher/url_launcher_string.dart';

// class MediaUtils {
//   static Future<String?> pickDirectory() async {
//     String? selectedDirectory = await FilePicker.platform.getDirectoryPath();
//     return selectedDirectory;
//   }

//   static Future<bool> openFile(String filePath) {
//     if (kIsMacOs) {
//       return launchUrl(Uri.parse('file:$filePath'));
//     } else {
//       return launchUrlString('file://$filePath');
//     }
//   }

//   static openFolder(String path) {
//     MediaUtils.openFile(
//       path.splitPath.last.contains('.')
//           ? path.replaceAll(path.splitPath.last, '')
//           : path,
//     );
//   }

//   static pickFile() async {
//     FilePickerResult? result = await FilePicker.platform.pickFiles(
//       allowMultiple: false,
//       type: FileType.any,
//     );

//     if (result != null) {
//       return result.files.single.path;
//     }
//   }

//   Future<void> launchFile(String filePath) async {
//     final fileUri = Uri.file(filePath);
//     if (await canLaunchUrl(fileUri)) {
//       await launchUrl(fileUri);
//     } else {
//       log('Could not open the file: $filePath');
//     }
//   }
// }
