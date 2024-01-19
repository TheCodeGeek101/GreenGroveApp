import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:green_grove/core/Utils/constants.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:bubble/bubble.dart';


String randomString() {
  final random = Random.secure();
  final values = List<int>.generate(16, (i) => random.nextInt(255));
  return base64UrlEncode(values);
}

class ForumList extends StatefulWidget {
  @override
  State<ForumList> createState() => _ForumListState();
}

class _ForumListState extends State<ForumList> {
  late FlutterSoundPlayer _player;
  late FlutterSoundRecorder _recorder;

  @override
  void initState() {
    super.initState();
    _player = FlutterSoundPlayer();
    _recorder = FlutterSoundRecorder();
  }

  @override
  void dispose() {
    _player.closePlayer();
    _recorder.closeRecorder();
    super.dispose();
  }

  final List<types.Message> _messages = [];
  final List<types.AudioMessage> _voiceMessages = [];
  final _user = const types.User(id: '82091008-a484-4a89-ae75-a22bf8d6f3ac');

  void _addMessage(types.Message message) {
    setState(() {
      _messages.insert(0, message);
    });
  }

  void _addVoiceMessage(types.AudioMessage voiceMessage) {
    setState(() {
      _voiceMessages.insert(0, voiceMessage);
    });
  }

  // Future<void> _startRecording() async {
  //   try {
  //     await _recorder.startRecorder(
  //       toFile: await _recorder!.path,
  //       codec: Codec.aacMP4,
  //     );
  //     setState(() {
  //       // Update UI for recording started
  //     });
  //   } catch (e) {
  //     print("Error starting recording: $e");
  //   }
  // }
  //
  // Future<void> _stopRecording() async {
  //   try {
  //     String? path = await _recorder.stopRecorder();
  //     final audioMessage = types.AudioMessage(
  //       author: _user,
  //       createdAt: DateTime.now().millisecondsSinceEpoch,
  //       id: randomString(),
  //       uri: path!,
  //       duration: await _recorder!.duration,
  //       name: '',
  //       size: 12,
  //     );
  //     _addMessage(audioMessage);
  //     setState(() {
  //       // Update UI for recording stopped
  //     });
  //   } catch (e) {
  //     print("Error stopping recording: $e");
  //   }
  // }

  Future<void> _playRecording(String uri) async {
    try {
      await _player.startPlayer(
        fromURI: uri,
        codec: Codec.aacMP4,
        whenFinished: () {
          setState(() {
            // Update UI for playback finished
          });
        },
      );
      setState(() {
        // Update UI for playback started
      });
    } catch (e) {
      print("Error playing recording: $e");
    }
  }

  Future<void> _stopPlaying() async {
    try {
      await _player.stopPlayer();
      setState(() {
        // Update UI for playback stopped
      });
    } catch (e) {
      print("Error stopping recording: $e");
    }
  }

  Widget _bubbleBuilder(
      Widget child, {
        required message,
        required nextMessageInGroup,
      }) =>
      Bubble(
        child: child,
        color: _user.id != message.author.id ||
            message.type == types.MessageType.image
            ? const Color(0xfff5f5f7)
            : Constants.primaryColor,

        margin: nextMessageInGroup
            ? const BubbleEdges.symmetric(horizontal: 6)
            : null,
        nip: nextMessageInGroup
            ? BubbleNip.no
            : _user.id != message.author.id
            ? BubbleNip.leftTop
            : BubbleNip.rightTop,
       style: BubbleStyle(
         color:Colors.black
       )
      );

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Chat(
    showUserAvatars: true,
    showUserNames: true,
    audioMessageBuilder: (_handleVoiceMessagePressed, {required int messageWidth}) {
      return Container(
        width: messageWidth.toDouble(),
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          children: [
            Icon(Icons.audiotrack, color: Colors.white),
            SizedBox(width: 8.0),
            // Text(
            //   'Audio Duration: ${_voiceMessages.duration} seconds',
            //   style: TextStyle(color: Colors.white),
            // ),
          ],
        ),
      );
    },
      messages: _messages,
      onAttachmentPressed: _handleAttachmentPressed,
      onMessageTap: _handleMessageTap,
      onPreviewDataFetched: _handlePreviewDataFetched,
      onSendPressed: _handleSendPressed,
      user: _user,
      bubbleBuilder: _bubbleBuilder,

      // voiceRecording: _recorder.isRecording,
      // onVoiceRecordingComplete: _stopRecording,
      // inputDecoration: InputDecoration(
      //   fillColor: Colors.white,
      //   filled: true,
      //   border: OutlineInputBorder(),
      // ),
      // onVoiceRecordingStart: _startRecording,
      // onVoiceRecordingCancel: () {
      //   _recorder.stopRecorder();
      //   setState(() {
      //     // Update UI for recording canceled
      //   });
      // },
      // onVoicePlaybackStart: (String uri) => _playRecording(uri),
      // onVoicePlaybackStop: _stopPlaying,
    ),
  );

  void _handleAttachmentPressed() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) => SafeArea(
        child: SizedBox(
          height: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  _handleImageSelection();
                },
                child: const Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text('Photo'),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  _handleFileSelection();
                },
                child: const Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text('File'),
                ),
              ),
              // TextButton(
              //   onPressed: () {
              //     Navigator.pop(context);
              //   },
              //   child: const Align(
              //     alignment: AlignmentDirectional.centerStart,
              //     child: Text('Voice Message'),
              //   ),
              // ),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text('Cancel'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleFileSelection() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.any,
    );

    if (result != null && result.files.single.path != null) {
      final message = types.FileMessage(
        author: _user,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: randomString(),
        name: result.files.single.name,
        size: result.files.single.size,
        uri: result.files.single.path!,
      );

      _addMessage(message);
    }
  }

  void _handleImageSelection() async {
    final result = await ImagePicker().pickImage(
      imageQuality: 70,
      maxWidth: 1440,
      source: ImageSource.gallery,
    );

    if (result != null) {
      final bytes = await result.readAsBytes();
      final image = await decodeImageFromList(bytes);

      final message = types.ImageMessage(
        author: _user,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        height: image.height.toDouble(),
        id: randomString(),
        name: result.name,
        size: bytes.length,
        uri: result.path,
        width: image.width.toDouble(),
      );

      _addMessage(message);
    }
  }

  void _handleMessageTap(BuildContext _, types.Message message) async {
    if (message is types.FileMessage) {
      var localPath = message.uri;

      if (message.uri.startsWith('http')) {
        try {
          final index =
          _messages.indexWhere((element) => element.id == message.id);
          final updatedMessage =
          (_messages[index] as types.FileMessage).copyWith(
            isLoading: true,
          );

          setState(() {
            _messages[index] = updatedMessage;
          });

          final client = http.Client();
          final request = await client.get(Uri.parse(message.uri));
          final bytes = request.bodyBytes;
          final documentsDir =
              (await getApplicationDocumentsDirectory()).path;
          localPath = '$documentsDir/${message.name}';

          if (!File(localPath).existsSync()) {
            final file = File(localPath);
            await file.writeAsBytes(bytes);
          }
        } finally {
          final index =
          _messages.indexWhere((element) => element.id == message.id);
          final updatedMessage =
          (_messages[index] as types.FileMessage).copyWith(
            isLoading: null,
          );

          setState(() {
            _messages[index] = updatedMessage;
          });
        }
      }

      await OpenFilex.open(localPath);
    }
  }

  void _handlePreviewDataFetched(
      types.TextMessage message,
      types.PreviewData previewData,
      ) {
    final index = _messages.indexWhere((element) => element.id == message.id);
    final updatedMessage = (_messages[index] as types.TextMessage).copyWith(
      previewData: previewData,
    );

    setState(() {
      _messages[index] = updatedMessage;
    });
  }

  void _handleSendPressed(types.PartialText message) {
    final textMessage = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: randomString(),
      text: message.text,
    );

    _addMessage(textMessage);
  }
  void _handleVoiceMessagePressed(types.AudioMessage voicemessage) {
    final voiceMessage = types.AudioMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: randomString(),
       duration: voicemessage.duration,
        name: voicemessage.name,
        size: voicemessage.size,
        uri: voicemessage.uri,
    );
    _addVoiceMessage(voiceMessage);
  }
}
