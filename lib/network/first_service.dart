
import 'package:chopper/chopper.dart';
import 'package:pokemon/data/models/models.dart';
import 'package:pokemon/network/main_converter.dart';

part 'first_service.chopper.dart';


@ChopperApi()
abstract class FirstService extends ChopperService{

  @Get(path: 'pokemon')
  Future<Response<PokemonResponse>> getFirstResult();

  // 8
  static FirstService create() {
    final client = ChopperClient(
      baseUrl: 'https://pokeapi.co/api/v2',
      services: [
        _$FirstService(),
      ],
      converter: FirstfetchConverter(),
      interceptors: [ HttpLoggingInterceptor()]
    );
    return _$FirstService(client);
  }


}