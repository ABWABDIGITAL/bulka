// import 'dart:async';
// import 'dart:io';

// import 'package:bulka/core/assets/asset_lottie.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_vibrate/flutter_vibrate.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:lottie/lottie.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:record/record.dart';

// class RecordButton extends StatefulWidget {
//   const RecordButton({super.key});

//   @override
//   State<RecordButton> createState() => _RecordButtonState();
// }

// class _RecordButtonState extends State<RecordButton>
//     with SingleTickerProviderStateMixin {
//   static const double size = 55;

//   final double lockerHeight = 200;
//   double timerWidth = 0;

//   late Animation<double> buttonScaleAnimation;
//   late Animation<double> timerAnimation;
//   late Animation<double> lockerAnimation;
//   late AnimationController controller;

//   DateTime? startTime;
//   Timer? timer;
//   String recordDuration = "00:00";
//   late Record record;

//   bool isLocked = false;
//   bool showLottie = false;

//   @override
//   void initState() {
//     super.initState();
//     controller = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 600),
//     );
//     buttonScaleAnimation = Tween<double>(begin: 1, end: 2).animate(
//       CurvedAnimation(
//         parent: controller,
//         curve: const Interval(0.0, 0.6, curve: Curves.elasticInOut),
//       ),
//     );
//     controller.addListener(() {
//       setState(() {});
//     });
//   }

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     timerWidth =
//         MediaQuery.of(context).size.width - 2 * Globals.defaultPadding - 4;
//     timerAnimation =
//         Tween<double>(begin: timerWidth + Globals.defaultPadding, end: 0)
//             .animate(
//       CurvedAnimation(
//         parent: controller,
//         curve: const Interval(0.2, 1, curve: Curves.easeIn),
//       ),
//     );
//     lockerAnimation =
//         Tween<double>(begin: lockerHeight + Globals.defaultPadding, end: 0)
//             .animate(
//       CurvedAnimation(
//         parent: controller,
//         curve: const Interval(0.2, 1, curve: Curves.easeIn),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     record.dispose();
//     timer?.cancel();
//     timer = null;
//     controller.dispose();

//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       clipBehavior: Clip.none,
//       children: [
//         lockSlider(),
//         cancelSlider(),
//         audioButton(),
//         if (isLocked) timerLocked(),
//       ],
//     );
//   }

//   Widget lockSlider() {
//     return Positioned(
//       bottom: -lockerAnimation.value,
//       child: Container(
//         height: lockerHeight,
//         width: size,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(Globals.borderRadius),
//           color: Colors.black,
//         ),
//         padding: const EdgeInsets.symmetric(vertical: 15),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             const FaIcon(FontAwesomeIcons.lock, size: 20),
//             const SizedBox(height: 8),
//             FlowShader(
//               direction: Axis.vertical,
//               child: Column(
//                 children: const [
//                   Icon(Icons.keyboard_arrow_up),
//                   Icon(Icons.keyboard_arrow_up),
//                   Icon(Icons.keyboard_arrow_up),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget cancelSlider() {
//     return Positioned(
//       right: -timerAnimation.value,
//       child: Container(
//         height: size,
//         width: timerWidth,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(Globals.borderRadius),
//           color: Colors.black,
//         ),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 15),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             mainAxisSize: MainAxisSize.max,
//             children: [
//               showLottie ? const LottieAnimation() : Text(recordDuration),
//               const SizedBox(width: size),
//               FlowShader(
//                 child: Row(
//                   children: const [
//                     Icon(Icons.keyboard_arrow_left),
//                     Text("Slide to cancel")
//                   ],
//                 ),
//                 duration: const Duration(seconds: 3),
//                 flowColors: const [Colors.white, Colors.grey],
//               ),
//               const SizedBox(width: size),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget timerLocked() {
//     return Positioned(
//       right: 0,
//       child: Container(
//         height: size,
//         width: timerWidth,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(Globals.borderRadius),
//           color: Colors.black,
//         ),
//         child: Padding(
//           padding: const EdgeInsets.only(left: 15, right: 25),
//           child: GestureDetector(
//             behavior: HitTestBehavior.opaque,
//             onTap: () async {
//               Vibrate.feedback(FeedbackType.success);
//               timer?.cancel();
//               timer = null;
//               startTime = null;
//               recordDuration = "00:00";

//               var filePath = await Record().stop();
//               AudioState.files.add(filePath!);
//               Globals.audioListKey.currentState!
//                   .insertItem(AudioState.files.length - 1);
//               debugPrint(filePath);
//               setState(() {
//                 isLocked = false;
//               });
//             },
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               mainAxisSize: MainAxisSize.max,
//               children: [
//                 Text(recordDuration),
//                 FlowShader(
//                   child: const Text("Tap lock to stop"),
//                   duration: const Duration(seconds: 3),
//                   flowColors: const [Colors.white, Colors.grey],
//                 ),
//                 const Center(
//                   child: FaIcon(
//                     FontAwesomeIcons.lock,
//                     size: 18,
//                     color: Colors.green,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget audioButton() {
//     return GestureDetector(
//       child: Transform.scale(
//         scale: buttonScaleAnimation.value,
//         child: Container(
//           child: const Icon(Icons.mic),
//           height: size,
//           width: size,
//           clipBehavior: Clip.hardEdge,
//           decoration: BoxDecoration(
//             shape: BoxShape.circle,
//             color: Theme.of(context).primaryColor,
//           ),
//         ),
//       ),
//       onLongPressDown: (_) {
//         debugPrint("onLongPressDown");
//         controller.forward();
//       },
//       onLongPressEnd: (details) async {
//         debugPrint("onLongPressEnd");

//         if (isCancelled(details.localPosition, context)) {
//           Vibrate.feedback(FeedbackType.heavy);

//           timer?.cancel();
//           timer = null;
//           startTime = null;
//           recordDuration = "00:00";

//           setState(() {
//             showLottie = true;
//           });

//           Timer(const Duration(milliseconds: 1440), () async {
//             controller.reverse();
//             debugPrint("Cancelled recording");
//             var filePath = await record.stop();
//             debugPrint(filePath);
//             File(filePath!).delete();
//             debugPrint("Deleted $filePath");
//             showLottie = false;
//           });
//         } else if (checkIsLocked(details.localPosition)) {
//           controller.reverse();

//           Vibrate.feedback(FeedbackType.heavy);
//           debugPrint("Locked recording");
//           debugPrint(details.localPosition.dy.toString());
//           setState(() {
//             isLocked = true;
//           });
//         } else {
//           controller.reverse();

//           Vibrate.feedback(FeedbackType.success);

//           timer?.cancel();
//           timer = null;
//           startTime = null;
//           recordDuration = "00:00";

//           var filePath = await Record().stop();
//           AudioState.files.add(filePath!);
//           Globals.audioListKey.currentState!
//               .insertItem(AudioState.files.length - 1);
//           debugPrint(filePath);
//         }
//       },
//       onLongPressCancel: () {
//         debugPrint("onLongPressCancel");
//         controller.reverse();
//       },
//       onLongPress: () async {
//         debugPrint("onLongPress");
//         Vibrate.feedback(FeedbackType.success);
//         if (await Record().hasPermission()) {
//           record = Record();
//           await record.start(
//             path:
//                 "${Globals.documentPath}audio_${DateTime.now().millisecondsSinceEpoch}.m4a",
//             encoder: AudioEncoder.AAC,
//             bitRate: 128000,
//             samplingRate: 44100,
//           );
//           startTime = DateTime.now();
//           timer = Timer.periodic(const Duration(seconds: 1), (_) {
//             final minDur = DateTime.now().difference(startTime!).inMinutes;
//             final secDur = DateTime.now().difference(startTime!).inSeconds % 60;
//             String min = minDur < 10 ? "0$minDur" : minDur.toString();
//             String sec = secDur < 10 ? "0$secDur" : secDur.toString();
//             setState(() {
//               recordDuration = "$min:$sec";
//             });
//           });
//         }
//       },
//     );
//   }

//   bool checkIsLocked(Offset offset) {
//     return (offset.dy < -35);
//   }

//   bool isCancelled(Offset offset, BuildContext context) {
//     return (offset.dx < -(MediaQuery.of(context).size.width * 0.2));
//   }
// }

// class Globals {
//   Globals._();

//   static init() async {
//     documentPath = "${(await getApplicationDocumentsDirectory()).path}/";
//   }

//   static const double borderRadius = 27;
//   static const double defaultPadding = 8;
//   static String documentPath = '';
//   static GlobalKey<AnimatedListState> audioListKey =
//       GlobalKey<AnimatedListState>();
// }

// /// Choosing this method because using proper state management would be an
// /// overkill for the scope of this project.
// class AudioState {
//   AudioState._();
//   static List<String> files = [];
// }

// class FlowShader extends StatefulWidget {
//   const FlowShader({
//     super.key,
//     required this.child,
//     this.duration = const Duration(seconds: 2),
//     this.direction = Axis.horizontal,
//     this.flowColors = const <Color>[Colors.white, Colors.black],
//   }) : assert(flowColors.length == 2);

//   final Widget child;
//   final Axis direction;
//   final Duration duration;
//   final List<Color> flowColors;

//   @override
//   _FlowShaderState createState() => _FlowShaderState();
// }

// class _FlowShaderState extends State<FlowShader>
//     with SingleTickerProviderStateMixin {
//   late AnimationController controller;
//   late Animation animation1;
//   late Animation animation2;
//   late Animation animation3;

//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }

//   @override
//   void initState() {
//     super.initState();
//     controller = AnimationController(
//       vsync: this,
//       duration: widget.duration,
//     );
//     final TweenSequenceItem seqbw = TweenSequenceItem(
//       tween: ColorTween(
//         begin: widget.flowColors.last,
//         end: widget.flowColors.first,
//       ),
//       weight: 1,
//     );
//     final TweenSequenceItem seqwb = TweenSequenceItem(
//       tween: ColorTween(
//         begin: widget.flowColors.first,
//         end: widget.flowColors.last,
//       ),
//       weight: 1,
//     );
//     animation1 = TweenSequence([seqbw, seqwb]).animate(
//       CurvedAnimation(
//         parent: controller,
//         curve: const Interval(0.0, 0.45, curve: Curves.linear),
//       ),
//     );
//     animation2 = TweenSequence([seqbw, seqwb]).animate(
//       CurvedAnimation(
//         parent: controller,
//         curve: const Interval(0.15, 0.75, curve: Curves.linear),
//       ),
//     );
//     animation3 = TweenSequence([seqbw, seqwb]).animate(
//       CurvedAnimation(
//         parent: controller,
//         curve: const Interval(0.45, 1, curve: Curves.linear),
//       ),
//     );
//     controller.repeat();
//     controller.addListener(() {
//       setState(() {});
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ShaderMask(
//       shaderCallback: (rect) {
//         return LinearGradient(
//           colors: [
//             animation3.value,
//             animation2.value,
//             animation1.value,
//           ],
//           begin: widget.direction == Axis.horizontal
//               ? Alignment.centerLeft
//               : Alignment.topCenter,
//           end: widget.direction == Axis.horizontal
//               ? Alignment.centerRight
//               : Alignment.bottomCenter,
//         ).createShader(rect);
//       },
//       child: widget.child,
//     );
//   }
// }

// class LottieAnimation extends StatefulWidget {
//   const LottieAnimation({super.key});

//   @override
//   State<LottieAnimation> createState() => _LottieAnimationState();
// }

// class _LottieAnimationState extends State<LottieAnimation>
//     with SingleTickerProviderStateMixin {
//   late AnimationController controller;

//   @override
//   void initState() {
//     super.initState();
//     controller = AnimationController(vsync: this);
//   }

//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Lottie.asset(
//         AssetsLottie.dustbinGrey,
//         controller: controller,
//         onLoaded: (composition) {
//           controller
//             ..duration = composition.duration
//             ..forward();
//           debugPrint("Lottie Duration: ${composition.duration}");
//         },
//         height: 40,
//         width: 40,
//       ),
//     );
//   }
// }
