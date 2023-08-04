import 'package:flutter/material.dart';
import 'package:jmo/presentation/main/home/model/layanan_model.dart';
import 'package:jmo/utils/theme/style.dart';

class LayananItem extends StatefulWidget {
  final LayananModel layananModel;

  const LayananItem({super.key, required this.layananModel});

  @override
  State<LayananItem> createState() => _LayananItemState();
}

class _LayananItemState extends State<LayananItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Image.asset(
              widget.layananModel.icon,
              width: 40,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            widget.layananModel.name,
            style: primaryTextStyle.copyWith(
              fontSize: 12,
              color: Colors.black,
              fontWeight: semiBold,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
