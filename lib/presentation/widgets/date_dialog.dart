// import 'package:flutter/material.dart';
//
// import '../theme/theme.dart';
// import 'default_button.dart';
//
// class DateDialog extends StatelessWidget {
//   const DateDialog({Key? key, required this.startDateController, required this.endDateController, required this.dateSubmitFn}) : super(key: key);
//   final TextEditingController startDateController;
//   final TextEditingController endDateController;
//   final VoidCallback dateSubmitFn;
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
//         child: Material(
//           borderRadius: BorderRadius.circular(8),
//           child: Container(
//             padding: const EdgeInsets.all(defaultPadding),
//             decoration: BoxDecoration(
//               color: const Color(0xff273137),
//               borderRadius: BorderRadius.circular(8),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Text(
//                   "Select Dates",
//                   style: Theme.of(context)
//                       .textTheme
//                       .bodyMedium
//                       ?.copyWith(fontSize: 16, fontWeight: FontWeight.w600),
//                 ),
//                 const Divider(
//                   thickness: 2,
//                   height: defaultPadding * 2,
//                 ),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             AppLocalizations.of(context)!.from,
//                             style: Theme.of(context).textTheme.bodyMedium?.copyWith(),
//                           ),
//                           defaultSpacerSmall,
//                           InkWell(
//                             onTap: () async {
//                               DateTime? date = await dateSelect(context);
//                               if (date != null) {
//                                 startDateController.text = date.toString();
//                               }
//                             },
//                             child: TextField(
//                               enabled: false,
//                               controller: startDateController,
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                     defaultSpacerHorizontalSmall,
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             AppLocalizations.of(context)!.to,
//                             style: Theme.of(context).textTheme.bodyMedium?.copyWith(),
//                           ),
//                           defaultSpacerSmall,
//                           InkWell(
//                             onTap: () async {
//                               DateTime? date = await dateSelect(context);
//                               if (date != null) {
//                                 endDateController.text = date.toString();
//                               }
//                             },
//                             child: TextField(
//                               enabled: false,
//                               controller: endDateController,
//                             ),
//                           )
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//                 defaultSpacer,
//                 DefaultButton(
//                   text: AppLocalizations.of(context)!.submit,
//                   isLoading: false,
//                   onPressed: dateSubmitFn,
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//   Future<DateTime?> dateSelect(BuildContext context) async {
//     return await showDatePicker(
//         context: context,
//         initialDate: DateTime.now(),
//         firstDate: DateTime(2000),
//         lastDate: DateTime.now());
//     // DatePickerDialog(initialDate: DateTime.now(), firstDate: DateTime(2000), lastDate: DateTime(2030));
//   }
// }
