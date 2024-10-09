// import 'dart:developer';

// import 'package:health/health.dart';

// class AppSuggestionTextField extends StatefulWidget {
//   const AppSuggestionTextField({
//     required this.onSearch,
//     required this.controller,
//     required this.onSuggestionBuild,
//     super.key,
//     this.validator,
//     this.autoFocus = false,
//     this.obSecureText = false,
//     this.inputFormatters,
//     this.hintText,
//     this.readOnly = false,
//     this.textInputType,
//     this.enabled = true,
//     this.onTap,
//     this.label,
//     this.labelSvg,
//     this.flex,
//     this.focusNode,
//     this.order,
//     this.errorAlignment = AlignmentDirectional.centerEnd,
//     this.hintLabel,
//     this.borderRadius,
//     this.localizeLabel = false,
//     this.prefix,
//     this.suffix,
//     this.endLabel,
//     this.iconColor,
//     this.borderFocusColor,
//     this.capitalization,
//     this.onSubmit,
//     this.labelColor,
//     this.onTapOutSide,
//     this.visible = true,
//     this.canRequestFocus = true,
//     this.maxLength,
//     this.height,
//     this.textAlign,
//     this.maxLine,
//     this.border,
//     this.style,
//     required this.onSelect,
//     this.onNew,
//     this.overlayBorderRadiuses,
//     this.overlayBorder,
//     required this.selected,
//     this.width,
//   });

//   final bool? visible;

//   //this is fo labeSVg color
//   final Color? labelColor;

//   // Label is for TextField labe.
//   final String? label;

//   // suffixSvg is for TexField Label.
//   final SvgData? labelSvg;

//   // endLabel is for end of TextField labe while have any labels like Optional.
//   final Widget? endLabel;

//   // suffix and prefix are for some SVGs inside Textfield.
//   final Widget? suffix, prefix;

//   // localizeLabel is allow or and prevent Localization.
//   final bool localizeLabel;

//   // hintLabel is for the label which is before focus hint and onFocus label
//   final String? hintLabel;

//   // isTextSecure is for secure and ob securing textfield text.
//   final bool obSecureText;

//   // autoFocus is fo focus Textfield.
//   final bool autoFocus;

//   // onTap handel the textField onTap.
//   final Function()? onTap;

//   // validator for validating the TextField.
//   final String? Function(String s)? validator;

//   // onChange is for handel the changing textField
//   final Future<List<dynamic>> Function(String s) onSearch;

//   // controller is fo textEditing Control.
//   final TextEditingController controller;

//   // inputFormatters is for giving format for TextField.
//   final List<TextInputFormatter>? inputFormatters;

//   // Hint text is for hint.
//   final String? hintText;

//   // readOnly is for creating TextField Jus can Tap not Edit.
//   final bool readOnly;

//   // enable is for textField enable and disable textEditing textField
//   final bool enabled;

//   // TextInput type is for keyboard Type when app is running on mobile..
//   // phone just numeric keyboard is shown.
//   final TextInputType? textInputType;

//   // flex is fo expending Textfield.
//   final int? flex, maxLength, maxLine;

//   // focusNode is for focusing on request focus.
//   final FocusNode? focusNode;

//   // order is for controlling the order traversal.
//   final double? order, height;

//   // errorAlignment to customize the error alignment.
//   final AlignmentDirectional? errorAlignment;

//   // borderRadiuses is for radiuses of textfield borders
//   final BorderRadius? borderRadius;

//   // This iconColor is use for giving color to icon
//   final Color? iconColor;

//   // This  borderColor is use for changing Color of Border
//   final Color? borderFocusColor;

//   // this is for capitalize textField
//   final TextCapitalization? capitalization;

//   // this is for onSubmit when Enter Key is pressed
//   final Function(String v)? onSubmit;

//   // this is fo handel tap outline of text field
//   final Function(PointerDownEvent event)? onTapOutSide;

//   // this is for handle focus
//   final bool? canRequestFocus;

//   //to align the textfield alignment
//   final TextAlign? textAlign;

//   //to align the textfield alignment
//   final OutlineInputBorder? border;

//   final TextStyle? style;

//   final Widget Function(dynamic item) onSuggestionBuild;

//   final dynamic Function(dynamic item) onSelect;

//   final Function()? onNew;

//   final BorderRadius? overlayBorderRadiuses;

//   final Border? overlayBorder;

//   final dynamic selected;

//   final double? width;

//   @override
//   State<AppSuggestionTextField> createState() => _AppSuggestionTextFieldState();
// }

// class _AppSuggestionTextFieldState extends State<AppSuggestionTextField> {
//   Color get errorColor => context.colors.negative;
//   Color get foCusColor => widget.borderFocusColor ?? context.theme.primaryColor;

//   @override
//   void dispose() {
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     Widget child = ExpandedWhen(
//       when: widget.flex != null,
//       flex: widget.flex,
//       child: Column(mainAxisSize: MainAxisSize.min, children: [
//         if (widget.visible!)
//           AppCard(
//             child: FormField(
//               enabled: widget.validator != null,
//               autovalidateMode: AutovalidateMode.onUserInteraction,
//               validator: (v) {
//                 return widget.validator?.call(v.toString());
//               },
//               onSaved: (v) {
//                 log('onSaved');
//               },
//               builder: (FormFieldState<String> field) {
//                 return Column(
//                     mainAxisSize: MainAxisSize.min,
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     children: [
//                       if (widget.label != null)
//                         FieldLabel(
//                           label: widget.label!,
//                           localize: widget.localizeLabel,
//                           svg: widget.labelSvg,
//                           color: widget.labelColor,
//                           endLabel: widget.endLabel,
//                         ),
//                       _buildTextField(context, field),
//                       if (field.hasError)
//                         Align(
//                           alignment: widget.errorAlignment!,
//                           child: Text(
//                             field.errorText ?? '',
//                             style: context.theme
//                                 .textThemeOf(errorColor)
//                                 .labelMedium,
//                           ),
//                         ),
//                     ]);
//               },
//             ),
//           ),
//       ]),
//     );

//     if (widget.order != null) {
//       child = FocusTraversalOrder(
//         order: NumericFocusOrder(widget.order!),
//         child: child,
//       );
//     }

//     return child;
//   }

//   Widget _buildTextField(BuildContext context, FormFieldState<String> field) {
//     var enableBorder = OutlineInputBorder(
//       borderSide: BorderSide(
//         width: 1,
//         color: field.hasError
//             ? errorColor.withOpacity(.35)
//             : context.colors.disabledLight,
//       ),
//       borderRadius: widget.borderRadius ?? Radiuses.miniCircle,
//     );

//     var borderColor = field.hasError
//         ? errorColor
//         : (widget.borderFocusColor != null
//             ? foCusColor
//             : widget.enabled
//                 ? widget.borderFocusColor ?? context.colors.primary
//                 : context.theme.disabledLightColor);
//     var focusBorder = OutlineInputBorder(
//       borderSide: BorderSide(width: 1.5, color: borderColor),
//       borderRadius: widget.borderRadius ?? Radiuses.miniCircle,
//     );

//     return AppCard(
//       height: (widget.maxLine != null) ? null : widget.height ?? 37,
//       child: SuggestionTextField(
//         width: widget.width,
//         onSearch: (v) async {
//           setState(() {});
//           // ignore: invalid_use_of_protected_member
//           field.setValue(v);
//           if (field.hasError && v.isNotEmpty) {
//             field.validate();
//           }
//           return await widget.onSearch.call(v);
//         },
//         selected: widget.selected,
//         autoFocus: widget.autoFocus,
//         textAlign: widget.textAlign ?? TextAlign.start,
//         onTap: widget.onTap,
//         focusNode: widget.focusNode,
//         enabled: widget.enabled,
//         inputFormatters: widget.inputFormatters,
//         readOnly: widget.readOnly,
//         controller: widget.controller,
//         style: widget.style ?? context.theme.textTheme.bodyMedium,
//         overlayBorder: widget.overlayBorder,
//         overlayBorderRadiuses: widget.overlayBorderRadiuses,
//         onSubmit: widget.onSubmit ?? (v) {},
//         onSelect: widget.onSelect,
//         onNewItem: widget.onNew,
//         onSuggestionBuild: widget.onSuggestionBuild,
//         order: widget.order ?? 0,
//         decoration: InputDecoration(
//           label: widget.hintLabel == null ? null : Text(widget.hintLabel!),
//           labelStyle: context.theme.disabledTextTheme.labelMedium,
//           hintText: widget.hintText,
//           hintStyle: context.theme.disabledLightTextTheme.body,
//           suffixIcon: widget.suffix,
//           prefixIcon: widget.prefix,
//           contentPadding: Spaces.only(
//             end: Spaces.mini,
//             start: Spaces.tinyMini,
//             vertical: widget.maxLine != null ? Spaces.tiny : 0,
//           ),
//           enabledBorder: widget.border ?? enableBorder,
//           focusedBorder: widget.readOnly ? enableBorder : focusBorder,
//           disabledBorder: enableBorder,
//         ),
//       ),
//     );
//   }
// }
