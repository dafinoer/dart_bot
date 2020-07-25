import 'package:teledart/teledart.dart';
import 'package:teledart/telegram.dart';

import 'hallo_world/hello_world.dart';
import 'pandemic/pandemic_bot.dart';
import 'dart:io' show Platform;
import 'package:dotenv/dotenv.dart' show load, clean, isEveryDefined, env;


abstract class TeleDartResource {
  final TeleDart teleDart;
  TeleDartResource([this.teleDart]);
}

void main() {

  load();

  var isProduction = bool.fromEnvironment('dart.vm.product');

  var teledart = TeleDart(Telegram(isProduction ? env['TOKEN_BOT_PRODUCTION'] : env['TOKEN_BOT_DEBUG']), Event());

  teledart.start().then((me) => print('${me.username} is initialised'));
  
  halloWorld(teledart);

  var pandemic = PandemicBot.fromCommand(teledart);
  pandemic.messageCovid();
  pandemic.onMessageKeywordCountries();
}
