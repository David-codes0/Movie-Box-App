import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:vidflix/screens/appprogress_anime.dart';
import 'package:vidflix/screens/main_homepage_movie.dart';

class DownloadScreen extends StatefulWidget {
  const DownloadScreen({Key? key}) : super(key: key);

  @override
  State<DownloadScreen> createState() => _DownloadScreenState();
}

class _DownloadScreenState extends State<DownloadScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: screenHeight,
      width: screenWidth,
      child: Stack(children: [
        const PageBlurColor1(),
        PageBlurColor2(screenHeight: screenHeight),
        const PageBlurColor3(),
        SafeArea(
          child: ListView(
            children: [
              const SizedBox(
                height: 10,
              ),
              const LottieAni(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      'No Download! ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.error,
                    color: Colors.red,
                    size: 40,
                  )
                ],
              )
            ],
          ),
        )
      ]),
    );
  }
}
