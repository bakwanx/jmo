import 'package:flutter/material.dart';
import 'package:jmo/utils/constant/assets_path.dart';

import '../../utils/theme/style.dart';

class NoConnection extends StatelessWidget {
  final String message;
  final EdgeInsets? margin;
  const NoConnection({super.key, required this.message, this.margin});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: margin,
        height: maxHeight(context) * 0.3,
        width: maxWidth(context),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              ilusError,
              height: maxHeight(context) * 0.21,
              fit: BoxFit.contain,
            ),
            Text(
              message,
              style: primaryTextStyle.copyWith(
                fontWeight: semiBold,
                fontSize: 16,
                color: Colors.grey.shade700,
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
