

import 'package:json_annotation/json_annotation.dart';

part 'pokemon_url.g.dart';


@JsonSerializable()
class PokemonUrl {
  @JsonKey(name: 'url')
  String url;
  @JsonKey(name: 'name')
  String name;

  PokemonUrl({this.url = "", this.name = ""});

  factory PokemonUrl.fromJson(Map<String, dynamic> json) => _$PokemonUrlFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonUrlToJson(this);
}