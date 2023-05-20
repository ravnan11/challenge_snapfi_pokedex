import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/app/common/pokemon_info_model.dart';
import 'package:pokedex/app/core/image/app_images.dart';
import 'package:pokedex/app/core/utils/utils.dart';

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
            Column(
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
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
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
