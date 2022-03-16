
// class AllChoices extends StatelessWidget {
//   const AllChoices({
//     Key? key,
//     required this.screenW,
//     required this.correctAns,
//     this.choices,
//   }) : super(key: key);

//   final double screenW;
//   final correctAns;
//   final choices;

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Column(
//         mainAxisAlignment:
//             screenW <= 600 ? MainAxisAlignment.start : MainAxisAlignment.center,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               Choices(
//                   choice: choices[0],
//                   color: Colors.amber.shade300,
//                   isAnswer: correctAns == 1 ? true : false),
//               Choices(
//                   choice: choices[1],
//                   color: Colors.pink.shade300,
//                   isAnswer: correctAns == 2 ? true : false)
//             ],
//           ),
//           SizedBox(
//             height: screenW <= 600 ? 60 : 20,
//           ),
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               Choices(
//                   choice: choices[2],
//                   color: Colors.purple.shade300,
//                   isAnswer: correctAns == 3 ? true : false),
//               Choices(
//                   choice: choices[3],
//                   color: Colors.deepPurple.shade300,
//                   isAnswer: correctAns == 4 ? true : false)
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// class Picture extends StatelessWidget {
//   const Picture({
//     Key? key,
//     required this.screenW,
//     required this.picUrl,
//   }) : super(key: key);

//   final double screenW;
//   final String picUrl;

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           Container(
//             margin: screenW <= 600
//                 ? const EdgeInsets.only(top: 0)
//                 : const EdgeInsets.only(top: 40),
//             child: Text(
//               "Who's that pokemon?",
//               style: TextStyle(
//                   color: Colors.redAccent, fontSize: screenW <= 600 ? 30 : 24),
//             ),
//           ),
//           Image.network(
//             picUrl,
//             width: screenW <= 600 ? 300 : 199,
//           ),
//         ],
//       ),
//     );
//   }
// }
