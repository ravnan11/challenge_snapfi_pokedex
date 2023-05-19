import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:pokedex/app/common/pokemon_info_model.dart';
import 'package:pokedex/app/common/pokemon_model.dart';
import 'package:pokedex/app/common/repositories/pokemon_repository.dart';
import 'package:pokedex/app/core/modal/modals.dart';

part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  final PokemonRepository repository;
  HomeControllerBase(this.repository);

  @observable
  List<PokemonModel> listPokemonModel = [];

  @observable
  PokemonInfoModel? pokemonInfoModel;

  @observable
  String nextUrl = '';

  @observable
  bool searchAppear = false;

  @action
  changeSearchAppear() => searchAppear = !searchAppear;

  @action
  Future<List<PokemonModel>> getPokemons({required BuildContext context}) async {
    final result = await repository.getPokemons();

    if (result == 'Falha ao buscar dados.') {
      ShowModal.error(context: context, textMsg: result);
      await Future.delayed(const Duration(seconds: 2));
      Navigator.pop(context);

      return [];
    }

    final list = result['results'] as List<dynamic>;

    listPokemonModel = list.map((e) => PokemonModel.fromJson(e)).toList();

    nextUrl = result['next'];

    return listPokemonModel;
  }

  @action
  Future<List<PokemonModel>> getPokemonsByUrl({required BuildContext context}) async {
    final result = await repository.getPokemonByURL(url: nextUrl);

    if (result == 'Falha ao buscar dados.') {
      ShowModal.error(context: context, textMsg: result);
      await Future.delayed(const Duration(seconds: 2));
      Navigator.pop(context);

      return [];
    }

    final list = result['results'] as List<dynamic>;

    for (int i = 0; i < list.length; i++) {
      listPokemonModel.add(PokemonModel.fromJson(list[i]));
    }

    if (result['next'] != null) {
      nextUrl = result['next'];
    } else {
      nextUrl = '';
    }

    return listPokemonModel;
  }

  @action
  Future<List<PokemonModel>> filterPokemon({required BuildContext context, required String param}) async {
    final result = await repository.getPokemonByNameID(param: param);

    if (result == 'Falha ao buscar dados.') {
      ShowModal.error(context: context, textMsg: "Nenhum resultado encontrado.");
      await Future.delayed(const Duration(seconds: 2));
      Navigator.pop(context);

      return [];
    }

    listPokemonModel = [PokemonModel.fromJson(result)];

    return listPokemonModel;
  }

  @action
  Future<PokemonInfoModel> getPokemonByName({required BuildContext context, required String name}) async {
    final pokemonResponse = await repository.getPokemonByNameID(param: name);

    final pokemonID = int.parse(pokemonResponse['species']['url'].split('/')[6]);

    final specieResponse = await repository.getPokemonSpecies(param: pokemonID.toString());

    if (pokemonResponse == 'Falha ao buscar dados.' || specieResponse == 'Falha ao buscar dados.') {
      ShowModal.error(context: context, textMsg: "Falha ao buscar dados.");
      await Future.delayed(const Duration(seconds: 2));
      Navigator.pop(context);

      return pokemonInfoModel!;
    }

    Map<String, dynamic> jsonPokemonInfo = pokemonResponse;
    Map<String, dynamic> jsonPokemonSpecies = specieResponse;
    Map<String, dynamic> evolveResponse = {};
    Map<String, dynamic> jsonPokemonEvolveFrom = {};

    if (jsonPokemonSpecies['evolves_from_species'] != null) {
      evolveResponse = await repository.getPokemonByNameID(param: jsonPokemonSpecies['evolves_from_species']['name']);
    }

    if (evolveResponse.isNotEmpty) {
      jsonPokemonEvolveFrom = {
        'name_evolve': evolveResponse['name'],
        'image_evolve': evolveResponse['sprites']['other']['official-artwork']['front_default'],
        'types_evolve': evolveResponse['types'],
        'id_evolve': evolveResponse['id'],
      };
    }

    final mergedPokemonInfo = {
      ...jsonPokemonInfo,
      ...jsonPokemonSpecies,
      ...jsonPokemonEvolveFrom,
    };

    pokemonInfoModel = PokemonInfoModel.fromJson(mergedPokemonInfo);

    return pokemonInfoModel!;
  }
}
