import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/app/common/pokemon_info_model.dart';
import 'package:pokedex/app/core/image/app_images.dart';
import 'package:pokedex/app/core/utils/utils.dart';
import 'package:pokedex/app/modules/home/presentation/controllers/home_controller.dart';

import 'widgets/details_statusbar.dart';
import 'widgets/next_pokemon_widget.dart';
import 'widgets/pokemon_characteristics_widget.dart';
import 'widgets/previous_pokemon_widget.dart';

class DetailsPage extends StatelessWidget {
  final PokemonInfoModel pokemon;
  final HomeController controllerHome;
  const DetailsPage({
    Key? key,
    required this.pokemon,
    required this.controllerHome,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pokemon.getTypeColor(pokemon.types![0]),
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Modular.to.navigate('/home/');
                          },
                          child: const Icon(
                            Icons.arrow_back,
                            size: 32,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 13.70),
                        Text(
                          StringUtils().capitalize(
                            pokemon.name!,
                          ),
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w700,
                            fontSize: 24,
                            color: Colors.white,
                          ),
                        ),
                        Expanded(
                          child: Container(),
                        ),
                        Text(
                          '#${pokemon.id.toString().padLeft(3, '0')}',
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: FractionallySizedBox(
                        heightFactor: 0.65,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  const SizedBox(height: 56),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      for (int i = 0; i < pokemon.types!.length; i++) ...[
                                        Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(30),
                                            color: pokemon.getTypeColor(pokemon.types![i]),
                                          ),
                                          child: Center(
                                            child: Text(
                                              StringUtils().capitalize(pokemon.types![i]),
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 10,
                                                fontWeight: FontWeight.w700,
                                                fontFamily: 'Poppins',
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 16)
                                      ],
                                    ],
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    'About',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                      color: pokemon.getTypeColor(pokemon.types![0]),
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  PokemoCharacteristicsWidget(pokemon: pokemon),
                                  const SizedBox(height: 32),
                                  Text(
                                    pokemon.description!,
                                  ),
                                  const SizedBox(height: 32),
                                  Text(
                                    'Base Stats',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14,
                                      color: pokemon.getTypeColor(pokemon.types![0]),
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  for (int i = 0; i < pokemon.pokemonStats!.length; i++) ...[
                                    StatusBar(
                                      pokemon: pokemon,
                                      index: i,
                                    ),
                                  ]
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (pokemon.id != 1) ...[
              PreviousPokemonWidget(
                controllerHome: controllerHome,
                pokemon: pokemon,
              ),
            ],
            if (pokemon.id! < 10020) ...[
              NextPokemonWidget(
                controllerHome: controllerHome,
                pokemon: pokemon,
              ),
            ],
            Positioned(
              right: 0,
              child: Image.asset(
                AppImages.pokeball,
              ),
            ),
            Positioned(
              left: 85,
              top: 150,
              child: pokemon.image != null
                  ? CachedNetworkImage(
                      imageUrl: pokemon.image!,
                      height: 200,
                      progressIndicatorBuilder: (context, url, downloadProgress) => Center(
                        child: Image.asset(
                          AppImages.pokeballGif,
                          gaplessPlayback: true,
                        ),
                      ),
                      errorWidget: (context, url, error) => const Icon(Icons.error),
                    )
                  : const Icon(Icons.question_mark_outlined, size: 50),
            ),
          ],
        ),
      ),
    );
  }
}
