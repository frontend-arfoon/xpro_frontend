// import 'package:health/health.dart';
// import 'package:sliver_table/sliver_table.dart';

// class AppSliverTable extends StatelessWidget {
//   const AppSliverTable({
//     super.key,
//     required this.rowCount,
//     required this.columnCount,
//     required this.topHeaderBuilder,
//     required this.rowBuilder,
//     this.cellHeight,
//   });

//   final int rowCount;
//   final int columnCount;
//   final Widget Function(BuildContext, Widget) topHeaderBuilder;
//   final Widget Function(
//     BuildContext context,
//     Widget child,
//     int index,
//     int length,
//   ) rowBuilder;

//   final double? cellHeight;

//   @override
//   Widget build(BuildContext context) {
//     return SliverTable(
//       rowsCount: rowCount,
//       colsCount: columnCount,
//       cellHeight: cellHeight ?? 50,
//       cellBuilder: (context, row, col) {
//         return AppCard(
//           alignment: AlignmentDirectional.center,
//           border: Border.all(),
//           child: const Text("sell builder"),
//         );
//       },
//       topHeaderBuilder: (context, index) {
//         return const Text("Top Header builder");
//       },
//       leftHeaderBuilder: (context, index) {
//         return const AppCard(
//           width: double.infinity,
//           padding: Spaces.smallAll,
//           child: Text("Left Header Builder"),
//         );
//       },
//       topHeaderContainerBuilder: topHeaderBuilder,
//       rowContainerBuilder: (context, child, index, length) {
//         return rowBuilder(context, child, index, length);
//       },
//     );
//   }
// }
