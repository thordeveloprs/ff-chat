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
  print("First");
  if (chatRef == null) {
    print("Second");
    return chatUser!.displayName ?? 'Display user';
  } else {
    print("Third");
    ChatsRecord chatRecord = await ChatsRecord.getDocumentOnce(chatRef);
    if (chatRecord.groupName == null || chatRecord.groupName!.isEmpty) {
      print("Fourth");
      return chatUser!.displayName ?? 'Display user';
    } else {
      print("Group Name:-${chatRecord.groupName}");
    }
    print("Fivth");
    return chatRecord.groupName ?? 'Custom Group Name';
  }
}
