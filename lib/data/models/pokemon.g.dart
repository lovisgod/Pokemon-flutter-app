// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pokemon _$PokemonFromJson(Map<String, dynamic> json) {
  return Pokemon(
    sprite: json['sprites'] == null
        ? null
        : Sprite.fromJson(json['sprites'] as Map<String, dynamic>),
    name: json['name'] as String?,
    id: json['order'] as int?,
  );
}

Map<String, dynamic> _$PokemonToJson(Pokemon instance) => <String, dynamic>{
      'sprites': instance.sprite,
      'name': instance.name,
      'order': instance.id,
    };

Sprite _$SpriteFromJson(Map<String, dynamic> json) {
  return Sprite(
    backDefault: json['back_default'] as String,
    frontDefault: json['front_default'] as String,
  );
}

Map<String, dynamic> _$SpriteToJson(Sprite instance) => <String, dynamic>{
      'back_default': instance.backDefault,
      'front_default': instance.frontDefault,
    };
