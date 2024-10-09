// import 'package:health/health.dart';
// import 'package:system_server/services/api_service/api_filter.dart';

// class SearchTextField extends StatefulWidget {
//   const SearchTextField({
//     super.key,
//     this.filter,
//     required this.onChange,
//     required this.onSubmit,
//     required this.onClearText,
//     required this.focusNode,
//     this.suffix,
//     this.flex,
//     this.autoFocus,
//     required this.onTapOut,
//   });

//   final Function(String s) onChange, onSubmit, onClearText;
//   final ApiFilter? filter;
//   final FocusNode focusNode;
//   final Widget? suffix;
//   final int? flex;
//   final bool? autoFocus;
//   final Function() onTapOut;

//   @override
//   State<SearchTextField> createState() => _SearchTextFieldState();
// }

// class _SearchTextFieldState extends State<SearchTextField> {
//   final TextEditingController _controller = TextEditingController();
//   bool toggleSuffix = false;

//   @override
//   Widget build(BuildContext context) {
//     return ExpandedWhen(
//       when: context.isMobile,
//       child: SizedBox(
//         width: context.isDesktop ? 300 : double.infinity,
//         child: FocusBuilder(
//           onFocusChange: (context, f) {
//             if (f) {
//               setState(() {
//                 toggleSuffix = true;
//               });
//             } else {
//               setState(() {
//                 toggleSuffix = false;
//               });
//             }
//           },
//           builder: (f) {
//             return AppTextField(
//               flex: widget.flex,
//               controller: _controller,
//               onChanged: (v) {
//                 widget.onChange.call(v);
//                 setState(() {
//                   toggleSuffix = true;
//                 });
//               },
//               focusNode: widget.focusNode,
//               onSubmit: (v) {
//                 widget.onSubmit.call(v);
//                 widget.focusNode.requestFocus();
//               },
//               onTapOutSide: (e) {
//                 widget.focusNode.unfocus();
//                 setState(() {
//                   if (_controller.text.isEmpty) {
//                     toggleSuffix = false;
//                   }
//                 });
//                 widget.onTapOut;
//               },
//               autoFocus: false,
//               hintText: 'search'.localize(context),
//               suffix: widget.suffix ?? _buildFillterSuffix(context),
//             );
//           },
//         ),
//       ),
//     );
//   }

//   Widget _buildFillterSuffix(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.end,
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         if (toggleSuffix && _controller.text.isNotEmpty)
//           AppCard(
//             onTap: () {
//               setState(() {
//                 _controller.text = '';
//               });
//               widget.onClearText('');
//             },
//             borderRadius: Radiuses.only(
//               right: const Radius.circular(3),
//             ),
//             child: SvgIcon(
//               SvgIcons.close,
//               color: context.theme.disabledColor,
//               size: 18,
//             ),
//           ),
//         Spaces.miniWidth,
//         ExcludeFocus(
//           child: AppCard(
//             width: 40,
//             height: double.infinity,
//             onTap: () {
//               if (_controller.text.isNotEmpty) {
//                 widget.onSubmit.call(_controller.text);
//               }
//               return;
//             },
//             margin: Spaces.only(all: 1.5),
//             borderRadius: Radiuses.only(
//               right: const Radius.circular(3),
//             ),
//             color: toggleSuffix
//                 ? context.theme.primaryColor
//                 : context.colors.background,
//             child: SvgIcon(
//               SvgIcons.search,
//               color: toggleSuffix
//                   ? context.theme.backgroundColor
//                   : context.theme.disabledColor,
//               size: 20,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
