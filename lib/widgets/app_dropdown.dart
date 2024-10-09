// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:exact_pro/widgets/focus_builder.dart';
import 'package:exact_pro/x_pro.dart';
import 'package:flutter/services.dart';

class DropDownData {
  DropDownData({
    required this.label,
    this.value,
    this.color,
    this.svg,
    this.localizeLabel = true,
  });

  final String label;
  final bool localizeLabel;
  final int? value;
  final Color? color;
  final SvgData? svg;

  @override
  bool operator ==(covariant DropDownData other) {
    if (identical(this, other)) return true;

    return other.label == label &&
        other.value == value &&
        other.color == color &&
        other.svg == svg;
  }

  @override
  int get hashCode {
    return label.hashCode ^ value.hashCode ^ color.hashCode ^ svg.hashCode;
  }
}

class AppDropdown extends StatefulWidget {
  const AppDropdown({
    super.key,
    required this.list,
    required this.onChange,
    required this.selected,
    this.order = 0,
    this.width,
    this.height,
    this.background,
    this.arrowColor,
    this.focusArrowColor,
    this.firstLatterColor,
    this.focusBackground,
    this.borderRadius,
    this.selectedColor,
    this.capitalize = true,
    this.selectedTextColor,
  });
  final List<DropDownData> list;
  final Function(DropDownData) onChange;
  final DropDownData selected;
  final double? order;
  final double? width;
  final double? height;
  final Color? background,
      focusBackground,
      firstLatterColor,
      arrowColor,
      focusArrowColor,
      selectedColor;
  final BorderRadius? borderRadius;
  final bool capitalize;
  final Color? selectedTextColor;

  @override
  State<AppDropdown> createState() => _AppDropdownState();
}

class _AppDropdownState extends State<AppDropdown> {
  //
  _select({bool next = true}) {
    var list = widget.list;
    var select = widget.selected;
    var indexOfSelect = list.indexOf(select);
    log('indexOfSelect: $indexOfSelect');
    var length = list.length;
    var i = indexOfSelect + (next ? 1 : -1);
    if (i > (length - 1) || i < 0) return;
    widget.onChange(list.firstWhere((e) => e == list[i]));
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FocusTraversalOrder(
      order: NumericFocusOrder(widget.order!),
      child: FocusBuilder(
        onFocusChange: (context, focus) {
          if (focus) {}
        },
        onKey: (node, event) {
          if (event is RawKeyDownEvent) {
            if (event.physicalKey == PhysicalKeyboardKey.arrowUp) {
              _select(next: false);
              return KeyEventResult.handled;
            } else if (event.physicalKey == PhysicalKeyboardKey.arrowDown) {
              _select(next: true);
              return KeyEventResult.handled;
            }
          }
          return KeyEventResult.ignored;
        },
        builder: (isFocused) {
          return ExcludeFocus(
            child: PopupMenuButton<DropDownData>(
              initialValue: widget.selected,
              enabled: true,
              position: PopupMenuPosition.over,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radiuses.smallRadius),
                side: BorderSide(
                  width: 1,
                  color: context.colors.disabledLight,
                ),
              ),
              constraints: BoxConstraints(
                minWidth: widget.width ?? 140,
                maxWidth: widget.width ?? 140,
              ),
              color: context.theme.backgroundColor,
              elevation: 0,
              itemBuilder: (context) {
                return widget.list.map<PopupMenuItem<DropDownData>>((e) {
                  return _buildPopupMenuItem(e);
                }).toList();
              },
              onSelected: (v) {
                setState(() {
                  widget.onChange(v);
                });
              },
              padding: Spaces.zero,
              child: _buildButton(context, isFocused),
            ),
          );
        },
      ),
    );
  }

  Widget _buildButton(BuildContext context, bool isFocused) {
    Widget text = RichText(
      text: TextSpan(
        text: widget.firstLatterColor != null
            ? ''
            : widget.capitalize
                ? widget.selected.label
                : widget.selected.label,
        style: isFocused
            ? context.theme
                .textThemeOf(widget.selected.color ?? context.colors.primary)
                .labelLarge
            : context.theme
                .textThemeOf(
                    widget.selectedTextColor ?? context.theme.backgroundColor)
                .labelLarge,
        children: [
          if (widget.firstLatterColor != null)
            TextSpan(
              text: widget.selected.label[0],
              style: TextStyle(
                color: widget.firstLatterColor,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          if (widget.firstLatterColor != null)
            TextSpan(
              text: widget.selected.label.substring(
                1,
                widget.selected.label.length,
              ),
              style: TextStyle(
                color: isFocused
                    ? widget.selectedColor
                    : context.theme.backgroundColor,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
        ],
      ),
    );

    return XPCard(
      color: !isFocused ? widget.background : context.theme.backgroundColor,
      padding: Spaces.tinyAll.copyWith(top: Spaces.xmini, bottom: Spaces.xmini),
      height: widget.height ?? 40,
      width: widget.width ?? 140,
      border: Border.all(
        width: 1.5,
        color: widget.background ?? context.colors.primary,
      ),
      borderRadius: widget.borderRadius ?? Radiuses.miniCircle,
      alignment: AlignmentDirectional.centerStart,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          children: [
            if (widget.selected.svg != null)
              SvgIcon(
                widget.selected.svg ?? SvgIcons.circleAdd,
                color: isFocused
                    ? widget.selected.color
                    : context.theme.backgroundColor,
                size: 18,
              ),
            Spaces.miniWidth,
            text,
          ],
        ),
        SvgIcon(
          SvgIcons.arrow,
          size: 16,
          color: isFocused && widget.firstLatterColor != null
              ? context.theme.primaryColor
              : widget.firstLatterColor != null
                  ? context.theme.backgroundColor
                  : isFocused
                      ? widget.selected.color
                      : widget.arrowColor ?? context.theme.backgroundColor,
        )
      ]),
    );
  }

  PopupMenuItem<DropDownData> _buildPopupMenuItem(DropDownData data) {
    bool selected = widget.selected == data;
    var color = selected ? context.colors.background : data.color;

    return PopupMenuItem<DropDownData>(
      height: 40,
      textStyle: context.theme.textTheme.bodyMedium,
      value: data,
      padding: Spaces.zero,
      child: Container(
        color: !selected
            ? Colors.transparent
            : data.color ?? context.theme.primaryColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 37,
              width: 4,
              color: !selected
                  ? Colors.transparent
                  : data.color ?? context.theme.primaryColor,
              margin: Spaces.tinyEnd,
            ),
            if (data.svg != null)
              SvgIcon(
                data.svg!,
                color: color,
                size: 18,
                margin: Spaces.tinyEnd,
              ),
            RichText(
              text: TextSpan(
                text: widget.firstLatterColor == null
                    ? widget.capitalize
                        ? data.label
                        : data.label
                    : data.label.substring(0, 1),
                style: widget.firstLatterColor == null
                    ? context.theme
                        .textThemeOf(color ?? context.theme.textColor)
                        .bodySmall
                    : context.theme
                        .textThemeOf(context.colors.warning)
                        .bodyMedium,
                children: [
                  if (widget.firstLatterColor != null)
                    TextSpan(
                      text: data.label.substring(1),
                      style: context.theme.textThemeOf(color).bodyMedium,
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
