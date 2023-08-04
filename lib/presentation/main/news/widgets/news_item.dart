import 'package:flutter/material.dart';
import 'package:jmo/data_providers/models/article_model.dart';
import 'package:jmo/utils/constant/assets_path.dart';

import '../../../../utils/theme/style.dart';

class NewsItem extends StatelessWidget {
  final ArticleModel articleModel;
  final double height;
  final double width;
  EdgeInsets? margin = EdgeInsets.all(12);
  NewsItem({super.key, required this.articleModel, required this.height, required this.width, this.margin});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        // go to news detail
      },
      child: Container(
        margin: margin,
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 4,
              offset: Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(4), topRight: Radius.circular(4)),
              child: Image.network(
                articleModel.urlToImage.toString(),
                height: height * 0.7,
                width: width,
                fit: BoxFit.fill,
                errorBuilder: (context, obj, stackTrace){
                  return Image.asset(
                    ilusNews,
                    width: width,
                    height: height * 0.7,
                    fit: BoxFit.contain,
                  );
                },
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 16
              ),
              color: Colors.white,
              child: Text(
                articleModel.title,
                style: primaryTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: medium,
                  color: Colors.black,
                  overflow: TextOverflow.ellipsis,
                ),
                maxLines: 2,
                textAlign: TextAlign.start,
              ),
            )
          ],
        ),
      ),
    );
  }
}
