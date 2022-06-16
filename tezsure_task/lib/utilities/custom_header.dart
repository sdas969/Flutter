import 'package:flutter/material.dart';
import 'package:tezsure_task/constants.dart';
import 'package:tezsure_task/ui/all_token_heading.dart';

class CustomHeader extends SliverPersistentHeaderDelegate {
  @override
  Widget build(context, double shrinkOffset, bool overlapsContent) => Container(
      color: secondaryColor,
      alignment: Alignment.center,
      child: const AllTokenHeading());

  @override
  double get maxExtent => 75;

  @override
  double get minExtent => 75;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => false;
}
