import 'package:flutter/material.dart';

class IconDataWidget extends StatelessWidget {
  const IconDataWidget({
    super.key,
    required this.icon,
    required this.descText,
    required this.data,
  });
  final IconData icon;
  final String descText;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton.icon(
            onPressed: () {},
            icon: Icon(icon),
            label: Text("$descText:"),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(8)),
            margin: const EdgeInsets.all(8),
            child: Text(data),
          )
        ],
      ),
    );
  }
}
