import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jmo/data_providers/models/article_model.dart';
import 'package:jmo/presentation/main/news/cubit/new_news_cubit.dart';
import 'package:jmo/presentation/main/news/cubit/new_news_cubit.dart';
import 'package:jmo/presentation/main/news/widgets/news_item.dart';
import 'package:jmo/presentation/widgets/custom_circular_progress_indicator.dart';
import 'package:jmo/presentation/widgets/custom_shimmer.dart';
import 'package:jmo/presentation/widgets/no_connection.dart';

import '../../../utils/constant/assets_path.dart';
import '../../../utils/constant/layanan_dummy.dart';
import '../../../utils/theme/style.dart';
import '../../login/cubit/form_login_validation_cubit.dart';
import '../home/widgets/layanan_item.dart';
import 'cubit/another_news_cubit.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  final ScrollController scrollController = ScrollController();
  late AnotherNewsCubit anotherNewsCubit;

  void getAnotherNews() {
    anotherNewsCubit =
        BlocProvider.of<AnotherNewsCubit>(context, listen: false);
    anotherNewsCubit.getAnotherNews();
  }

  void getNews() {
    BlocProvider.of<NewNewsCubit>(context, listen: false).getNewNews();
  }

  @override
  void initState() {
    getAnotherNews();
    getNews();
    super.initState();
  }

  void initScroll(context) {
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 0) {
          BlocProvider.of<AnotherNewsCubit>(context).getAnotherNews();
        }
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    anotherNewsCubit.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    initScroll(context);

    Widget background() {
      return Container(
        width: maxWidth(context),
        child: Image.asset(
          bgHome,
          fit: BoxFit.fitWidth,
        ),
      );
    }

    Widget header() {
      return Container(
        margin: EdgeInsets.only(
          top: maxHeight(context) * 0.07,
          left: 11,
          right: 24,
        ),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Image.asset(
                logoApp,
                width: 200,
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 4,
                  vertical: 4,
                ),
                margin: const EdgeInsets.only(
                  left: 8,
                ),
                child: Row(
                  children: [
                    Image.asset(
                      icWallet,
                      width: 30,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text("e-wallet")
                  ],
                ),
              ),
            ),
            const Icon(
              Icons.notifications,
              color: Colors.grey,
            )
          ],
        ),
      );
    }

    Widget body() {
      Widget beritaTerbaruText() {
        return Container(
          width: maxWidth(context),
          margin: EdgeInsets.only(
            left: maxWidth(context) * 0.03,
            top: 16,
            bottom: 16,
          ),
          child: Text(
            "Berita Terbaru",
            style: primaryTextStyle.copyWith(
              fontWeight: bold,
              color: Colors.black,
              fontSize: 18,
            ),
          ),
        );
      }

      Widget beritaTerbaruSlider() {
        return BlocBuilder<NewNewsCubit, NewNewsState>(
          builder: (context, state) {
            if (state is OnLoadingNewNews) {
              return CustomShimmer(height: maxHeight(context) * 0.3, width: maxWidth(context) * 0.935);
            }
            if (state is SuccessNewNews) {
              return Container(
                height: maxHeight(context) * 0.3,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.articleModels.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return NewsItem(
                      articleModel: state.articleModels[index],
                      height: maxHeight(context) * 0.3,
                      width: maxWidth(context) * 0.935,
                      margin: EdgeInsets.only(
                        left: index == 0 ? maxWidth(context) * 0.03 : 12,
                        right: index == state.articleModels.length
                            ? maxWidth(context) * 0.03
                            : 12,
                      ),
                    );
                  },
                ),
              );
            }
            return NoConnection(
              message: "No Connection",
              margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            );
          },
        );
      }

      Widget beritaLainnya() {
        return Container(
          padding: EdgeInsets.only(
            left: maxWidth(context) * 0.03,
            right: maxWidth(context) * 0.03,
            top: 10,
          ),
          margin: const EdgeInsets.only(
            top: 4,
          ),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Berita Lainnya",
                style: primaryTextStyle.copyWith(
                  fontWeight: bold,
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
              BlocBuilder<AnotherNewsCubit, AnotherNewsState>(
                builder: (context, state) {
                  if (state is OnLoadingAnotherNews && state.isFirstFetch) {
                    return GridView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: 10,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8.0,
                        childAspectRatio:
                        (maxWidth(context) / maxHeight(context) / 0.64),
                      ),
                      itemBuilder: (context, index) {
                        return CustomShimmer(
                          height: maxHeight(context) * 0.3,
                          width: maxWidth(context) * 0.47,
                          margin: const EdgeInsets.only(
                            bottom: 6,
                          ),
                        );
                      },
                    );
                  }

                  if(state is FailedAnotherNews){
                    return GridView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: 10,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10.0,
                        childAspectRatio:
                        (maxWidth(context) / maxHeight(context) / 0.64),
                      ),
                      itemBuilder: (context, index) {
                        return const NoConnection(
                          message: "No Connection",
                          margin: EdgeInsets.only(
                            bottom: 6,
                          ),
                        );
                      },
                    );
                  }

                  List<ArticleModel> articleModels = [];
                  bool isLoading = false;

                  if (state is OnLoadingAnotherNews) {
                    articleModels = state.oldArticleModels;
                    isLoading = true;
                  } else if (state is SuccessAnotherNews) {
                    articleModels = state.articleModels;
                  }

                  return GridView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: articleModels.length + (isLoading ? 1 : 0),
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8.0,
                      childAspectRatio:
                      (maxWidth(context) / maxHeight(context) / 0.64),
                    ),
                    itemBuilder: (context, index) {
                      if (index < articleModels.length) {
                        return NewsItem(
                          articleModel: articleModels[index],
                          height: maxHeight(context) * 0.3,
                          width: maxWidth(context) * 0.47,
                          margin: const EdgeInsets.only(
                            bottom: 6,
                          ),
                        );
                      } else {
                        Timer(const Duration(milliseconds: 30), () {
                          scrollController.jumpTo(
                              scrollController.position.maxScrollExtent);
                        });
                        return const CustomCircularProgressIndicator();
                      }
                    },
                  );
                },
              ),
            ],
          ),
        );
      }

      return Column(
        children: [
          beritaTerbaruText(),
          beritaTerbaruSlider(),
          beritaLainnya(),
        ],
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          background(),
          SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                header(),
                body(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
