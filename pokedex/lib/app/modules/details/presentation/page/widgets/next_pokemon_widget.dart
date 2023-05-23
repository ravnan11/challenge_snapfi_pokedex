import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/app/common/pokemon_info_model.dart';
import 'package:pokedex/app/modules/home/presentation/controllers/home_controller.dart';

class NextPokemonWidget extends StatelessWidget {
  final HomeController controllerHome;
  final PokemonInfoModel pokemon;
  const NextPokemonWidget({super.key, required this.controllerHome, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 20,
      top: 230,
      child: IconButton(
        onPressed: () async {
          final int pokemonIdx = controllerHome.listPokemonModel.indexWhere((element) => element.id == pokemon.id);
          final int pokemonId = controllerHome.listPokemonModel[pokemonIdx + 1].id!;

          final pokemonData = await controllerHome.getPokemonByName(context: context, name: pokemonId.toString());

          Modular.to.pushNamed(
            '/detail/',
            arguments: {
              'pokemon': pokemonData,
              'controller': controllerHome,
            },
          );
        },
        icon: const Icon(
          Icons.arrow_forward_ios,
          size: 24,
          color: Colors.white,
        ),
      ),
    );
  }
}
