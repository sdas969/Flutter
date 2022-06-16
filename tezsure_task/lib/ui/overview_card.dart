import 'package:flutter/material.dart';
import 'package:tezsure_task/ui/account_dropdown.dart';
import 'package:tezsure_task/constants.dart';
import 'package:tezsure_task/ui/portfolio_balance.dart';
import 'package:tezsure_task/ui/transaction_options.dart';

class OverviewCard extends StatelessWidget {
  const OverviewCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
      color: secondaryBackgroundColor,
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
              color: secondaryColor,
              shadowColor: secondaryColor,
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          PortfolioBalance(),
                          AccountDropdown()
                        ]),
                    const SizedBox(height: 30),
                    const TransactionOptions()
                  ])))));
}
