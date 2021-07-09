import 'package:flutter/material.dart';
import 'package:flutter_learning/common/shimmer/theme.dart';
import 'package:shimmer/shimmer.dart';

Shimmer shimmerBox() {
  return Shimmer.fromColors(
      baseColor: CustomizedColors.gray1,
      direction: ShimmerDirection.btt,
      highlightColor: CustomizedColors.background1,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        height: 143,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            color: const Color(0xfff7f7fb)),
      ));
}

Widget normalBox() {
  return Container(
    margin: const EdgeInsets.only(bottom: 16),
    padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
    height: 143,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: const Color(0xfff7f7fb)),
  );
}
