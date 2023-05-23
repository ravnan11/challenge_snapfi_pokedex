import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/app/common/pokemon_model.dart';
import 'package:pokedex/app/core/image/app_images.dart';
import 'package:pokedex/app/core/utils/utils.dart';
import 'package:pokedex/app/modules/home/presentation/controllers/home_controller.dart';

class HomePokemonWidget extends StatefulWidget {
  final PokemonModel pokemon;
  const HomePokemonWidget({super.key, required this.pokemon});

  @override
  State<HomePokemonWidget> createState() => _HomePokemonWidgetState();
}

class _HomePokemonWidgetState extends State<HomePokemonWidget> {
  final HomeController controller = Modular.get();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final pokemonData = await controller.getPokemonByName(context: context, name: widget.pokemon.name!);

        Modular.to.navigate(
          '/detail',
          arguments: {
            'pokemon': pokemonData,
            'controller': controller,
          },
        );
      },
      child: Container(
        height: 108,
        width: 104,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 2,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 44,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  color: Color(0xffefefef),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '#${widget.pokemon.id.toString().padLeft(3, '0')}',
                  style: const TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                    fontSize: 8,
                    color: Color(0xff666666),
                  ),
                ),
              ),
            ),
            Center(
              child: widget.pokemon.pokemonImage() != 'notfound'
                  ? CachedNetworkImage(
                      imageUrl: widget.pokemon.pokemonImage(),
                      height: 72,
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
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 3.0),
                child: Text(
                  StringUtils().capitalize(widget.pokemon.name!),
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    fontSize: 10,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
