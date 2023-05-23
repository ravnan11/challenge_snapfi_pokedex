import 'package:flutter/material.dart';
import 'package:pokedex/app/common/pokemon_info_model.dart';
import 'package:pokedex/app/core/utils/utils.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PokemoCharacteristicsWidget extends StatelessWidget {
  final PokemonInfoModel pokemon;
  const PokemoCharacteristicsWidget({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                const Icon(
                  FontAwesomeIcons.weightHanging,
                  size: 14,
                ),
                const SizedBox(width: 10),
                Text(
                  '${pokemon.weight.toString()} kg',
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12.0),
            const Text(
              'Weight',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                fontFamily: 'Poppins',
                color: Color(0xFF666666),
              ),
            ),
          ],
        ),
        Container(
          width: 1.0,
          height: 48.0,
          color: Colors.grey,
          margin: const EdgeInsets.symmetric(horizontal: 16.0),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                const Icon(
                  FontAwesomeIcons.rulerVertical,
                  size: 14,
                ),
                const SizedBox(width: 10),
                Text(
                  '${pokemon.height.toString()} m',
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12.0),
            const Text(
              'Right',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                fontFamily: 'Poppins',
                color: Color(0xFF666666),
              ),
            ),
          ],
        ),
        Container(
          width: 1.0,
          height: 48.0,
          color: Colors.grey,
          margin: const EdgeInsets.symmetric(horizontal: 16.0),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < pokemon.ability!.length; i++) ...[
              Text(
                pokemon.ability != null ? StringUtils().capitalize(pokemon.ability![i]) : '???',
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
            ],

            //pegar 2 opcoes de ability
            const SizedBox(height: 4),
            const Text(
              'Moves',
              style: TextStyle(
                fontSize: 12,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                color: Color(0xFF666666),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
