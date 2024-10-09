import 'package:exact_pro/x_pro.dart';

class AppColor extends Color {
  AppColor of(BuildContext context) {
    return copyWith(isDark: context.theme.isDarkMode);
  }

  final int? id;
  final int dark;
  final int light;
  final bool isDark;
  final String name;

  const AppColor({
    this.id,
    required this.light,
    required this.dark,
    this.isDark = false,
    required this.name,
  }) : super(isDark ? dark : light);

  AppColor copyWith({
    int? dark,
    int? light,
    bool? isDark,
    String? name,
    int? id,
  }) {
    return AppColor(
      id: id ?? this.id,
      dark: dark ?? this.dark,
      light: light ?? this.light,
      isDark: isDark ?? this.isDark,
      name: name ?? this.name,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AppColor &&
        other.dark == dark &&
        other.light == light &&
        other.isDark == isDark &&
        other.name == name;
  }

  @override
  int get hashCode => dark.hashCode ^ light.hashCode ^ isDark.hashCode;
}
