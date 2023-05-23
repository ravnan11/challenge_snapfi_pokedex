import 'package:flutter/material.dart';
import 'package:pokedex/app/common/pokemon_stats_model.dart';

class PokemonInfoModel {
  int? id;
  String? name;
  String? image;
  int? weight;
  int? height;
  List<String>? ability;
  Map<String, dynamic>? evolveFrom;
  List<String>? types;
  List<PokemonStatsModel>? pokemonStats;
  String? description;

  PokemonInfoModel({
    this.id,
    this.name,
    this.image,
    this.weight,
    this.height,
    this.ability,
    this.evolveFrom,
    this.types,
    this.pokemonStats,
    this.description,
  });

  factory PokemonInfoModel.fromJson(Map<String, dynamic> json) {
    final types = (json['types'] as List).map((typeJson) => typeJson['type']['name'] as String).toList();

    var typesEvolve = [];

    if (json['types_evolve'] != null) {
      typesEvolve = (json['types_evolve'] as List).map((typeJson) => typeJson['type']['name'] as String).toList();
    }

    final ability = (json['abilities'] as List).map((abilityJson) => abilityJson['ability']['name'] as String).toList();

    return PokemonInfoModel(
      id: json['id'],
      name: json['name'],
      image: json['sprites']['other']['official-artwork']['front_default'],
      weight: json['weight'],
      height: json['height'],
      evolveFrom: {
        'name': json['name_evolve'],
        'image': json['image_evolve'],
        'id': json['id_evolve'],
        'types': typesEvolve,
      },
      ability: ability,
      types: types,
      pokemonStats: List<PokemonStatsModel>.from((json['stats'] as List<dynamic>)
          .map<PokemonStatsModel>(
            (x) => PokemonStatsModel.fromJson(x),
          )
          .toList()),
      description: json['flavor_text_entries'].length > 8 ? json['flavor_text_entries'][9]['flavor_text'] : '',
    );
  }

  static Map<String, Color> kTypeColors = <String, Color>{
    'normal': const Color(0xFFBDBEB0),
    'poison': const Color(0xFF995E98),
    'psychic': const Color(0xFFE96EB0),
    'grass': const Color(0xFF9CD363),
    'ground': const Color(0xFFE3C969),
    'ice': const Color(0xFFAFF4FD),
    'fire': const Color(0xFFE7614D),
    'rock': const Color(0xFFCBBD7C),
    'dragon': const Color(0xFF8475F7),
    'water': const Color(0xFF6DACF8),
    'bug': const Color(0xFFC5D24A),
    'dark': const Color(0xFF886958),
    'fighting': const Color(0xFF9E5A4A),
    'ghost': const Color(0xFF7774CF),
    'steel': const Color(0xFFC3C3D9),
    'flying': const Color(0xFF81A2F8),
    'electric': const Color(0xFFF9E65E),
    'fairy': const Color(0xFFEEB0FA),
  };

  Color getTypeColor(String type) => kTypeColors[type] ?? Colors.black;
}
