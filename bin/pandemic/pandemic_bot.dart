import 'package:teledart/teledart.dart';

import '../main.dart';
import '../model/cases.dart';
import '../utils/formats.dart';
import '../utils/strings.dart';
import 'pandemic_service.dart';

class PandemicBot extends TeleDartResource {
  PandemicBot._(TeleDart teleDart) : super(teleDart);

  final PandemicService _pandemicService = PandemicService();

  factory PandemicBot.fromCommand(TeleDart teleDart) {
    return PandemicBot._(teleDart);
  }

  void messageCovid() {
    teleDart.onCommand('info_covid').listen(((message) {
      final valueDescription =
          'masukan nama negara' + '\n\n' + '!namanegara <nama negara>';
      return teleDart.replyMessage(message, valueDescription);
    }));
  }

  void onMessageKeywordCountries() {
    teleDart.onMessage(keyword: '!namanegara').listen((value) async {
      var countryName = value.text.replaceAll('!namanegara ', '');

      try {
        var service = await _pandemicService.fetchPandemicCountry(countryName);
        var stringBuffer = StringBuffer();
        var confirm = Strings.confirmTotal
            .replaceAll('{total}', Formats.formatDate(service.confirm.value));
        var recover = Strings.recoveredTotal
            .replaceAll('{total}', Formats.formatDate(service.recovered.value));
        var death = Strings.deathTotal
            .replaceAll('{total}', Formats.formatDate(service.deaths.value));

        stringBuffer.writeAll([confirm, recover, death], '\n\n');
        return teleDart.telegram.sendMessage(
            value.chat.id, stringBuffer.toString(),
            parse_mode: 'MarkdownV2', reply_to_message_id: value.message_id);
      } on Exception catch (e) {
        return teleDart.telegram
            .sendMessage(value.chat.id, value.text + 'tidak di temukan');
      }
    });
  }
}
