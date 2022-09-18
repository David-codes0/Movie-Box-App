import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieAni extends StatefulWidget {
  const LottieAni({Key? key}) : super(key: key);

  @override
  State<LottieAni> createState() => _LottieAniState();
}

class _LottieAniState extends State<LottieAni> {
  late Widget lottie;
  @override
  void initState() {
    lottie = Lottie.asset(
      "assets/lottie/94051-sad-man.json",
      // fit: BoxFit.fill,
      width: 100,
      height: 500,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return lottie;
  }
}
