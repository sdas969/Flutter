import 'package:flutter/material.dart';
import 'package:tezsure_task/constants.dart';

class PortfolioBalance extends StatelessWidget {
  const PortfolioBalance({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text('Portfolio Balance'),
        Text("\$$portfolioBalance",
            style: TextStyle(
                color: buttonColor, fontSize: 30, fontWeight: FontWeight.w600))
      ]);
}