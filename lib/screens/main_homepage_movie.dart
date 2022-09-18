import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vidflix/components/custom_page_route.dart';
import 'package:vidflix/components/masked_image.dart';
import 'package:vidflix/components/search_field_widget.dart';
import 'package:vidflix/constants.dart';
import 'package:vidflix/models/movie.dart';
import 'package:vidflix/routes/routes.dart';
import 'package:vidflix/services/firebase_auth_methods.dart';
import 'package:vidflix/utility/dialogs/logout_dialog.dart';

class MovieHomePage extends StatelessWidget {
  const MovieHomePage({
    Key? key,
  }) : super(key: key);
  void logOutUSer(BuildContext context) async {
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
    return SizedBox(
      height: screenHeight,
      width: screenWidth,
      child: Stack(
        children: [
          const PageBlurColor1(),
          PageBlurColor2(screenHeight: screenHeight),
          const PageBlurColor3(),
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
                    onPressed: () {
                      logOutUSer(context);
                    },
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
    );
  }
}

class PageBlurColor3 extends StatelessWidget {
  const PageBlurColor3({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
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
    );
  }
}

class PageBlurColor2 extends StatelessWidget {
  const PageBlurColor2({
    Key? key,
    required this.screenHeight,
  }) : super(key: key);

  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Positioned(
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
    );
  }
}

class PageBlurColor1 extends StatelessWidget {
  const PageBlurColor1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
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
    );
  }
}
