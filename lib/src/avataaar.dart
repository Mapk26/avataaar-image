import 'dart:convert' show json;

import 'package:avataaar_image/src/converter.dart';

import 'parts/parts.dart';

class Avataaar implements AvataaarPart {
  Avataaar({
    this.top,
    this.clothes,
    this.eyes,
    this.eyebrow,
    this.mouth,
    this.skin,
    this.style,
  });

  Avataaar.random({
    Top top,
    Clothes clothes,
    Eyes eyes,
    Eyebrow eyebrow,
    Mouth mouth,
    Skin skin,
    Style style,
  }) : this(
          top: top ?? Top.random,
          clothes: clothes ?? Clothes.random,
          eyes: eyes ?? Eyes.random,
          eyebrow: eyebrow ?? Eyebrow.random,
          mouth: mouth ?? Mouth.random,
          skin: skin ?? Skin.random,
          style: style ?? Style.random,
        );

  final Top top;
  final Clothes clothes;
  final Eyes eyes;
  final Eyebrow eyebrow;
  final Mouth mouth;
  final Skin skin;
  final Style style;

  Iterable<MapEntry<String, String>> get pieceEntries => pieces
      .expand((it) => it?.pieces ?? [])
      .where((it) => it != null)
      .map(_splitEnum);

  @override
  List<AvataaarPart> get pieces =>
      [top, clothes, eyes, eyebrow, mouth, skin, style];

  MapEntry<String, String> _splitEnum<T>(T enumValue) {
    final split = enumValue.toString().split('\.');
    return MapEntry(split[0], split[1]);
  }

  String toJson() => json.encode(AvataaarConverter().toMap(this));

  static Avataaar fromJson(String value) =>
      AvataaarConverter().fromMap(json.decode(value));
  
   Avataaar copyWith({
    Top top,
    Clothes clothes,
    Eyes eyes,
    Eyebrow eyebrow,
    Mouth mouth,
    Skin skin,
    Style style,
  }){
  return Avataaar(
    top: top ?? Top.random,
    clothes: clothes ?? Clothes.random,
    eyes: eyes ?? Eyes.random,
    eyebrow: eyebrow ?? Eyebrow.random,
    mouth: mouth ?? Mouth.random,
    skin: skin ?? Skin.random,
    style: style ?? Style.random,
  );
  }
  
}

class AvataaarConverter extends Converter<Avataaar> {
  @override
  Avataaar fromMap(Map<String, dynamic> map) => Avataaar(
        top: TopConverter().fromMap(map['top']),
        clothes: ClothesConverter().fromMap(map['clothes']),
        eyebrow: EyebrowConverter().fromMap(map['eyebrow']),
        eyes: EyesConverter().fromMap(map['eyes']),
        mouth: MouthConverter().fromMap(map['mouth']),
        skin: SkinConverter().fromMap(map['skin']),
        style: StyleConverter().fromMap(map['style']),
      );

  @override
  Map<String, dynamic> toMap(Avataaar value) => {
        'top': TopConverter().toMap(value.top),
        'clothes': ClothesConverter().toMap(value.clothes),
        'eyebrow': EyebrowConverter().toMap(value.eyebrow),
        'eyes': EyesConverter().toMap(value.eyes),
        'mouth': MouthConverter().toMap(value.mouth),
        'skin': SkinConverter().toMap(value.skin),
        'style': StyleConverter().toMap(value.style),
      };
}
