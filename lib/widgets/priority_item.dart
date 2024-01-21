import 'package:flutter/material.dart';

class PriorityItem extends StatelessWidget {
  const PriorityItem({
    super.key,
    required this.number,
  });
  final int number;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 50,
        width: 50,
        margin: const EdgeInsets.all(10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(12)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Icon(Icons.flag),
            Text(number.toString()),
          ],
        ),
      ),
    );
  }
}
