import 'package:flutter/material.dart';
import 'package:jmo/presentation/main/home/widgets/layanan_item.dart';
import 'package:jmo/utils/constant/layanan_dummy.dart';
import 'package:jmo/utils/theme/style.dart';

import '../../../utils/constant/assets_path.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
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
      Widget programLayananText() {
        return Container(
          width: maxWidth(context),
          margin: EdgeInsets.only(
            left: defaultMargin,
            top: 16,
            bottom: 16,
          ),
          child: Text(
            "Program Layanan",
            style: primaryTextStyle.copyWith(
              fontWeight: bold,
              color: Colors.black,
              fontSize: 18,
            ),
          ),
        );
      }

      Widget programLayanan() {
        return Container(
          margin: EdgeInsets.symmetric(
            horizontal: defaultMargin,
            vertical: 8,
          ),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 4,
                      offset: Offset(0, 1), // changes position of shadow
                    ),
                  ],
                ),
                child: IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                          vertical: 14,
                          horizontal: 12,
                        ),
                        child: Image.asset(
                          icGrandparent,
                          width: 30,
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                            vertical: 12,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Jaminan Hari Tua",
                                style: primaryTextStyle.copyWith(
                                  fontWeight: bold,
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                "Anda sudah terdaftar di layanan ini",
                                style: primaryTextStyle.copyWith(
                                  fontWeight: light,
                                  color: greyColorText,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          right: 8,
                          top: 8,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.check_circle,
                              color: primaryColor,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 4,
                      offset: Offset(0, 1), // changes position of shadow
                    ),
                  ],
                ),
                child: IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                          vertical: 14,
                          horizontal: 12,
                        ),
                        child: Image.asset(
                          icPerson,
                          width: 30,
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                            vertical: 12,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Jaminan Kecelakaan Kerja",
                                style: primaryTextStyle.copyWith(
                                  fontWeight: bold,
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                "Anda sudah terdaftar di layanan ini",
                                style: primaryTextStyle.copyWith(
                                  fontWeight: light,
                                  color: greyColorText,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          right: 8,
                          top: 8,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.check_circle,
                              color: primaryColor,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      }

      Widget programLainnya() {
        return Container(
          margin: EdgeInsets.only(
            top: 8,
            left: defaultMargin,
            right: defaultMargin,
          ),
          width: maxWidth(context),
          decoration: BoxDecoration(
            color: secondaryColor,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 4,
                offset: Offset(0, 1), // changes position of shadow
              ),
            ],
          ),
          child: TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  4,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "PROGRAM LAINNYA",
                  style: primaryTextStyle.copyWith(
                    color: primaryColor,
                    fontWeight: medium,
                    fontSize: 14,
                  ),
                ),
                SizedBox(
                  width: maxWidth(context) * 0.18,
                ),
                Icon(
                  Icons.arrow_right_alt,
                  color: primaryColor,
                  size: 30,
                ),
              ],
            ),
          ),
        );
      }

      Widget layanan() {
        return Container(
          padding: EdgeInsets.only(
            left: 10,
            right: 10,
            top: defaultMargin,
          ),
          margin: const EdgeInsets.only(
            top: 4,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(
                  left: 10,
                  bottom: 16,
                ),
                child: Text(
                  "Program Lainnya",
                  style: primaryTextStyle.copyWith(
                    fontWeight: bold,
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: layananDummy.length,
                padding: const EdgeInsets.all(8),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 16,
                  childAspectRatio:
                      (maxWidth(context) / maxHeight(context) / 0.9),
                ),
                itemBuilder: (context, idx) {
                  return LayananItem(
                    layananModel: layananDummy[idx],
                  );
                },
              ),
            ],
          ),
        );
      }

      return Container(
        child: Column(
          children: [
            programLayananText(),
            programLayanan(),
            programLainnya(),
            layanan(),
          ],
        ),
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          background(),
          SingleChildScrollView(
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
