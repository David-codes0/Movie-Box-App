import 'dart:developer' as devtools;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:vidflix/components/custom_outline.dart';
import 'package:vidflix/constants.dart';
import 'package:vidflix/routes/routes.dart';
import 'package:vidflix/screens/download_screen.dart';
import 'package:vidflix/screens/main_homepage_movie.dart';
import 'package:vidflix/screens/movie_categorise.dart';
import 'package:vidflix/services/firebase_authservice.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

 
  static final pages = <dynamic>[
    const MovieHomePage(),
    Center(
      child: Container(
        height: 100,
        width: 100,
        decoration: const BoxDecoration(color: Colors.blue),
      ),
    ),
   const MovieCategories(),
   const DownloadScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Consumer<FirebaseAuthServices>(
      builder: ((context, value, child) {
        return Scaffold(
          backgroundColor: Constants.kBlackColor,
          extendBody: true,
          body: pages[value.indexClicked],
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(top: 25),
            child: CustomOutline(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Constants.kBlackColor,
                  Constants.kBlackColor,
                ],
              ),
              radius: 32,
              strokeWidth: 4,
              padding: const EdgeInsets.all(5),
              width: 64,
              height: 64,
              child: CustomOutline(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Constants.kGreenColor,
                    Constants.kPinkColor,
                  ],
                ),
                radius: 32,
                strokeWidth: 4,
                padding: const EdgeInsets.all(0),
                width: 64,
                height: 64,
                child: Container(
                  alignment: Alignment.center,
                  height: 64,
                  width: 64,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Constants.kGreenColor.withOpacity(1),
                        Constants.kPinkColor.withOpacity(1),
                      ],
                    ),
                  ),
                  child: RawMaterialButton(
                    onPressed: () {},
                    child: SvgPicture.asset(
                      Constants.kIconPlus,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: context.read<FirebaseAuthServices>().indexClicked,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white.withOpacity(0.2),
            selectedItemColor: Colors.yellow[700],
            unselectedItemColor: Color(0xFFFFFFFF),
            selectedFontSize: 14,
            unselectedFontSize: 14,
            elevation: 60,
            onTap: (value) {
              var valuee = context.read<FirebaseAuthServices>().indexClicked;
              devtools.log('$valuee');

              context.read<FirebaseAuthServices>().pageClicked(value);
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    Defaults.drawerItemIcon[0],
                  ),
                  label: Defaults.drawerItemText[0]),
              BottomNavigationBarItem(
                icon: Icon(
                  Defaults.drawerItemIcon[1],
                ),
                label: Defaults.drawerItemText[1],
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Defaults.drawerItemIcon[2],
                ),
                label: Defaults.drawerItemText[2],
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Defaults.drawerItemIcon[3],
                ),
                label: Defaults.drawerItemText[3],
              ),
            ],
          ),
        );
      }),
    );
  }
}

void movieScreenIndex(int index, BuildContext context) {
  Navigator.of(context).pushNamed(RoutesManager.movieDetailsScreen);
}

class Defaults {
  static const Color drawerItemColor = Colors.blueGrey;
  static final Color? drawerItemSelectedColor = Colors.blue[700];
  static const Color drawerHeaderTextcolor = Colors.white;
  static final Color? drawerItemSelectedColorIndex = Colors.blue[100];

  static final drawerItemText = [
    'Home',
    'Cinema',
    'Categories',
    'Downloads',
  ];

  static final drawerItemIcon = [
    Icons.home,
    Icons.live_tv,
    Icons.library_add,
    Icons.download_for_offline,
  ];
}
