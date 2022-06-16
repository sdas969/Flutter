import 'package:flutter/material.dart';
import 'package:tezsure_task/account_dropdown.dart';
import 'package:tezsure_task/portfolio_balance.dart';
import 'package:tezsure_task/transaction_options.dart';

class OverviewCard extends StatelessWidget {
  const OverviewCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff252525),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          color: Colors.black,
          shadowColor: Colors.black,
          elevation: 20,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [PortfolioBalance(), AccountDropdown()],
                ),
                const SizedBox(
                  height: 30,
                ),
                const TransactionOptions()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
