import 'package:exact_pro/views/dashboard/widgets/dashboard_side_actions_bottom.dart';
import 'package:exact_pro/x_pro.dart';
import 'package:flutter_utils/flutter_utils.dart';

class SvgIcons {
  static SvgData obscura = const SvgData("obscure");
  static SvgData arrow = const SvgData("arrow");
  static SvgData circleAdd = const SvgData("circle_add");
  static SvgData exact = const SvgData("exact");
  static SvgData exactPro = const SvgData("exact_pro");
  static SvgData officer = const SvgData("officer");
  static SvgData global = const SvgData("global");
  static SvgData dark = const SvgData("light");
  static SvgData light = const SvgData("dark");
  static SvgData auto = const SvgData("auto");

  static SvgData close = const SvgData("close");
  static SvgData defaultImage = const SvgData("auto");

  static SvgData email = const SvgData("email");
  static SvgData password = const SvgData("password");
  static SvgData accountFill = const SvgData("account_fill");
  static SvgData bankBenefits = const SvgData("bank_benifites");
  static SvgData bank = const SvgData("bank");
  static SvgData company = const SvgData("company");
  static SvgData darkl = const SvgData("darkl");
  static SvgData dashboard = const SvgData("dashboard");
  static SvgData exchange = const SvgData("echange");
  static SvgData homeFill = const SvgData("home_fill");
  static SvgData income = const SvgData("income");
  static SvgData monitor = const SvgData("monitor");
  static SvgData notification = const SvgData("notification");
  static SvgData outgoing = const SvgData("outgoing");
  static SvgData rate = const SvgData("rate");
  static SvgData refreshSvg = const SvgData("refreshsvg");
  static SvgData report = const SvgData("report");
  static SvgData search = const SvgData("search");
  static SvgData setting = const SvgData("setting");
  static SvgData settings = const SvgData("settings");
  static SvgData support = const SvgData("support");
  static SvgData ticket = const SvgData("ticket");
  static SvgData transaction = const SvgData("transaction");
  static SvgData transfer = const SvgData("transfer");
  static SvgData wallet = const SvgData("wallet");
  static SvgData user = const SvgData("user");
  static SvgData withdraw = const SvgData("withdraw");
  static SvgData operations = const SvgData("operations");
  static SvgData collaps = const SvgData("collaps");
  static SvgData plus = const SvgData("plus");

  static SvgData dashboardBottomSideIcons(SideBottomActionType t) {
    switch (t) {
      case SideBottomActionType.changeThem:
        return SvgIcons.darkl;
      case SideBottomActionType.support:
        return SvgIcons.support;
      case SideBottomActionType.settings:
        return SvgIcons.settings;
    }
  }

  static SvgData dashboardSideIcons(SideNavType t) {
    switch (t) {
      case SideNavType.dashboard:
        return SvgIcons.dashboard;
      case SideNavType.operations:
        return SvgIcons.operations;
      case SideNavType.account:
        return SvgIcons.user;
      case SideNavType.monitoring:
        return SvgIcons.monitor;
    }
  }

  static SvgData dashboardTopIcons(TopNavType t) {
    switch (t) {
      case TopNavType.home:
        return SvgIcons.homeFill;
      case TopNavType.report:
        return SvgIcons.report;
    }
  }
}
