import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:pokemon/data/models/models.dart';
import 'package:pokemon/network/services.dart';

class PokemonRepository {
  List<PokemonUrl> _pokemonUrls = <PokemonUrl>[];
  List<Pokemon> _pokemons = <Pokemon>[];
  Stream<List<Pokemon>>? _pokemonStream;
  final StreamController _pokemonStreamController =
  StreamController<List<Pokemon>>();

  Stream<List<Pokemon>> watchAllPokemon() {
    if (_pokemonStream == null) {
      _pokemonStream = _pokemonStreamController.stream as Stream<List<Pokemon>>;
    }
    return _pokemonStream!;
  }


  Future<List<int>> insertUrls(List<PokemonUrl> pokemonUrls) {
    if (pokemonUrls.length != 0) {
      _pokemonUrls.addAll(pokemonUrls);
      secondFetch(pokemonUrls);
    }
    return Future.value(<int>[]);
  }


  Future<void> insertPokemons(Pokemon pokemon) {
    _pokemons.add(pokemon);
    if (_pokemons.length != 0) {
      _pokemonStreamController.sink.add(_pokemons);
    }
    return Future.value();
  }

  Future<void> firstFecth() {
    FirstService service  = FirstService.create();
     Future<Response<PokemonResponse>> result  = service.getFirstResult();
     result.then((value) => {
       insertUrls(value.body!.results!)
     });
     return Future.value();
  }

  Future<void> secondFetch(List<PokemonUrl> list) {
    list.forEach((element) {
      List splitted  = element.url.split('/');
      final path  = splitted[splitted.length -2];
      print('this is path $path');
      PokemonSecondFetchService service  = PokemonSecondFetchService.create();
      Future<Response<Pokemon>> result  = service.getSecondResult(path);
      result.then((value) => {
        insertPokemons(value.body!)
      });
    });
    
    return Future.value();
  }


}