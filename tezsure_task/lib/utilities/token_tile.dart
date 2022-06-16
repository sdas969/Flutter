import 'package:flutter/material.dart';
import 'package:tezsure_task/constants.dart';
import 'package:tezsure_task/store/tezsure_store.dart';

class TokenTile extends StatelessWidget {
  const TokenTile({
    Key? key,
    required this.store,
    required this.index,
  }) : super(key: key);
  final int index;
  final TezSureStore store;

  @override
  Widget build(BuildContext context) => ListTile(
      leading: CircleAvatar(
          backgroundImage: AssetImage(store.tokenList[index].imagePath)),
      title: Text(store.tokenList[index].name),
      subtitle: Text(store.tokenList[index].codename),
      trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text('${store.tokenList[index].shares}',
                style: TextStyle(
                    color: buttonColor,
                    fontWeight: FontWeight.w900,
                    fontSize: 20)),
            Text('\$${store.tokenList[index].value}',
                style:
                    const TextStyle(fontWeight: FontWeight.w500, fontSize: 14))
          ]));
}
