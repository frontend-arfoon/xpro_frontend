import 'package:flutter_utils/flutter_utils.dart';

class SideDialogTop extends StatelessWidget {
  const SideDialogTop({
    super.key,
    required this.title,
    required this.icon,
    this.onIconTap,
  });

  final String title;
  final SvgData icon;
  final VoidCallback? onIconTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: const Border.symmetric(),
        color: context.theme.backgroundColor,
      ),
      padding: Spaces.smallTop,
      child: Column(
        children: [
          AppRow(
            children: [
              Spaces.tinyMiniWidth,
              AppCard(
                onTap: onIconTap ?? onIconTap,
                child: SvgIcon(
                  icon,
                  color: context.theme.textColor,
                  size: 18,
                ),
              ),
              Spaces.miniWidth,
              Padding(
                padding: Spaces.only(start: context.isMobile ? 100 : 0),
                child: Text(
                  title.localize(context),
                  style: context.theme.textTheme.bodyMedium,
                ),
              )
            ],
          ),
          Spaces.tinyHeight,
          if (!context.isMobile)
            AppCard(
              color: context.theme.disabledLightColor,
              height: 1,
            ),
        ],
      ),
    );
  }
}
