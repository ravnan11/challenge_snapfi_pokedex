import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pokedex/app/common/pokemon_info_model.dart';
import 'package:pokedex/app/core/image/app_images.dart';
import 'package:pokedex/app/core/utils/utils.dart';

import 'widgets/details_statusbar.dart';

class DetailsPage extends StatelessWidget {
  final PokemonInfoModel pokemon;
  const DetailsPage({Key? key, required this.pokemon}) : super(key: key);

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
                            Modular.to.navigate('/');
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
                                      fontSize: 14,
                                      color: pokemon.getTypeColor(pokemon.types![0]),
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            children: [
                                              const Icon(
                                                FontAwesomeIcons.weightHanging,
                                                size: 10,
                                              ),
                                              const SizedBox(width: 10),
                                              Text(
                                                pokemon.weight.toString(),
                                                style: const TextStyle(
                                                  fontSize: 10,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 12.0),
                                          const Text(
                                            'Weight',
                                            style: TextStyle(
                                              fontSize: 8,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'Poppins',
                                              color: Color(0xFF666666),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(width: 24),
                                      Container(
                                        width: 1.0,
                                        height: 48.0,
                                        color: Colors.grey,
                                        margin: const EdgeInsets.symmetric(horizontal: 16.0),
                                      ),
                                      const SizedBox(width: 24),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            children: [
                                              const Icon(
                                                FontAwesomeIcons.rulerVertical,
                                                size: 10,
                                              ),
                                              const SizedBox(width: 10),
                                              Text(
                                                pokemon.height.toString(),
                                                style: const TextStyle(
                                                  fontSize: 10,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 12.0),
                                          const Text(
                                            'Right',
                                            style: TextStyle(
                                              fontSize: 8,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'Poppins',
                                              color: Color(0xFF666666),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(width: 24),
                                      Container(
                                        width: 1.0,
                                        height: 48.0,
                                        color: Colors.grey,
                                        margin: const EdgeInsets.symmetric(horizontal: 16.0),
                                      ),
                                      const SizedBox(width: 24),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          for (int i = 0; i < pokemon.ability!.length; i++) ...[
                                            Text(
                                              pokemon.ability != null ? StringUtils().capitalize(pokemon.ability![i]) : '???',
                                              style: const TextStyle(
                                                fontSize: 10,
                                              ),
                                            ),
                                          ],

                                          //pegar 2 opcoes de ability
                                          const SizedBox(height: 4),
                                          const Text(
                                            'Moves',
                                            style: TextStyle(
                                              fontSize: 8,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xFF666666),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 32),
                                  const Text('TEXTO DE DESCRIÇAO'),
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
