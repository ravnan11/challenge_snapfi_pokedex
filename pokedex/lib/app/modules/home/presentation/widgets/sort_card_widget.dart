import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/app/modules/home/presentation/controllers/home_controller.dart';

class SortCardWidget extends StatelessWidget {
  const SortCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Modular.get();
    return Observer(builder: (context) {
      return AlertDialog(
        backgroundColor: const Color(0xFFDC0A2D),
        contentPadding: const EdgeInsets.only(left: 4, right: 4, bottom: 4, top: 16),
        insetPadding: const EdgeInsets.symmetric(horizontal: 113, vertical: 132),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        title: const Text(
          'Sort by:',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Poppins',
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Radio<String>(
                        value: 'number',
                        groupValue: controller.orderBy,
                        onChanged: (String? value) {
                          if (value != null) {
                            controller.setOrderBy(value);
                            controller.reOrderList();

                            print(controller.listPokemonModel[0].name);
                          }
                        },
                      ),
                      const Text(
                        'Number',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Radio<String>(
                        value: 'name',
                        groupValue: controller.orderBy,
                        onChanged: (String? value) {
                          if (value != null) {
                            controller.setOrderBy(value);
                            controller.reOrderList();

                            print(controller.listPokemonModel[0].name);
                          }
                        },
                      ),
                      const Text(
                        'Name',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}
