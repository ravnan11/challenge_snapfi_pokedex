import 'package:flutter/material.dart';

class PokemonModel {
  int? id;
  String? name;

  PokemonModel({
    this.id,
    this.name,
  });

  List<int> blackList = [
    898,
    899,
    900,
    901,
    902,
    903,
    904,
    905,
    10128,
    10129,
    10146,
    10153,
    10154,
    10158,
    10159,
    10160,
    10181,
    10182,
    10183,
    10187,
    10192,
    10229,
    10230,
    10231,
    10232,
    10233,
    10234,
    10235,
    10236,
    10237,
    10238,
    10239,
    10239,
    10240,
    10241,
    10242,
    10243,
    10244,
    10245,
    10246,
    10247,
    10248,
    10249,
  ];

  String pokemonImage() {
    if (!blackList.contains(id)) {
      return 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png';
    } else {
      return 'notfound';
    }
  }

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    return PokemonModel(
      id: json['url'] != null ? int.parse(json['url'].split('/')[6]) : json['id'],
      name: json['name'],
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
