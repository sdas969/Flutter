import 'package:flutter/material.dart';

class TransferIcon extends StatelessWidget {
  const TransferIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => const Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
        child: Image(
            fit: BoxFit.cover, image: AssetImage('assets/icons/data.png')),
      );
}
