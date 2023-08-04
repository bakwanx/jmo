import 'package:flutter/material.dart';
import 'package:jmo/data_providers/models/article_model.dart';
import 'package:jmo/utils/theme/style.dart';

import '../../utils/constant/assets_path.dart';
import '../../utils/helper/format_helper.dart';

class NewsDetailScreen extends StatefulWidget {
  final ArticleModel articleModel;

  const NewsDetailScreen({super.key, required this.articleModel});

  @override
  State<NewsDetailScreen> createState() => _NewsDetailScreenState();
}

class _NewsDetailScreenState extends State<NewsDetailScreen> {
  @override
  Widget build(BuildContext context) {
    Widget posterImage() {
      return Container(
        child: ClipRRect(
          borderRadius: const BorderRadius.all(
              Radius.circular(4)
          ),
          child: Image.network(
            widget.articleModel.urlToImage.toString(),
            height: maxHeight(context) * 0.3,
            width: maxWidth(context),
            fit: BoxFit.fill,
            errorBuilder: (context, obj, stackTrace) {
              return Image.asset(
                ilusNews,
                width: maxWidth(context),
                height: maxHeight(context) * 0.3,
                fit: BoxFit.contain,
              );
            },
          ),
        ),
      );
    }

    Widget date() {
      return Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(4)),
          color: primaryColor,
        ),
        margin: const EdgeInsets.only(
          top: 16,
        ),
        padding: EdgeInsets.all(6),
        child: Text(
          "${FormatHelper.formatDate(
            widget.articleModel.publishedAt.toString(),
          )} ${FormatHelper.formatTime(
            widget.articleModel.publishedAt.toString(),
          )}",
          style: primaryTextStyle.copyWith(fontSize: 12, color: Colors.white),
        ),
      );
    }

    Widget title() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
        ),
        child: Text(
          widget.articleModel.title,
          style: primaryTextStyle.copyWith(
            fontWeight: bold,
            fontSize: 16,
            color: Colors.black,
          ),
          maxLines: 2,
        ),
      );
    }

    Widget author() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
        ),
        child: Text(
          widget.articleModel.author.toString(),
          style: primaryTextStyle.copyWith(
            color: Colors.grey,
          ),
        ),
      );
    }

    Widget content() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
        ),
        child: Text(
          widget.articleModel.content.toString(),
          style: primaryTextStyle.copyWith(
              color: Colors.grey,
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(

        centerTitle: true,
        title: Text(
          'Berita',
          style: primaryTextStyle.copyWith(
            fontSize: 16,
            fontWeight: bold,
            color: Colors.black,
          ),
        ),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.grey,
            size: 20,
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(
            vertical: defaultMargin,
            horizontal: defaultMargin,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              posterImage(),
              date(),
              title(),
              author(),
              content(),
            ],
          ),
        ),
      ),
    );
  }
}
