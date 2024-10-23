// import 'package:flutter/material.dart';

// class ChatListViewDisplayWidget extends StatelessWidget {
//   const ChatListViewDisplayWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       reverse: true, // Latest messages at the bottom
//       itemCount: messages.length,
//       itemBuilder: (context, index) {
//         final message = messages[index];
//         final bool isMe = message.isMe;
//         return Column(
//           children: [
//             if (index == 0 ||
//                 messages[index - 1].groupTime != message.groupTime)
//               Center(
//                   child: Text(message.groupTime,
//                       style: const TextStyle(color: Colors.grey))),
//             ChatBubble(
//               message: message,
//               isMe: isMe,
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
