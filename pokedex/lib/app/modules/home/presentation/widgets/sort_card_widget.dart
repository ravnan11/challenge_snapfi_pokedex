import 'package:flutter/material.dart';

class SortCardWidget extends StatelessWidget {
  const SortCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Sort by:'),
      content: Container(
        height: 105,
        width: 80,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: const [
            Text('Number'),
            Text('Name'),
          ],
        ),
      ),
    );
  }
}
