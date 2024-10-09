// import 'package:data_table_2/data_table_2.dart';
// import 'package:health/health.dart';

// class AppTable extends StatelessWidget {
//   const AppTable({
//     Key? key,
//     required this.controller,
//     required this.rows,
//     required this.columns,
//   }) : super(key: key);

//   final ScrollController controller;
//   final List<DataRow2> rows;
//   final List<DataColumn2> columns;

//   @override
//   Widget build(BuildContext context) {
//     return DataTable2(
//       fixedLeftColumns: 0,
//       fixedTopRows: 0,
//       scrollController: controller,
//       dividerThickness: .01,
//       border: TableBorder(
//         verticalInside: BorderSide(
//           width: 0.2,
//           color: context.theme.disabledColor,
//         ),
//       ),
//       headingRowHeight: 40,
//       horizontalMargin: Spaces.xmini,
//       columnSpacing: Spaces.small,
//       headingRowDecoration: BoxDecoration(
//         border: Border.all(
//           width: .2,
//           color: context.theme.disabledColor,
//         ),
//       ),
//       columns: columns,
//       rows: rows,
//     );
//   }
// }
