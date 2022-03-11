// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'second_fetch_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$PokemonSecondFetchService extends PokemonSecondFetchService {
  _$PokemonSecondFetchService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = PokemonSecondFetchService;

  @override
  Future<Response<Pokemon>> getSecondResult(String id) {
    final $url = 'pokemon/$id';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<Pokemon, Pokemon>($request);
  }
}
