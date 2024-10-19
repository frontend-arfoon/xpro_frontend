import 'package:exact_pro/utils/app_utils/app_utils.dart';
import 'package:exact_pro/x_pro.dart';
import 'package:flutter_utils/flutter_utils.dart';

class NotificationCart extends StatelessWidget {
  const NotificationCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var style = context.theme.textTheme.titleSmall;
    return Column(children: [
      _buildNOtification(context, style),
      Spaces.tinyHeight,
      _buildReminder(context, style),
      Spaces.tinyHeight,
      _buildMessagesBottomCount(context)
    ]);
  }

  AppLabelCart _buildMessagesBottomCount(BuildContext context) {
    var style = context.theme.textTheme.labelMedium;

    return AppLabelCart(
      padding: Spaces.tinyAll,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          children: [
            AppCard(
              padding: Spaces.miniAll,
              borderRadius: Radiuses.smallCircle,
              color: context.colors.primary.withOpacity(.1),
              child: SvgIcon(SvgIcons.transfer),
            ),
            Spaces.tinyWidth,
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              RichText(
                text: TextSpan(
                    text: "Messages ",
                    style: style?.copyWith(
                        color: context.colors.primary,
                        fontWeight: FontWeight.w800,
                        fontSize: 14),
                    children: [
                      TextSpan(text: ". This is message", style: style)
                    ]),
              ),
              Text("content", style: context.theme.textTheme.labelMedium),
            ]),
          ],
        ),
        Text("5", style: context.theme.textTheme.headlineLarge),
      ]),
    );
  }

  AppLabelCart _buildReminder(BuildContext context, TextStyle? style) {
    return AppLabelCart(
      padding: Spaces.miniAll,
      border: Border.all(color: context.colors.disabled.withOpacity(.5)),
      color: context.colors.primary.withOpacity(.1),
      child: Column(children: [
        _buildTitle(context, style, context.colors.text, "Reminder"),
        _buildReminderItem(context,
            content: "Please verify all journal transactions.",
            icon: SvgIcons.arrow),
        _buildReminderItem(context,
            content:
                "Please confirm the exchange rate and verify the transaction details before.",
            icon: SvgIcons.arrow),
        _buildReminderItem(context,
            content:
                "Please confirm the exchange rate and verify the transaction details before.",
            icon: SvgIcons.arrow,
            hasViewAction: false),
      ]),
    );
  }

  AppLabelCart _buildNOtification(BuildContext context, TextStyle? style) {
    return AppLabelCart(
      padding: Spaces.miniAll,
      color: context.colors.primary,
      child: Column(children: [
        _buildTitle(context, style, context.colors.background, "Approval"),
        _buildNotificationItem(
          context,
          content: "this is a notification",
          count: 24,
          icon: SvgIcons.transfer,
        ),
        _buildNotificationItem(
          context,
          content: "this is a notification for you",
          count: 5,
          icon: SvgIcons.accountFill,
        ),
      ]),
    );
  }

  Padding _buildTitle(
      BuildContext context, TextStyle? style, Color? color, String title) {
    return Padding(
      padding: Spaces.only(vertical: Spaces.tiny, horizontal: Spaces.mini),
      child: Row(children: [
        SvgIcon(SvgIcons.pending, color: color),
        Spaces.tinyWidth,
        Text(title, style: style?.copyWith(color: color)),
      ]),
    );
  }

  AppLabelCart _buildReminderItem(BuildContext context,
      {required String content,
      required SvgData icon,
      bool hasViewAction = true}) {
    return AppLabelCart(
      border: Border.all(color: context.colors.primary.withOpacity(.5)),
      margin: Spaces.miniTop,
      color: context.colors.background,
      padding: Spaces.miniAll,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          AppCard(
            padding: Spaces.only(start: Spaces.mini, top: Spaces.tiny),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              AppCard(
                padding: Spaces.tinyAll,
                margin: Spaces.only(top: Spaces.xmini),
                width: 15,
                height: 15,
                border: Border.all(color: context.colors.disabledLight),
                borderRadius: Radiuses.circle,
              ),
              Spaces.tinyWidth,
              Expanded(
                child: Text(content,
                    style: context.theme.textTheme.bodyLarge, softWrap: true),
              ),
            ]),
          ),
          AppCard(
            margin: Spaces.miniTop,
            padding: Spaces.mediumStart,
            child: Text(DateTime.now().hourMinuteAString,
                style: context.theme.disabledTextTheme.labelSmall),
          ),
          if (hasViewAction)
            AppCard(
              margin: Spaces.only(all: Spaces.tiny, start: Spaces.medium),
              padding: Spaces.tinyAll,
              borderRadius: Radiuses.smallCircle,
              border: Border.all(color: context.colors.primary.withOpacity(.2)),
              child: Row(mainAxisSize: MainAxisSize.min, children: [
                SvgIcon(SvgIcons.transaction, size: 16),
                Spaces.tinyWidth,
                const Text("View Transactions")
              ]),
            ),
        ],
      ),
    );
  }

  AppLabelCart _buildNotificationItem(
    BuildContext context, {
    required int count,
    required String content,
    required SvgData icon,
  }) {
    return AppLabelCart(
      margin: Spaces.miniTop,
      color: context.colors.background,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(count.toString(), style: context.theme.textTheme.titleLarge),
          Text(content, style: context.theme.textTheme.labelMedium),
        ]),
        SvgIcon(icon)
      ]),
    );
  }
}
