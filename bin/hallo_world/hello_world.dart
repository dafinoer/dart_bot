import 'dart:async';
import 'package:teledart/model.dart';
import 'package:teledart/teledart.dart';

void halloWorld(TeleDart teleDart){
  teleDart.onCommand('hello').listen(((message) => teleDart.replyMessage(message, 'world')));
}
