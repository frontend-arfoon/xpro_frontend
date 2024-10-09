// import 'package:flutter/foundation.dart';
// import 'package:health/health.dart';
// import 'package:json_view/json_view.dart';

// class JsonButton extends StatelessWidget {
//   const JsonButton({
//     super.key,
//     required this.map,
//     this.title,
//   });
//   final Map<String, dynamic> Function() map;
//   final String? title;

//   @override
//   Widget build(BuildContext context) {
//     return Visibility(
//       visible: kDebugMode,
//       child: ExcludeFocus(
//         child: AppButton(
//           text: title ?? 'JSON',
//           localize: false,
//           small: true,
//           height: 20,
//           padding: Spaces.zero,
//           color: context.theme.disabledColor,
//           borderColor: context.theme.disabledLightColor,
//           outlined: true,
//           onTap: () async {
//             JsonDataView.show(context, map());
//           },
//         ),
//       ),
//     );
//   }
// }

// class JsonDataView extends StatelessWidget {
//   const JsonDataView({super.key, required this.map});
//   final Map<String, dynamic> map;

//   static show(BuildContext context, Map<String, dynamic> map) {
//     context.dialog(builder: (context) {
//       return context.isDesktop
//           ? SideDialog(
//               body: JsonDataView(map: map),
//             )
//           : AppScaffold(
//               body: JsonDataView(map: map),
//               title: "Json Data",
//               svg: SvgIcons.menu);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return JsonConfig(
//       data: JsonConfigData(
//         gap: 100,
//         style: const JsonStyleScheme(
//           quotation: JsonQuotation.same(""),
//           openAtStart: false,
//           arrow: Icon(Icons.arrow_forward),
//           depth: 2,
//         ),
//         color: const JsonColorScheme(),
//       ),
//       child: JsonView(json: map),
//     );
//   }
// }
