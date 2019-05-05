import 'package:avataaar_image/src/converter.dart';
import 'package:avataaar_image/src/parts/parts.dart';
import 'package:avataaar_image/src/pieces.dart';

class Eyes implements AvataaarPart {
  Eyes._({this.eyeType});

  final EyeType eyeType;

  @override
  List get pieces => [eyeType];

  static Eyes get close => Eyes._(eyeType: EyeType.Close);
  static Eyes get cry => Eyes._(eyeType: EyeType.Cry);
  static Eyes get defaultEyes => Eyes._(eyeType: EyeType.Default);
  static Eyes get dizzy => Eyes._(eyeType: EyeType.Dizzy);
  static Eyes get eyeRoll => Eyes._(eyeType: EyeType.EyeRoll);
  static Eyes get happy => Eyes._(eyeType: EyeType.Happy);
  static Eyes get hearts => Eyes._(eyeType: EyeType.Hearts);
  static Eyes get side => Eyes._(eyeType: EyeType.Side);
  static Eyes get squint => Eyes._(eyeType: EyeType.Squint);
  static Eyes get surprised => Eyes._(eyeType: EyeType.Surprised);
  static Eyes get wink => Eyes._(eyeType: EyeType.Wink);
  static Eyes get winkWacky => Eyes._(eyeType: EyeType.WinkWacky);

  static Eyes get random => Eyes._(eyeType: randomPiece(EyeType.values));
}

class EyesConverter extends Converter<Eyes> {
  @override
  Eyes fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    return Eyes._(
      eyeType: enumFromJson(EyeType.values, map['eyeType']),
    );
  }

  @override
  Map<String, dynamic> toMap(Eyes value) {
    if (value == null) return null;
    return {'eyeType': enumToJson(value.eyeType)};
  }
}
