import 'package:json_annotation/json_annotation.dart';
import 'package:pokemon/data/models/models.dart';

part 'pokemon_response.g.dart';

@JsonSerializable()
class PokemonResponse {
  @JsonKey(name: 'count')
  int? count;
  @JsonKey(name: 'next')
  String? next;
  @JsonKey(name: 'previous')
  String? previous;
  @JsonKey(name: 'results')
  List<PokemonUrl>? results;

  PokemonResponse({this.count, this.next, this.previous, this.results});

  factory PokemonResponse.fromJson(Map<String, dynamic> json) => _$PokemonResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonResponseToJson(this);
}