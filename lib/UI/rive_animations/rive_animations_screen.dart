// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:rive/rive.dart';
//
//
// class RiveAnimationScreen extends StatefulWidget {
//   const RiveAnimationScreen({Key? key}) : super(key: key);
//
//   @override
//   State<RiveAnimationScreen> createState() => _RiveAnimationScreenState();
// }
//
// class _RiveAnimationScreenState extends State<RiveAnimationScreen> {
//   Artboard? riveArtBoard;
//    bool isDance = false;
//   @override
//   void initState() {
//
//     rootBundle.load('assets/test.riv').then((value){
//       try{
//         final file  = RiveFile.import(value);
//         final artBoard = file.mainArtboard;
//         var  controller  = StateMachineController.fromArtboard(artBoard, "bird");
//         if(controller!=null){
//           artBoard.addController(controller);
//           isDance = controller.findSMI('dance');
//         }
//         setState(() {
//           riveArtBoard = artBoard;
//         });
//       }catch(e){
//         print(e);
//       }
//
//
//     });
//     // TODO: implement initState
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: riveArtBoard==null?Container():Column(
//         children: [
//           Flexible(child:  Rive(artboard: riveArtBoard!),),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text("isDance"),
//              // Switch(value: isDance.value, onChanged: (value)=>buildToogleDance(value))
//             ],
//           ),
//
//         ],
//       ),
//     );
//   }
//
//   dynamic buildToogleDance(bool value) {
// // setState(() {
// //   isDance.value = value;
// // });
//   }
// }
