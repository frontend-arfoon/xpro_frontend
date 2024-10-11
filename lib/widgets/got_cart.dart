import 'package:flutter_utils/flutter_utils.dart';

class GotoCart extends StatelessWidget {
  const GotoCart({super.key, required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push(Scaffold(
          body: Container(
            margin: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12), topRight: Radius.circular(12)),
            ),
            child: child,
          ),
        ));
      },
      child: Container(
        margin: const EdgeInsets.all(2),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: const BorderRadius.all(Radius.circular(8))),
        child: Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 14),
        ),
      ),
    );
  }
}
