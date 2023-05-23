import 'package:flutter/material.dart';
import 'package:pokedex/app/common/pokemon_info_model.dart';
import 'package:pokedex/app/core/utils/utils.dart';

class StatusBar extends StatelessWidget {
  final PokemonInfoModel pokemon;
  final int index;

  const StatusBar({super.key, required this.pokemon, required this.index});

  String convertFieldName(String fieldName) {
    switch (fieldName) {
      case "attack":
        return "ATK";
      case "defense":
        return "DEF";
      case "special-attack":
        return "SATK";
      case "special-defense":
        return "SDEF";
      case "speed":
        return "SPD";
      default:
        return fieldName;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 40,
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                StringUtils().transformToUpper(
                  value: convertFieldName(pokemon.pokemonStats![index].name),
                ),
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                  fontSize: 12,
                  color: pokemon.getTypeColor(pokemon.types![0]),
                ),
              ),
            ),
          ),
          Container(
            width: 1.0,
            height: 24.0,
            color: Colors.grey,
            margin: const EdgeInsets.symmetric(horizontal: 16.0),
          ),
          Text(
            pokemon.pokemonStats![index].value.toString().padLeft(3, '0'),
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              fontSize: 12,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                final maxWidth = constraints.maxWidth;
                final percentValue = pokemon.pokemonStats![index].value / 230;
                final barWidth = maxWidth * percentValue;

                return Container(
                  height: 8,
                  width: maxWidth,
                  color: Colors.white,
                  child: Stack(
                    children: [
                      Container(
                        width: barWidth,
                        decoration: BoxDecoration(
                          color: pokemon.getTypeColor(pokemon.types![0]),
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      Container(
                        width: maxWidth,
                        color: pokemon.getTypeColor(pokemon.types![0]).withOpacity(0.2),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
