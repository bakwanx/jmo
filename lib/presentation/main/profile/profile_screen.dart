import 'dart:math';

import 'package:flutter/material.dart';
import 'package:jmo/presentation/login/login_screen.dart';
import 'package:jmo/utils/constant/profile_menu.dart';

import '../../../utils/constant/assets_path.dart';
import '../../../utils/theme/style.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    appBar() {
      return AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'Profil Saya',
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
      );
    }

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
      return Stack(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: maxHeight(context) * 0.15,
              left: 16,
              right: 16,
            ),
            padding: EdgeInsets.only(
              top: maxHeight(context) * 0.08,
              bottom: 16,
              left: 16,
              right: 16,
            ),
            width: maxWidth(context),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 4,
                  offset: const Offset(0, 1), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              children: [
                Text(
                  "Farhan Fadhilah",
                  style: primaryTextStyle.copyWith(
                    fontWeight: bold,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  "JHT, JKK, JKM, JP, JKP",
                  style: primaryTextStyle.copyWith(
                    fontWeight: medium,
                    fontSize: 14,
                    color: Colors.grey.shade500,
                  ),
                ),
                SizedBox(
                  height: defaultMargin,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.blue.shade100,
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 4,
                            horizontal: 4,
                          ),
                          child: Image.asset(
                            icWallet,
                            width: 24,
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "KTP/Paspor",
                              style: primaryTextStyle.copyWith(
                                color: greyColorText,
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              "1241241241241241242157",
                              style: primaryTextStyle.copyWith(
                                color: Colors.black,
                                fontWeight: bold,
                                fontSize: 12,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.blue.shade100,
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 4,
                            horizontal: 4,
                          ),
                          child: Icon(
                            Icons.phone_android,
                            size: 24,
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Nomor HP",
                              style: primaryTextStyle.copyWith(
                                  color: greyColorText, fontSize: 12),
                            ),
                            Text(
                              "08123456789",
                              style: primaryTextStyle.copyWith(
                                color: Colors.black,
                                fontWeight: bold,
                                fontSize: 12,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 100,
            left: 0,
            right: 0,
            child: Container(
              width: 60,
              height: 60,
              child: CircleAvatar(
                backgroundColor: Colors.grey.shade300,
                radius: 45,
                child: ClipOval(
                  child: Image.asset(
                    icPerson,
                    fit: BoxFit.cover,
                    width: 50,
                    height: 50,
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    }

    Widget body() {
      Widget menuList() {
        List<Widget> listMenu = [];
        for (var i = 0; i < dataMenus.length; i++) {
          listMenu.add(Column(
            children: [
              ListTile(
                dense: true,
                contentPadding: EdgeInsets.only(left: 0.0, right: 0.0),
                title: Text(
                  dataMenus[i]["label"],
                  style: primaryTextStyle.copyWith(
                    fontWeight: semiBold,
                    color: Colors.black,
                  ),
                ),
                trailing: i == 0 ? Container(
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 8,
                  ),
                  child: Icon(
                    Icons.edit,
                    color: Colors.blue.shade700,
                    size: 18,
                  ),
                ) : Icon(Icons.keyboard_arrow_right),
                onTap: () {},
              ),
              Divider(
                color: Colors.grey.shade500,
              ),
            ],
          ));
        }

        return Container(
          padding: const EdgeInsets.only(
            left: 16,
            top: 10,
            right: 16,
          ),
          margin: const EdgeInsets.only(
            top: 4,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: listMenu,
          ),
        );
      }

      Widget logOut() {
        return Container(
          margin: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: defaultMargin,
          ),
          width: maxWidth(context),
          child: InkWell(
            onTap: () {
              showDialog<void>(
                context: context,
                builder: (BuildContext ctx) {
                  return AlertDialog(
                    title: Text(
                      "Logout",
                      style: primaryTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: bold,
                        color: Colors.black,
                      ),
                    ),
                    content: Text(
                      "Apakah anda yakin ingin logout?",
                      style: primaryTextStyle.copyWith(
                        color: Colors.black,
                      ),
                    ),
                    actions: [
                      TextButton(
                        child: Text(
                          "Batalkan",
                          style: primaryTextStyle.copyWith(
                            color: primaryColor,
                            fontWeight: bold,
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(ctx);
                        },
                      ),
                      TextButton(
                        child: Text(
                          "Ya",
                          style: primaryTextStyle.copyWith(
                            color: primaryColor,
                            fontWeight: bold,
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                            (r) => false,
                          );
                        },
                      ),
                    ],
                  );
                },
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Keluar",
                  style: primaryTextStyle.copyWith(
                    color: Colors.red.shade700,
                    fontWeight: bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  width: maxWidth(context) * 0.18,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.red.shade100,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 8,
                  ),
                  child: Icon(
                    Icons.logout,
                    color: Colors.red.shade700,
                    size: 18,
                  ),
                ),
              ],
            ),
          ),
        );
      }

      return Expanded(
        child: Container(
          margin: const EdgeInsets.only(
            top: 8,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              menuList(),
              logOut(),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: appBar(),
      body: Container(
        height: maxHeight(context),
        child: Stack(
          children: [
            background(),
            Column(
              children: [
                header(),
                body(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
