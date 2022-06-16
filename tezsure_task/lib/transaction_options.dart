import 'package:flutter/material.dart';
import 'package:tezsure_task/custom_circle_button.dart';

class TransactionOptions extends StatelessWidget {
  const TransactionOptions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomCircleButton(
                iconData: Icons.arrow_upward, label: 'Send', onPressed: () {}),
            CustomCircleButton(
                iconData: Icons.arrow_downward,
                label: 'Recieve',
                onPressed: () {})
          ],
        ),
        CustomCircleButton(
            iconData: Icons.qr_code, label: 'Scan', onPressed: () {})
      ],
    );
  }
}
