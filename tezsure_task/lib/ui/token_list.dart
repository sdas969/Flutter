import 'package:flutter/material.dart';
import 'package:tezsure_task/store/tezsure_store.dart';
import 'package:tezsure_task/utilities/token_tile.dart';
import 'package:velocity_x/velocity_x.dart';

class TokenList extends StatelessWidget {
  const TokenList({
    Key? key,
    required this.store,
  }) : super(key: key);

  final TezSureStore store;

  @override
  Widget build(BuildContext context) => VxBuilder(
      mutations: const {SortH2L, SortL2H},
      builder: (context, _, __) => SliverList(
          delegate: SliverChildBuilderDelegate(
              childCount: store.tokenList.length,
              (context, index) => TokenTile(store: store, index: index))));
}
