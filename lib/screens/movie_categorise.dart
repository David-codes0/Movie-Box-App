import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:vidflix/screens/main_homepage_movie.dart';

class MovieCategories extends StatefulWidget {
  const MovieCategories({Key? key}) : super(key: key);

  @override
  State<MovieCategories> createState() => _MovieCategoriesState();
}

class _MovieCategoriesState extends State<MovieCategories>
    with TickerProviderStateMixin {
  GlobalKey<ScaffoldState> drawKey = GlobalKey();
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(
      initialIndex: 0,
      length: 3,
      vsync: this,
    );
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: TabBar(
          controller: tabController,
          indicatorColor: Colors.white,
          tabs: const [
            Tab(
              child: Text(
                'Action ',
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
            ),
            Tab(
              child: Text(
                'Comedy',
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
            ),
            Tab(
              child: Text(
                'Anime',
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
            ),
          ],
        ),
      ),
      body: SizedBox(
        height: screenHeight,
        width: screenWidth,
        child: Stack(
          children: [
            const PageBlurColor1(),
            PageBlurColor2(screenHeight: screenHeight),
            const PageBlurColor3(),
            SafeArea(
              child: TabBarView(
                controller: tabController,
                children: [
                  ListView.builder(
                    itemCount: 17,
                    itemBuilder: (context, index) =>
                        const MovieCategoriesCard(),
                  ),
                  ListView.builder(
                    itemCount: 17,
                    itemBuilder: (context, index) =>
                        const MovieCategoriesCard(),
                  ),
                  ListView.builder(
                    itemCount: 17,
                    itemBuilder: (context, index) =>
                        const MovieCategoriesCard(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    // return ;
  }
}

class MovieCategoriesCard extends StatelessWidget {
  const MovieCategoriesCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            height: 350,
            width: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: Colors.white,
            ),
            child: Expanded(
              child: Column(
                children: [
                  Container(
                      height: 300,
                      width: 350,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40)),
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image:
                              AssetImage('assets/movie-posters/img-matrix.jpg'),
                        ),
                      )),
                  const Text('The Matrix'),
                ],
              ),
            ),
          ),
        ),
        const Divider(
          height: 10,
          thickness: 5,
          endIndent: 50,
          indent: 50,
          color: Colors.grey,
        )
      ],
    );
  }
}
