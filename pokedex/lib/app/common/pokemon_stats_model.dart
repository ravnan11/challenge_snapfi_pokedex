class PokemonStatsModel {
  String name;
  int value;

  PokemonStatsModel({
    required this.name,
    required this.value,
  });

  factory PokemonStatsModel.fromJson(Map<String, dynamic> json) {
    return PokemonStatsModel(
      name: json['stat']['name'],
      value: json['base_stat'],
    );
  }
}
