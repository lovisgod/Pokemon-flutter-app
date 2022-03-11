
import 'package:json_annotation/json_annotation.dart';

part 'pokemon.g.dart';

@JsonSerializable()
class Pokemon {
  @JsonKey(name: 'sprites')
  Sprite? sprite;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'order')
  int? id;

  Pokemon({this.sprite, this.name, this.id});

  factory Pokemon.fromJson(Map<String, dynamic> json) => _$PokemonFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonToJson(this);
}

@JsonSerializable()
class Sprite {
  @JsonKey(name: 'back_default')
  String backDefault;
  @JsonKey(name: 'front_default')
  String frontDefault;

  Sprite({this.backDefault = "", this.frontDefault = ""});

  factory Sprite.fromJson(Map<String, dynamic> json) => _$SpriteFromJson(json);

  Map<String, dynamic> toJson() => _$SpriteToJson(this);
}
