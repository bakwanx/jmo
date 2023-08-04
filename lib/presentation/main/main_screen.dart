import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jmo/presentation/main/cubit/navigator_cubit.dart';
import 'package:jmo/presentation/main/digital_card/digital_card_screen.dart';
import 'package:jmo/presentation/main/home/home_screen.dart';
import 'package:jmo/presentation/main/news/news_screen.dart';
import 'package:jmo/presentation/main/profile/profile_screen.dart';
import 'package:jmo/utils/constant/assets_path.dart';
import 'package:jmo/utils/theme/style.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {

    Widget body() {
      return StreamBuilder<Object>(
          stream: BlocProvider.of<NavigatorCubit>(context)
              .currentIndexPageStream,
          builder: (context, snapshot) {
            switch (snapshot.data) {
              case 0:
                return HomeScreen();
                break;
              case 1:
                return NewsScreen();
                break;
              case 2:
                return DigitalCardScreen();
                break;
              case 3:
                return ProfileScreen();
                break;
              default:
                return HomeScreen();
            }
          }
      );
    }

    Widget bottomNav(){
      return StreamBuilder<Object>(
          stream: BlocProvider.of<NavigatorCubit>(context)
              .currentIndexPageStream,
        builder: (context, snapshot) {
          return Container(
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.1),
                  blurRadius: 40,
                  offset: Offset(
                    4,
                    4,
                  ),
                ),
              ],
            ),
            child: BottomNavigationBar(
              unselectedLabelStyle: primaryTextStyle,
              unselectedItemColor: Colors.grey,
              selectedItemColor: primaryColor,
              backgroundColor: Colors.white,
              type: BottomNavigationBarType.fixed,
              currentIndex: snapshot.data == null ? 0 : snapshot.data as int,
              onTap: (value) {
                BlocProvider.of<NavigatorCubit>(context)
                  .setCurrentIndexPage(value);
              },
              items: [
                BottomNavigationBarItem(
                  icon: Container(
                    margin: const EdgeInsets.only(
                      top: 10,
                      bottom: 4,
                    ),
                    child: Container(
                      child: Image.asset(
                        icHome,
                        width: 27,
                        color: snapshot.data == 0 || snapshot.data == null ? primaryColor : Colors.grey,
                      ),
                    ),
                  ),
                  label: 'Beranda',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 4),
                    child: Image.asset(
                      icNews,
                      width: 27,
                      color: snapshot.data == 1 ? primaryColor : Colors.grey,
                    ),
                  ),
                  label: 'Berita',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 4),
                    child: Image.asset(
                      icCreditCard,
                      width: 27,
                      color: snapshot.data == 2 ? primaryColor : Colors.grey,
                    ),
                  ),
                  label: 'Kartu Digital',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 4),
                    child: Image.asset(
                      icProfile,
                      width: 27,
                      color: snapshot.data == 3 ? primaryColor : Colors.grey,
                    ),
                  ),
                  label: 'Profile',
                ),
              ],
            ),
          );
        }
      );
    }

    return Scaffold(
      bottomNavigationBar: bottomNav(),
      body: body(),
    );
  }
}
