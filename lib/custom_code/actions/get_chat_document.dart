// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<String> getChatDocument(
  DocumentReference? chatRef,
  UsersRecord? chatUser,
) async {
  if (chatRef == null) {
    return chatUser!.displayName ?? 'Display user';
  } else {
    ChatsRecord chatRecord = await ChatsRecord.getDocumentOnce(chatRef);
    if (chatRecord.groupName == null) {
      return chatUser!.displayName ?? 'Display user';
    }
    return chatRecord.groupName ?? 'Custom Group Name';
  }
}
