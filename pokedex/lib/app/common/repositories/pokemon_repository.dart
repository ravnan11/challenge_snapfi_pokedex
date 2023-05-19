import 'package:pokedex/app/core/data/api.dart';
import 'package:pokedex/app/core/data/http/http.dart';

abstract class PokemonRepository {
  Future<dynamic> getPokemons();
  Future<dynamic> getPokemonByURL({required String url});
  Future<dynamic> getPokemonByNameID({required String param});
  Future<dynamic> getPokemonSpecies({required String param});
}

class PokemonRepositoryImp implements PokemonRepository {
  final HttpClient httpClient;
  PokemonRepositoryImp(this.httpClient);

  @override
  Future<dynamic> getPokemons() async {
    try {
      final httpResponse = await httpClient.request(
        '${Api.pokemonUrl}?limit=30',
        method: 'get',
      );

      return httpResponse;
    } catch (e) {
      return "Falha ao buscar dados.";
    }
  }

  @override
  Future<dynamic> getPokemonByNameID({required String param}) async {
    try {
      final httpResponse = await httpClient.request(
        Api.pokemonUrl + param,
        method: 'get',
      );

      return httpResponse;
    } catch (e) {
      return "Falha ao buscar dados.";
    }
  }

  @override
  Future<dynamic> getPokemonSpecies({required String param}) async {
    try {
      final httpResponse = await httpClient.request(
        Api.speciesURL + param,
        method: 'get',
      );

      return httpResponse;
    } catch (e) {
      return "Falha ao buscar dados.";
    }
  }

  @override
  Future<dynamic> getPokemonByURL({required String url}) async {
    try {
      if (url.isNotEmpty) {
        final httpResponse = await httpClient.request(
          url,
          method: 'get',
        );
        return httpResponse;
      }
    } catch (e) {
      return "Falha ao buscar dados.";
    }
  }
}
