import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/app/common/pokemon_model.dart';
import 'package:pokedex/app/modules/home/presentation/controllers/home_controller.dart';
import 'package:pokedex/app/modules/home/presentation/widgets/home_card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final HomeController controller = Modular.get();

    return FutureBuilder<List<PokemonModel>>(
      future: controller.getPokemons(context: context),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            color: Colors.white,
            child: const Center(
              child: CircularProgressIndicator(
                color: Colors.red,
              ),
            ),
          );
        }

        if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
          return HomeCard(controller: controller);
        }

        if (snapshot.hasError) {
          return const Center(
            child: Text('Falha ao carregar dados'),
          );
        }

        return Container();
      }),
    );
  }
}
