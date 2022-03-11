// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'first_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$FirstService extends FirstService {
  _$FirstService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = FirstService;

  @override
  Future<Response<PokemonResponse>> getFirstResult() {
    final $url = 'pokemon';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<PokemonResponse, PokemonResponse>($request);
  }
}
