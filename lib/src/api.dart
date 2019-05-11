import 'dart:typed_data';

import 'package:avataaar_image/src/avataaar.dart';
import 'package:http/http.dart' as http;

class AvataaarsApi {
  static const _BASE_URL = 'https://avataaars.io';

  String getUrl(Avataaar avatar, double width) {
    final params = avatar.pieceEntries.map((it) {
      final key = it.key[0].toLowerCase() + it.key.substring(1);
      return '$key=${it.value}';
    }).join('&');
    return '$_BASE_URL/png/$width?$params';
  }

  Future<Uint8List> getImage(Avataaar avatar, double width) =>
      http.get(getUrl(avatar, width)).then((it) => it.bodyBytes);
}
