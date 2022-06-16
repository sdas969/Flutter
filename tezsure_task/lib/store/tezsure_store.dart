import 'package:tezsure_task/ui/home_screen.dart';
import 'package:velocity_x/velocity_x.dart';

class TezSureStore extends VxStore {
  int index = 0;
  List<Token> tokenList = [
    const Token(
        codename: 'Gif',
        imagePath: 'assets/tokens/gif.png',
        name: 'GIF',
        shares: 0.0164,
        value: 1.21),
    const Token(
        codename: 'Doga',
        imagePath: 'assets/tokens/dogami.png',
        name: 'Dogami',
        shares: 764,
        value: 55.21),
    const Token(
        codename: 'XTZ',
        imagePath: 'assets/tokens/tezos.png',
        name: 'Tezos',
        shares: 64,
        value: 255.21)
  ];
}

class SortL2H extends VxMutation<TezSureStore> {
  @override
  perform() => store!.tokenList.sort((a, b) => a.value.compareTo(b.value));
}

class SortH2L extends VxMutation<TezSureStore> {
  @override
  perform() => store!.tokenList.sort((a, b) => b.value.compareTo(a.value));
}

class ChangeIndex extends VxMutation<TezSureStore> {
  ChangeIndex({required this.index});
  final int index;
  @override
  perform() => store!.index = index;
}
