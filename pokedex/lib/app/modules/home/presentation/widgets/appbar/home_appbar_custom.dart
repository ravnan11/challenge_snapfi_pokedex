import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/app/core/image/app_images.dart';
import 'package:pokedex/app/modules/home/presentation/controllers/home_controller.dart';
import 'package:pokedex/app/modules/home/presentation/widgets/sort_card_widget.dart';

class AppbarCustom extends StatelessWidget {
  const AppbarCustom({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final HomeController controller = Modular.get();

    return Observer(
      builder: (context) {
        return AppBar(
          toolbarHeight: size.height * .1,
          elevation: 0,
          backgroundColor: const Color(0xFFDC0A2D),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                child: Image.asset(
                  AppImages.title,
                  fit: BoxFit.contain,
                  height: 32,
                ),
                onTap: () {
                  Modular.to.navigate('/home/');
                },
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 32,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        border: Border.all(color: Colors.grey),
                        color: Colors.white,
                      ),
                      child: TextField(
                        controller: controller.textSearchController,
                        decoration: InputDecoration(
                          hintText: 'Search',
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
                          hintStyle: const TextStyle(
                            fontSize: 16.0,
                            color: Color(0xff666666),
                            height: 1.0,
                          ),
                          prefixIcon: const Icon(
                            Icons.search,
                            color: Color(0xFFDC0A2D),
                          ),
                          suffixIcon: controller.searchText != ''
                              ? IconButton(
                                  icon: const Icon(
                                    Icons.clear,
                                    color: Color(0xFFDC0A2D),
                                  ),
                                  onPressed: () {
                                    controller.clearSearch();
                                    controller.getPokemons(context: context);
                                  },
                                )
                              : null,
                          alignLabelWithHint: true,
                        ),
                        textAlignVertical: TextAlignVertical.center,
                        onChanged: (value) {
                          controller.searchText = value;
                        },
                        onSubmitted: (String value) {
                          if (value == '') {
                            controller.getPokemons(context: context);
                          } else {
                            controller.filterPokemon(
                              context: context,
                              param: value.toLowerCase(),
                            );
                          }
                        },
                      ),
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  GestureDetector(
                    child: Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Colors.white,
                      ),
                      child: Center(
                        child: controller.orderBy == 'name'
                            ? const Icon(
                                Icons.text_format,
                                color: Color(0xFFDC0A2D),
                              )
                            : const Text(
                                '#',
                                style: TextStyle(color: Color(0xFFDC0A2D)),
                              ),
                      ),
                    ),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return const SortCardWidget();
                        },
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
