// import 'dart:developer';

// import 'package:health/health.dart';

// class SuggestionTextField extends StatefulWidget {
//   const SuggestionTextField({
//     super.key,
//     required this.controller,
//     required this.onSearch,
//     required this.onSelect,
//     required this.onSuggestionBuild,
//     this.suffix,
//     this.prefix,
//     this.onTap,
//     this.inputFormatters,
//     this.hintText,
//     this.readOnly,
//     this.enabled,
//     this.focusNode,
//     this.borderRadius,
//     this.borderFocusColor,
//     this.onSubmit,
//     this.onTapOutSide,
//     this.textAlign,
//     this.style,
//     this.autoFocus,
//     this.onNewItem,
//     this.selected,
//     this.focusBorder,
//     this.enableBorder,
//     required this.order,
//     this.contentPadding,
//     this.decoration,
//     this.overlayBorder,
//     this.overlayBorderRadiuses,
//     this.width,
//   });

//   // this is the controller
//   final TextEditingController controller;

//   // to search and on search show suggestion
//   final Future<List> Function(String text) onSearch;

//   // on selecting the suggestions
//   final Function(dynamic item) onSelect;

// // this is to build and create the suggestions
//   final Widget Function(dynamic a) onSuggestionBuild;

//   // suffix and prefix are for some SVGs inside Textfield.
//   final Widget? suffix, prefix;

//   // autoFocus is fo focus Textfield.
//   final bool? autoFocus;

//   // onTap handel the textField onTap.
//   final Function()? onTap;

//   // inputFormatters is for giving format for TextField.
//   final List<TextInputFormatter>? inputFormatters;

//   // Hint text is for hint.
//   final String? hintText;

//   // readOnly is for creating TextField Jus can Tap not Edit.
//   final bool? readOnly;

//   // enable is for textField enable and disable textEditing textField
//   final bool? enabled;

//   // focusNode is for focusing on request focus.
//   final FocusNode? focusNode;

//   // borderRadiuses is for radiuses of textfield borders
//   final BorderRadius? borderRadius;

//   // This  borderColor is use for changing Color of Border
//   final Color? borderFocusColor;

//   // this is for onSubmit when Enter Key is pressed
//   final Function(String v)? onSubmit;

//   // this is fo handel tap outline of text field
//   final Function(PointerDownEvent event)? onTapOutSide;

//   //to align the textfield alignment
//   final TextAlign? textAlign;

//   //to align the textfield alignment
//   final OutlineInputBorder? focusBorder, enableBorder;

//   final TextStyle? style;

//   final Function()? onNewItem;

//   // selected item is dynamic
//   final dynamic selected;

//   final double order;

//   final EdgeInsets? contentPadding;

//   final InputDecoration? decoration;

//   final Border? overlayBorder;

//   final BorderRadius? overlayBorderRadiuses;

//   final double? width;

//   @override
//   State<SuggestionTextField> createState() => _SuggestionTextFieldState();
// }

// class _SuggestionTextFieldState extends State<SuggestionTextField> {
//   //
//   bool loading = false;
//   List<dynamic> list = [];
//   OverlayEntry? suggestionOverlay;
//   int selectedIndex = 0;

//   showOverlay() {
//     hideOverlay();
//     findSizeAndPosition();
//     assert(suggestionOverlay == null);

//     suggestionOverlay = OverlayEntry(
//       builder: (context) {
//         return _SuggestionOverlayBody(
//           border: widget.overlayBorder,
//           borderRadiuses: widget.overlayBorderRadiuses,
//           itemBuilder: widget.onSuggestionBuild,
//           text: widget.controller.textEmptyNull,
//           list: list,
//           onSelect: (d, i) {
//             _onSelect(d, i);
//             widget.focusNode?.nextFocus();
//             widget.focusNode?.nextFocus();
//             widget.focusNode?.nextFocus();
//             hideOverlay();
//           },
//           left: offset.dx,
//           top: offset.dy + size.height - 1,
//           width: size.width + (widget.width ?? 0),
//           onClose: () {
//             hideOverlay();
//           },
//           onNewItem: () {
//             _onNew();
//           },
//         );
//       },
//     );

//     Overlay.of(context, debugRequiredFor: widget).insert(suggestionOverlay!);
//   }

//   hideOverlay() {
//     suggestionOverlay?.remove();
//     suggestionOverlay?.dispose();
//     suggestionOverlay = null;
//   }

//   GlobalKey suggestionFiledKey = GlobalKey();
//   late Size size;
//   late Offset offset;

//   findSizeAndPosition() {
//     if (suggestionFiledKey.currentContext != null) {
//       final RenderBox renderBox =
//           suggestionFiledKey.currentContext!.findRenderObject() as RenderBox;
//       offset = renderBox.localToGlobal(Offset.zero);
//       size = renderBox.size;
//       if (mounted) setState(() {});
//     }
//   }

//   _onArrowUpOrDown({bool isUp = true}) {
//     var li = list;
//     // var length = li.length;
//     // var lastItem = (length - 1);
//     var lastIndex = (li.lastIndexOf(li.last));

//     if (selectedIndex > (lastIndex)) {
//       selectedIndex = (lastIndex);
//     } else if (selectedIndex < 0) {
//       selectedIndex = 0;
//     }

//     try {
//       widget.onSelect(li[selectedIndex]);
//       if (isUp) {
//         selectedIndex++;
//       } else {
//         selectedIndex--;
//       }
//     } catch (e, s) {
//       loges(e, s);
//     }
//   }

//   _onSelect(dynamic d, int index) {
//     widget.onSelect.call(d);
//     selectedIndex = index;
//   }

//   @override
//   void initState() {
//     WidgetsBinding.instance.addPostFrameCallback((state) {
//       findSizeAndPosition();
//     });

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Actions(
//       actions: {
//         CtrlNIntent: CallbackAction(
//           onInvoke: (intent) => (list.isEmpty && widget.controller.text.isEmpty)
//               ? () {}
//               : _onNew(),
//         )
//       },
//       child: FocusTraversalOrder(
//         order: NumericFocusOrder(widget.order),
//         child: Focus(
//           onKeyEvent: (n, e) {
//             if (e is KeyDownEvent) {
//               if (e.physicalKey == PhysicalKeyboardKey.escape) {
//                 hideOverlay();
//                 return KeyEventResult.handled;
//               }
//               if (e.physicalKey == PhysicalKeyboardKey.tab) {
//                 log('selected: ${widget.selected}');
//                 if (list.isNotEmpty && widget.selected == null) {
//                   _onSelect(list[selectedIndex], selectedIndex);
//                 } else if (widget.selected != null) {
//                   _onSelect(widget.selected, selectedIndex);
//                 }
//                 hideOverlay();
//               }
//               if (e.physicalKey == PhysicalKeyboardKey.arrowUp) {
//                 _onArrowUpOrDown(isUp: false);
//                 hideOverlay();
//                 return KeyEventResult.handled;
//               }
//               if (e.physicalKey == PhysicalKeyboardKey.arrowDown) {
//                 if (list.length == 1) {
//                   _onSelect(list.first, 0);
//                 }
//                 _onArrowUpOrDown(isUp: true);
//                 hideOverlay();
//                 return KeyEventResult.handled;
//               }
//             }
//             return KeyEventResult.ignored;
//           },
//           child: TextField(
//             key: suggestionFiledKey,
//             controller: widget.controller,
//             onChanged: (s) async {
//               setState(() {
//                 selectedIndex = 0;
//                 loading = true;
//               });
//               try {
//                 list = await widget.onSearch.call(s);
//               } catch (e) {
//                 if (context.mounted) {
//                   context.showSnackBar('error: $e');
//                 }
//               }
//               // if (list.isNotEmpty)
//               showOverlay();
//               if (s.isInt && s != "0") {
//                 hideOverlay();
//               }
//               setState(() {
//                 loading = false;
//               });

//               if (s.isEmpty) {
//                 hideOverlay();
//                 list.clear();
//                 widget.onSelect.call(null);
//                 setState(() {
//                   selectedIndex = 0;
//                 });
//               }
//             },
//             focusNode: widget.focusNode,
//             readOnly: widget.readOnly ?? false,
//             enabled: widget.enabled,
//             onTap: widget.onTap,
//             style: widget.style ?? context.theme.textTheme.bodyMedium,
//             onSubmitted: (value) {
//               widget.onSubmit?.call(value);
//               hideOverlay();
//             },
//             onTapOutside: widget.onTapOutSide,
//             autofocus: widget.autoFocus ?? false,
//             textAlign: widget.textAlign ?? TextAlign.start,
//             decoration: widget.decoration ??
//                 InputDecoration(
//                   focusedBorder: widget.focusBorder ??
//                       OutlineInputBorder(
//                           borderRadius: Radiuses.only(),
//                           borderSide: BorderSide(
//                             color: context.colors.primary,
//                             width: 1.5,
//                           )),
//                   enabledBorder: widget.enableBorder ?? InputBorder.none,
//                   hintText: widget.hintText,
//                   suffixIcon: widget.suffix,
//                   prefixIcon: widget.prefix,
//                   hintStyle: context.theme.disabledLightTextTheme.body,
//                   labelStyle: context.theme.disabledTextTheme.labelMedium,
//                   contentPadding: widget.contentPadding ??
//                       Spaces.only(
//                         end: Spaces.mini,
//                         start: Spaces.tiny,
//                         bottom: Spaces.tiny + 1.5,
//                       ),
//                 ),
//           ),
//         ),
//       ),
//     );
//   }

//   void _onNew() {
//     widget.onNewItem?.call();
//     hideOverlay();
//     setState(() {
//       selectedIndex = 0;
//     });
//   }
// }

// class _SuggestionOverlayBody extends StatelessWidget {
//   const _SuggestionOverlayBody({
//     required this.list,
//     required this.onSelect,
//     required this.top,
//     required this.left,
//     required this.width,
//     required this.onClose,
//     required this.onNewItem,
//     required this.itemBuilder,
//     this.text,
//     this.border,
//     this.borderRadiuses,
//   });

//   final List list;
//   final Function(dynamic d, int i) onSelect;
//   final double top, left, width;
//   final Function() onClose;
//   final Function() onNewItem;
//   final Widget Function(dynamic d) itemBuilder;
//   final String? text;

//   final Border? border;

//   final BorderRadius? borderRadiuses;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onClose,
//       child: SizedBox(
//         height: MediaQuery.of(context).size.height,
//         width: MediaQuery.of(context).size.width,
//         child: Align(
//           alignment: AlignmentDirectional.topEnd,
//           child: Material(
//             color: Colors.transparent,
//             child: Stack(children: [
//               Positioned(
//                 top: top,
//                 left: left,
//                 child: AppCard(
//                   width: width,
//                   minHeight: 35,
//                   maxHeight: 300,
//                   color: context.colors.background,
//                   border: border ??
//                       Border.all(color: context.colors.primary, width: 1.5),
//                   borderRadius: borderRadiuses ?? Radiuses.miniCircle,
//                   child: AppCard(
//                       child: SingleChildScrollView(
//                     child: Column(children: [
//                       if (list.isNotEmpty)
//                         ...List.generate(list.length, (i) {
//                           var color = (i % 2 != 1
//                               ? context.colors.surface
//                               : context.colors.background);
//                           return HoverBuilder(builder: (hover) {
//                             return AppCard(
//                               onTap: () {
//                                 onSelect.call(list[i], i);
//                                 onClose.call();
//                               },
//                               color: hover
//                                   ? context.colors.disabledLight.withOpacity(.3)
//                                   : color,
//                               padding: Spaces.tinyAll,
//                               width: double.infinity,
//                               child: itemBuilder(list[i]),
//                             );
//                           });
//                         }),
//                       if (list.isEmpty) _buildNewDrugAction(context),
//                     ]),
//                   )),
//                 ),
//               ),
//             ]),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildNewDrugAction(BuildContext context) {
//     return AppCard(
//       padding: Spaces.only(horizontal: Spaces.mini, vertical: Spaces.tiny),
//       onPressed: onNewItem,
//       child: Row(children: [
//         const SvgIcon(SvgIcons.add_circular_outline, size: 19),
//         Expanded(
//             child: Text(
//           " $text ",
//           style: context.theme.textTheme.bodyMedium,
//           overflow: TextOverflow.ellipsis,
//         )),
//       ]),
//     );
//   }
// }
