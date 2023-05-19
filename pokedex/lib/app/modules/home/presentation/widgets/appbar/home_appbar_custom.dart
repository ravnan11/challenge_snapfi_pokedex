import 'package:flutter/material.dart';
import 'package:pokedex/app/core/image/app_images.dart';

class AppbarCustom extends StatelessWidget {
  const AppbarCustom({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return AppBar(
      toolbarHeight: size.height * .1,
      elevation: 0,
      backgroundColor: const Color(0xFFDC0A2D),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            AppImages.title,
            fit: BoxFit.contain,
            height: 32,
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
                      alignLabelWithHint: true,
                    ),
                    textAlignVertical: TextAlignVertical.center,
                  ),
                ),
              ),
              const SizedBox(width: 16.0),
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.white,
                ),
                child: const Center(
                  child: Text(
                    '#',
                    style: TextStyle(color: Color(0xFFDC0A2D)),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
