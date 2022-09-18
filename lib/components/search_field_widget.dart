import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:vidflix/constants.dart';

class SearchFieldWidget extends StatelessWidget {
  const SearchFieldWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        height: 30,
        
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: Constants.kGreyColor.withOpacity(0.2),
        ),
        child: Row(
          textBaseline: TextBaseline.ideographic,
          children: [
            const SizedBox(
              width: 5,
            ),
            SvgPicture.asset(
              Constants.kIconSearch,
              color: Constants.kGreyColor.withOpacity(0.7),
            ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 14),
                child: TextField(
                  cursorColor: Constants.kGreyColor,
                  decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: TextStyle(
                      color: Constants.kGreyColor.withOpacity(0.7),
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(),
            SvgPicture.asset(
              Constants.kIconMic,
              color: Constants.kGreyColor.withOpacity(0.7),
            ),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
      ),
    );
  }
}
