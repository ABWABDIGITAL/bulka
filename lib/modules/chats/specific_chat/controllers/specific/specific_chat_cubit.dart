import 'dart:convert';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:bulka/core/utils/extensions/extensions.dart';
import 'package:bulka/modules/chats/specific_chat/controllers/specific/specific_chat_state.dart';
import 'package:bulka/modules/chats/specific_chat/data/entity/chat_entity.dart';
import 'package:bulka/modules/chats/specific_chat/data/params/get_specific_chat_params.dart';
import 'package:bulka/modules/chats/specific_chat/data/repo/specific_chat_repo.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;

class SpecificChatCubit extends Cubit<SpecificChatState> {
  final SpecificChatRepo _specificChatRepo;
  SpecificChatCubit(this._specificChatRepo) : super(SpecificChatInitial());
//---------------------------------VARIABLES----------------------------------//
  late ChatEntity _chatEntity;
  bool _isRec = false;
  TextEditingController _messageController = TextEditingController();
//---------------------------------FUNCTIONS----------------------------------//
  List<types.Message> get messages => _chatEntity.messages;
  types.User get user => _chatEntity.mySideInChatEntity.user;
  types.User get doctor => _chatEntity.otherSideInChatEntity.user;
  ChatEntity get chatEntity => _chatEntity;
  bool get isRec => _isRec;
  TextEditingController get messageController => _messageController;
  void _addMessage(types.Message message) {
    _chatEntity.messages.insert(0, message);
    emit(UpdateChatUi());
  }

  bool checkChatEntityIsInit() {
    try {
      return _chatEntity.messages.isEmpty || _chatEntity.messages.isNotEmpty;
    } catch (e) {
      return false;
    }
  }

  void handleSendPressed(types.PartialText message) {
    final textMessage = types.TextMessage(
      author: user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: const Uuid().v4(),
      text: message.text,
    );
    _addMessage(textMessage);
  }

  void handleMessageTap(BuildContext _, types.Message message) async {
    if (message is types.FileMessage) {
      var localPath = message.uri;

      if (message.uri.startsWith('http')) {
        try {
          final index = _chatEntity.messages
              .indexWhere((element) => element.id == message.id);
          final updatedMessage =
              (_chatEntity.messages[index] as types.FileMessage).copyWith(
            isLoading: true,
          );

          _chatEntity.messages[index] = updatedMessage;
          emit(UpdateChatUi());

          final client = http.Client();
          final request = await client.get(Uri.parse(message.uri));
          final bytes = request.bodyBytes;
          final documentsDir = (await getApplicationDocumentsDirectory()).path;
          localPath = '$documentsDir/${message.name}';

          if (!File(localPath).existsSync()) {
            final file = File(localPath);
            await file.writeAsBytes(bytes);
          }
        } finally {
          final index = chatEntity.messages
              .indexWhere((element) => element.id == message.id);
          final updatedMessage =
              (chatEntity.messages[index] as types.FileMessage).copyWith(
            isLoading: null,
          );

          chatEntity.messages[index] = updatedMessage;
          emit(UpdateChatUi());
        }
      }

      await OpenFilex.open(localPath);
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
        author: user,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        height: image.height.toDouble(),
        id: const Uuid().v4(),
        name: result.name,
        size: bytes.length,
        uri: result.path,
        width: image.width.toDouble(),
      );

      _addMessage(message);
    }
  }

  void _handleFileSelection() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.any,
    );

    if (result != null && result.files.single.path != null) {
      final message = types.FileMessage(
        author: user,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: const Uuid().v4(),
        mimeType: lookupMimeType(result.files.single.path!),
        name: result.files.single.name,
        size: result.files.single.size,
        uri: result.files.single.path!,
      );

      _addMessage(message);
    }
  }

  void handleAttachmentPressed(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) => SafeArea(
        child: SizedBox(
          height: 144,
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

  void handlePreviewDataFetched(
      types.TextMessage message, types.PreviewData previewData) {
    final index =
        _chatEntity.messages.indexWhere((element) => element.id == message.id);
    final updatedMessage =
        (_chatEntity.messages[index] as types.TextMessage).copyWith(
      previewData: previewData,
    );

    _chatEntity.messages[index] = updatedMessage;
    emit(UpdateChatUi());
  }

  void handleVoiceMessage(File soundFile, String time) {
    final message = types.AudioMessage(
      author: user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: const Uuid().v4(),
      duration: _parseTimeToDuration(time),
      name: soundFile.path.split('/').last,
      size: soundFile.lengthSync(),
      uri: '',
    );

    _addMessage(message);
  }

  Duration _parseTimeToDuration(String time) {
    // Split the input string by the colon
    List<String> parts = time.split(':');

    // Parse the minutes and seconds
    int minutes = int.parse(parts[0]);
    int seconds = int.parse(parts[1]);

    // Return a Duration object
    return Duration(minutes: minutes, seconds: seconds);
  }

  void onChangeRecorder(bool val) {
    _isRec = val;
    emit(UpdateChatUi());
  }

  void onChangeFormField() {
    emit(UpdateChatFormField());
  }

//----------------------------------REQUEST-----------------------------------//
  Future<void> getSpecificChatStatesHandled(
      GetSpecificChatParams params) async {
    emit(GetSpecificChatLoading());
    final response = await _specificChatRepo.getSpecificChat(params);
    response.fold((failure) {
      return emit(GetSpecificChatFailure(failure));
    }, (success) async {
      _chatEntity = success;
      return emit(GetSpecificChatSuccess(success));
    });
  }
}
