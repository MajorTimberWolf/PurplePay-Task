// import 'package:flutter/material.dart';
// import 'package:purplepay_task/notifications.dart';
// import 'package:slide_to_act/slide_to_act.dart';

// class SwipePay extends StatelessWidget {
// const SwipePay({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Stack(
//           children: [
//             Positioned(
//               bottom: 24,
//               left: 0,
//               right: 0,
//               child: Padding(
//                 padding: const EdgeInsets.all(12.0),
//                 child: SlideAction(
//                   borderRadius: 12,
//                   elevation: 0,
//                   innerColor: Colors.deepPurple,
//                   outerColor: Colors.deepPurple[300],
//                   sliderButtonIcon: const Icon(
//                     Icons.payment_rounded,
//                     color: Colors.white,
//                   ),
//                   text: 'Slide to Pay',
//                   textStyle: const TextStyle(
//                     color: Colors.white,
//                     fontSize: 24,
//                   ),
//                   onSubmit: createPaymentNotification,
//                 ),
//               ),
//             ),
//           ],
//         ),
//     );
//   }
// }