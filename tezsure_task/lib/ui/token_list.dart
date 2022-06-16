import 'package:flutter/material.dart';
import 'package:tezsure_task/store/tezsure_store.dart';
import 'package:tezsure_task/utilities/token_tile.dart';
import 'package:velocity_x/velocity_x.dart';

class TokenList extends StatelessWidget {
  const TokenList({
    Key? key,
    required ScrollController scrollController,
    required this.store,
  })  : _scrollController = scrollController,
        super(key: key);

  final ScrollController _scrollController;
  final TezSureStore store;

  @override
  Widget build(BuildContext context) => Expanded(
      child: VxBuilder(
          mutations: const {SortH2L, SortL2H},
          builder: (context, _, __) => ListView.separated(
              controller: _scrollController,
              itemCount: store.tokenList.length,
              separatorBuilder: (context, index) =>
                  const Divider(indent: 0, endIndent: 0, thickness: 2),
              itemBuilder: (context, index) =>
                  TokenTile(store: store, index: index))));
}
