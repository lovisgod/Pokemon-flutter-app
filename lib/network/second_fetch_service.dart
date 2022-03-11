
import 'package:chopper/chopper.dart';
import 'package:pokemon/data/models/models.dart';
import 'package:pokemon/network/second_fetch_converter.dart';

part 'second_fetch_service.chopper.dart';

@ChopperApi()
abstract class PokemonSecondFetchService extends ChopperService{

  @Get(path: 'pokemon/{id}')
  Future<Response<Pokemon>> getSecondResult(@Path() String id);

  // 8
  static PokemonSecondFetchService create() {
    final client = ChopperClient(
      baseUrl: 'https://pokeapi.co/api/v2',
      services: [
        _$PokemonSecondFetchService(),
      ],
      converter: SecondFetchConverter(),
      interceptors: [ HttpLoggingInterceptor()]
    );
    return _$PokemonSecondFetchService(client);
  }


}