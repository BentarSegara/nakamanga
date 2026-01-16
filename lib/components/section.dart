import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Section extends StatelessWidget {
  final double? height;
  final double? contentSpace;
  final Widget? header;
  final Widget child;
  const Section({
    super.key,
    this.height,
    this.contentSpace,
    this.header,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final Size phoneSize = MediaQuery.of(context).size;

    return SizedBox(
      height: height ?? phoneSize.height * 0.32,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Column(
          spacing: contentSpace ?? 10,
          children: [header ?? header!, child],
        ),
      ),
    );
  }
}
