import 'package:flutter/material.dart';
import 'package:jmo/data_providers/models/article_model.dart';
import 'package:jmo/presentation/news_detail/news_detail_screen.dart';
import 'package:jmo/utils/constant/assets_path.dart';
import 'package:jmo/utils/helper/format_helper.dart';

import '../../../../utils/theme/style.dart';

class NewsItem extends StatelessWidget {
  final ArticleModel articleModel;
  final double height;
  final double width;
  EdgeInsets? margin = EdgeInsets.all(12);

  NewsItem(
      {super.key,
      required this.articleModel,
      required this.height,
      required this.width,
      this.margin});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NewsDetailScreen(articleModel: articleModel),
          ),
        );
      },
      child: Container(
        margin: margin,
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
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4),
                    topRight: Radius.circular(4),
                  ),
                  child: Image.network(
                    articleModel.urlToImage.toString(),
                    height: height * 0.7,
                    width: width,
                    fit: BoxFit.fill,
                    errorBuilder: (context, obj, stackTrace) {
                      return Image.asset(
                        ilusNews,
                        width: width,
                        height: height * 0.7,
                        fit: BoxFit.contain,
                      );
                    },
                  ),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(4)),
                        color: primaryColor,
                      ),
                      margin: const EdgeInsets.only(
                        left: 12,
                        bottom: 12,
                      ),
                      padding: EdgeInsets.all(3),
                      child: Text(
                        FormatHelper.formatDate(
                            articleModel.publishedAt.toString()),
                        style: primaryTextStyle.copyWith(
                            fontSize: 10, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
