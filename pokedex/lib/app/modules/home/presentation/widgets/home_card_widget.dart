import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pokedex/app/modules/home/presentation/controllers/home_controller.dart';
import 'package:pokedex/app/modules/home/presentation/widgets/appbar/home_appbar_custom.dart';
import 'package:pokedex/app/modules/home/presentation/widgets/home_pokemon_widget.dart';

class HomeCard extends StatefulWidget {
  final HomeController controller;
  const HomeCard({super.key, required this.controller});

  @override
  State<HomeCard> createState() => _HomeCardState();
}

class _HomeCardState extends State<HomeCard> {
  ScrollController? _scrollController;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController()..addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Scaffold(
        backgroundColor: const Color(0xFFDC0A2D),
        appBar: const PreferredSize(
          preferredSize: Size(double.infinity, 90),
          child: AppbarCustom(),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 4.0, right: 4.0, top: 24, bottom: 4),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: GridView.count(
                    controller: _scrollController,
                    physics: isLoading ? const NeverScrollableScrollPhysics() : const AlwaysScrollableScrollPhysics(),
                    crossAxisCount: 3,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
                    children: widget.controller.listPokemonModel
                        .map(
                          (e) => HomePokemonWidget(pokemon: e),
                        )
                        .toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  _scrollListener() async {
    if (_scrollController!.offset >= _scrollController!.position.maxScrollExtent && !_scrollController!.position.outOfRange) {
      if (widget.controller.nextUrl.isNotEmpty) {
        setState(() {
          isLoading = true;
        });
        await widget.controller.getPokemonsByUrl(context: context);
      }
      setState(() {
        isLoading = false;
      });
    }
  }
}
