// import 'dart:convert';
// import 'dart:io';
// import 'dart:math';
//
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
// import 'package:flutter_chat_ui/flutter_chat_ui.dart';
// import 'package:http/http.dart' as http;
// import 'package:image_picker/image_picker.dart';
// import 'package:open_filex/open_filex.dart';
// import 'package:path_provider/path_provider.dart';
// import '../../../models/ForumPost.dart';
// import 'ForumPostCard.dart';
//
// // For the testing purposes, you should probably use https://pub.dev/packages/uuid.
// String randomString() {
//   final random = Random.secure();
//   final values = List<int>.generate(16, (i) => random.nextInt(255));
//   return base64UrlEncode(values);
// }
//
// class ForumList extends StatefulWidget {
//   @override
//   State<ForumList> createState() => _ForumListState();
// }
//
// class _ForumListState extends State<ForumList> {
//   // Replace this with the actual forum data fetched from a backend
//   // final List<ForumPost> forumPosts = [
//   //   ForumPost(title: 'Discussing Sustainable Transportation', author: 'User123', date: '2 hours ago'),
//   //   ForumPost(title: 'Reducing Plastic Usage - Tips and Tricks', author: 'GreenActivist', date: '1 day ago'),
//   //   // Add more forum posts as needed
//   // ];
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   final List<types.Message> _messages = [];
//   final _user = const types.User(id: '82091008-a484-4a89-ae75-a22bf8d6f3ac');
//
//   @override
//   Widget build(BuildContext context) => Scaffold(
//     body: Chat(
//       messages: _messages,
//       onAttachmentPressed: _handleAttachmentPressed,
//       onMessageTap: _handleMessageTap,
//       onPreviewDataFetched: _handlePreviewDataFetched,
//       onSendPressed: _handleSendPressed,
//       user: _user,
//     ),
//   );
//
//   void _addMessage(types.Message message) {
//     setState(() {
//       _messages.insert(0, message);
//     });
//   }
//
//   void _handleAttachmentPressed() {
//     showModalBottomSheet<void>(
//       context: context,
//       builder: (BuildContext context) => SafeArea(
//         child: SizedBox(
//           height: 144,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: <Widget>[
//               TextButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                   _handleImageSelection();
//                 },
//                 child: const Align(
//                   alignment: AlignmentDirectional.centerStart,
//                   child: Text('Photo'),
//                 ),
//               ),
//               TextButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                   _handleFileSelection();
//                 },
//                 child: const Align(
//                   alignment: AlignmentDirectional.centerStart,
//                   child: Text('File'),
//                 ),
//               ),
//               TextButton(
//                 onPressed: () => Navigator.pop(context),
//                 child: const Align(
//                   alignment: AlignmentDirectional.centerStart,
//                   child: Text('Cancel'),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   void _handleFileSelection() async {
//     final result = await FilePicker.platform.pickFiles(
//       type: FileType.any,
//     );
//
//     if (result != null && result.files.single.path != null) {
//       final message = types.FileMessage(
//         author: _user,
//         createdAt: DateTime.now().millisecondsSinceEpoch,
//         id: randomString(),
//         name: result.files.single.name,
//         size: result.files.single.size,
//         uri: result.files.single.path!,
//       );
//
//       _addMessage(message);
//     }
//   }
//
//   void _handleImageSelection() async {
//     final result = await ImagePicker().pickImage(
//       imageQuality: 70,
//       maxWidth: 1440,
//       source: ImageSource.gallery,
//     );
//
//     if (result != null) {
//       final bytes = await result.readAsBytes();
//       final image = await decodeImageFromList(bytes);
//
//       final message = types.ImageMessage(
//         author: _user,
//         createdAt: DateTime.now().millisecondsSinceEpoch,
//         height: image.height.toDouble(),
//         id: randomString(),
//         name: result.name,
//         size: bytes.length,
//         uri: result.path,
//         width: image.width.toDouble(),
//       );
//
//       _addMessage(message);
//     }
//   }
//
//   void _handleMessageTap(BuildContext _, types.Message message) async {
//     if (message is types.FileMessage) {
//       var localPath = message.uri;
//
//       if (message.uri.startsWith('http')) {
//         try {
//           final index =
//           _messages.indexWhere((element) => element.id == message.id);
//           final updatedMessage =
//           (_messages[index] as types.FileMessage).copyWith(
//             isLoading: true,
//           );
//
//           setState(() {
//             _messages[index] = updatedMessage;
//           });
//
//           final client = http.Client();
//           final request = await client.get(Uri.parse(message.uri));
//           final bytes = request.bodyBytes;
//           final documentsDir = (await getApplicationDocumentsDirectory()).path;
//           localPath = '$documentsDir/${message.name}';
//
//           if (!File(localPath).existsSync()) {
//             final file = File(localPath);
//             await file.writeAsBytes(bytes);
//           }
//         } finally {
//           final index =
//           _messages.indexWhere((element) => element.id == message.id);
//           final updatedMessage =
//           (_messages[index] as types.FileMessage).copyWith(
//             isLoading: null,
//           );
//
//           setState(() {
//             _messages[index] = updatedMessage;
//           });
//         }
//       }
//
//       await OpenFilex.open(localPath);
//     }
//   }
//
//   void _handlePreviewDataFetched(
//       types.TextMessage message,
//       types.PreviewData previewData,
//       ) {
//     final index = _messages.indexWhere((element) => element.id == message.id);
//     final updatedMessage = (_messages[index] as types.TextMessage).copyWith(
//       previewData: previewData,
//     );
//
//     setState(() {
//       _messages[index] = updatedMessage;
//     });
//   }
//
//   void _handleSendPressed(types.PartialText message) {
//     final textMessage = types.TextMessage(
//       author: _user,
//       createdAt: DateTime.now().millisecondsSinceEpoch,
//       id: randomString(),
//       text: message.text,
//     );
//
//     _addMessage(textMessage);
//   }
// }
