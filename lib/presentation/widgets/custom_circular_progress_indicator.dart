import 'package:flutter/material.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  const CustomCircularProgressIndicator({super.key, this.margin, this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
