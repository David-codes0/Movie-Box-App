import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:provider/provider.dart';
import 'package:vidflix/components/custom_outline.dart';
import 'package:vidflix/components/custom_page_route.dart';
import 'package:vidflix/components/masked_image.dart';
import 'package:vidflix/components/search_field_widget.dart';
import 'package:vidflix/constants.dart';
import 'package:vidflix/models/movie.dart';
import 'package:vidflix/routes/routes.dart';
import 'package:vidflix/screens/movies_detail_screen.dart';
import 'package:vidflix/services/firebase_auth_methods.dart';
import 'package:vidflix/utility/dialogs/logout_dialog.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void logOutUSer() async {
    final shouldLogout = await showLogoutDialog(context);
    if (shouldLogout) {
      context.read<FirebaseAuthMethod>().signOut(context);
    }

    Navigator.of(context).pushNamed(RoutesManager.authWrapper);
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Constants.kBlackColor,
      extendBody: true,
      body: SizedBox(
        height: screenHeight,
        width: screenWidth,
        child: Stack(
          children: [
            Positioned(
              top: 10,
              left: -60,
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  color: Constants.kGreenColor.withOpacity(0.3),
                  shape: BoxShape.circle,
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 100,
                    sigmaY: 100,
                  ),
                  child: const SizedBox(
                    height: 200,
                    width: 200,
                  ),
                ),
              ),
            ),
            Positioned(
              top: screenHeight * 0.4,
              right: -60,
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  color: Constants.kPinkColor.withOpacity(0.3),
                  shape: BoxShape.circle,
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 100,
                    sigmaY: 100,
                  ),
                  child: const SizedBox(
                    height: 200,
                    width: 200,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              left: -60,
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  color: Constants.kGreenColor.withOpacity(0.3),
                  shape: BoxShape.circle,
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 100,
                    sigmaY: 100,
                  ),
                  child: const SizedBox(
                    height: 200,
                    width: 200,
                  ),
                ),
              ),
            ),
            SafeArea(
              bottom: false,
              child: ListView(
                primary: true,
                children: [
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: logOutUSer,
                      icon: const Icon(
                        Icons.logout,
                        color: Constants.kWhiteColor,
                      ),
                    ),
                  ),
                  const Text(
                    'What would you\nlike to watch?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 40,
                      color: Constants.kWhiteColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.03,
                  ),
                  const SearchFieldWidget(),
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'New movies',
                      style: TextStyle(
                        fontSize: 20,
                        color: Constants.kWhiteColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.002,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: SizedBox(
                      height: 200,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: newMovies.length,
                        itemBuilder: (context, index) {
                          String mask;
                          if (index == 0) {
                            mask = Constants.kMaskFirstIndex;
                          } else if (index == newMovies.length - 1) {
                            mask = Constants.kMaskLastIndex;
                          } else {
                            mask = Constants.kMaskCenter;
                          }
                          return MaterialButton(
                            onPressed: () {
                              Navigator.of(context).push(CustomRoutePage(
                                  child: newMovies[index].child,
                                  direction: AxisDirection.left));
                            },
                            child: GestureDetector(
                              child: SizedBox(
                                height: 150,
                                width: 140,
                                child: MaskedImage(
                                  asset: newMovies[index].moviePoster,
                                  mask: mask,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Upcoming movies',
                      style: TextStyle(
                        fontSize: 20,
                        color: Constants.kWhiteColor,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: SizedBox(
                      height: 160,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: upcomingMovies.length,
                        itemBuilder: (context, index) {
                          String mask;
                          if (index == 0) {
                            mask = Constants.kMaskFirstIndex;
                          } else if (index == newMovies.length - 1) {
                            mask = Constants.kMaskLastIndex;
                          } else {
                            mask = Constants.kMaskCenter;
                          }
                          return GestureDetector(
                            child: SizedBox(
                              height: 160,
                              width: 140,
                              child: MaskedImage(
                                asset: upcomingMovies[index].moviePoster,
                                mask: mask,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
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
                    Constants.kGreenColor.withOpacity(0.5),
                    Constants.kPinkColor.withOpacity(0.5),
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: GlassmorphicContainer(
        width: screenWidth,
        height: 72,
        borderRadius: 0,
        linearGradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Constants.kGreenColor.withOpacity(0.1),
            Constants.kPinkColor.withOpacity(0.1),
          ],
        ),
        border: 0,
        blur: 30,
        borderGradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Constants.kGreenColor.withOpacity(0.1),
            Constants.kPinkColor.withOpacity(0.1),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: BottomAppBar(
            color: Colors.transparent,
            elevation: 0,
            notchMargin: 4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(Constants.kIconHome),
                  ),
                ),
                Expanded(
                  child: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(Constants.kIconPlayOnTv),
                  ),
                ),
                const Expanded(
                  child: Text(''),
                ),
                Expanded(
                  child: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(Constants.kIconCategories),
                  ),
                ),
                Expanded(
                  child: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(Constants.kIconDownload),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void movieScreenIndex(int index, BuildContext context) {
  Navigator.of(context).pushNamed(RoutesManager.movieDetailsScreen);
}
