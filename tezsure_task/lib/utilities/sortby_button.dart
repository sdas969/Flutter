import 'package:flutter/material.dart';
import 'package:tezsure_task/constants.dart';
import 'package:tezsure_task/ui/tez_bottom_sheet.dart';
import 'package:tezsure_task/utilities/transfer_icon.dart';

class SortByButton extends StatelessWidget {
  const SortByButton({
    Key? key,
  }) : super(key: key);

  Future<dynamic> handleSortBy(BuildContext context) => showModalBottomSheet(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
      context: context,
      builder: (context) => const TezBottomSheet());

  @override
  Widget build(BuildContext context) => MaterialButton(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      color: buttonColor,
      onPressed: () => handleSortBy(context),
      textColor: secondaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Row(children: const [TransferIcon(), Text('Sort By')]));
}
