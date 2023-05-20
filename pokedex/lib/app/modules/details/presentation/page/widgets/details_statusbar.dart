import 'package:flutter/material.dart';
import 'package:pokedex/app/common/pokemon_info_model.dart';
import 'package:pokedex/app/core/utils/utils.dart';

class StatusBar extends StatelessWidget {
  final PokemonInfoModel pokemon;
  final int index;

  const StatusBar({super.key, required this.pokemon, required this.index});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(StringUtils().transformToUpper(value: pokemon.pokemonStats![index].name)),
        Container(
          width: 1.0,
          height: 48.0,
          color: Colors.grey,
          margin: const EdgeInsets.symmetric(horizontal: 16.0),
        ),
        Text(pokemon.pokemonStats![index].value.toString()),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: LayoutBuilder(builder: (context, constraints) {
            final maxWidth = constraints.maxWidth;
            final percentColor = (maxWidth / 230) * pokemon.pokemonStats![index].value;
            return Container(
              height: 8,
              width: maxWidth,
              color: Colors.white,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: percentColor,
                  decoration: BoxDecoration(
                    color: pokemon.getTypeColor(pokemon.types![0]),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
            );
          }),
        ),
        const SizedBox(
          width: 30,
        )
      ],
    );
  }
}
