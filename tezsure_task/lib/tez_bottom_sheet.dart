import 'package:flutter/material.dart';
import 'package:tezsure_task/constants.dart';
import 'package:tezsure_task/tezsure_store.dart';
import 'package:velocity_x/velocity_x.dart';

class TezBottomSheet extends StatefulWidget {
  TezBottomSheet({Key? key}) : super(key: key);

  @override
  State<TezBottomSheet> createState() => _TezBottomSheetState();
}

class _TezBottomSheetState extends State<TezBottomSheet> {
  int index = 0;
  late TezSureStore store;
  @override
  void initState() {
    store = VxState.store as TezSureStore;
    index = store.index;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
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
                child: Text(
                  'Sort By',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              MaterialButton(
                onPressed: () {
                  ChangeIndex(index: index);
                  if (store.index == 0) {
                    SortL2H();
                  } else {
                    SortH2L();
                  }
                  Navigator.pop(context);
                },
                textColor: buttonColor,
                child: const Text('Done'),
              )
            ],
          ),
        ),
        const Divider(
          thickness: 2,
        ),
        ListTile(
          title: const Text('Price : Low to High'),
          selected: index == 0,
          selectedTileColor: buttonColor,
          selectedColor: Colors.black,
          onTap: () => setState(() => index = 0),
        ),
        ListTile(
          title: const Text('Price : High to Low'),
          selected: index == 1,
          selectedTileColor: buttonColor,
          selectedColor: Colors.black,
          onTap: () => setState(() => index = 1),
        )
      ],
    );
  }
}
