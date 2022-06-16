import 'package:flutter/material.dart';
import 'package:tezsure_task/constants.dart';
import 'package:tezsure_task/store/tezsure_store.dart';
import 'package:velocity_x/velocity_x.dart';

class TezBottomSheet extends StatefulWidget {
  const TezBottomSheet({Key? key}) : super(key: key);

  @override
  State<TezBottomSheet> createState() => _TezBottomSheetState();
}

class _TezBottomSheetState extends State<TezBottomSheet> {
  int currIndex = 0;
  late TezSureStore store;

  @override
  void initState() {
    store = VxState.store as TezSureStore;
    currIndex = store.index;
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Wrap(
      alignment: WrapAlignment.center,
      runAlignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
            Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                          padding: EdgeInsets.only(left: 16.0),
                          child:
                              Text('Sort By', style: TextStyle(fontSize: 18))),
                      MaterialButton(
                          onPressed: () {
                            ChangeIndex(index: currIndex);
                            if (store.index == 0) {
                              SortL2H();
                            } else {
                              SortH2L();
                            }
                            Navigator.pop(context);
                          },
                          textColor: buttonColor,
                          child: const Text('Done'))
                    ])),
            const Divider(thickness: 2)
          ] +
          List.generate(
              sortByOptions.length,
              (index) => ListTile(
                  title: Text(sortByOptions[index]),
                  selected: currIndex == index,
                  selectedTileColor: buttonColor,
                  selectedColor: secondaryColor,
                  onTap: () => setState(() => currIndex = index))));
}
