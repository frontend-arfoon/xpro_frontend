// import 'package:health/health.dart';

// class SureDialog extends StatefulWidget {
//   const SureDialog({
//     super.key,
//     required this.title,
//     required this.conformPassword,
//     this.subtitle,
//     this.svg,
//   });

//   final String title;
//   final String? subtitle;
//   final bool conformPassword;
//   final SvgData? svg;

//   static Future<bool> show(
//     BuildContext context, {
//     required String title,
//     required String subtitle,
//     required bool conformPassword,
//     required SvgData svg,
//   }) async {
//     var res = await context.dialog(
//       builder: (context) {
//         return SureDialog(
//           title: title,
//           subtitle: subtitle,
//           conformPassword: conformPassword,
//           svg: svg,
//         );
//       },
//     );

//     bool sure = res == true;
//     if (sure && conformPassword) {
//       var res = await LoginWidget.show(context,
//           initialUser: context.user, confirm: true);
//       sure = res != null;
//     }
//     return sure;
//   }

//   @override
//   State<SureDialog> createState() => _SureDialogState();
// }

// class _SureDialogState extends State<SureDialog> {
//   @override
//   Widget build(BuildContext context) {
//     return CenterDialog(
//         child: AppCard(
//       color: context.theme.backgroundColor,
//       borderRadius: Radiuses.smallCircle,
//       padding: Spaces.only(all: Spaces.small),
//       width: context.isDesktop ? 280 : 300,
//       child: Actions(
//         actions: {
//           EnterIntent: CallbackAction(onInvoke: (intent) => onConfirm())
//         },
//         child: FocusScope(
//           autofocus: true,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Column(children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const SizedBox(width: 20),
//                     if (widget.svg != null)
//                       SvgIcon(widget.svg!,
//                           color: context.theme.negativeColor, size: 60),
//                     const AppCloseDialogAction(),
//                   ],
//                 ),
//                 Text(widget.title, style: context.theme.textTheme.titleMedium),
//                 Spaces.tinyHeight,
//                 Text(
//                   widget.subtitle ?? "",
//                   style: context.theme.disabledTextTheme.bodyMedium,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//               ]),
//               Spaces.smallHeight,
//               const AppDivider(),
//               Spaces.smallHeight,
//               Row(children: [
//                 Expanded(
//                   child: AppButton(
//                     onTap: () {
//                       context.popIfCan();
//                     },
//                     text: "Cancel",
//                     height: 35,
//                     outlined: true,
//                     color: context.colors.disabled,
//                     borderColor: context.colors.disabledLight,
//                     textColor: context.colors.disabled,
//                     textHoverColor: context.colors.background,
//                   ),
//                 ),
//                 Spaces.tinyWidth,
//                 Expanded(
//                   child: AppButton(
//                     height: 35,
//                     text: "delete",
//                     onTap: onConfirm,
//                     color: context.colors.negative,
//                   ),
//                 )
//               ])
//             ],
//           ),
//         ),
//       ),
//     ));
//   }

//   onConfirm() {
//     context.popIfCan(true);
//   }
// }
