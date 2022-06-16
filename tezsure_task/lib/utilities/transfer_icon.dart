import 'package:flutter/material.dart';

class TransferIcon extends StatelessWidget {
  const TransferIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [Icon(Icons.arrow_upward), Icon(Icons.arrow_downward)]);
  }
}
