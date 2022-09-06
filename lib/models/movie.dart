import 'package:flutter/material.dart';
import 'package:vidflix/screens/movies_detail_screen.dart';

class Movie {
  Movie({
    this.movieName = '',
    this.moviePoster = '',
    this.movieReleaseYear = '',
    this.movieCategory = '',
    this.movieDuration = '',
    this.movieRating = '',
    this.movieSinopsis = '',
    this.movieCast = const [],
    this.movieCastImage = const [],
    this.child = const SorryPage(),
  });

  String movieName;
  String moviePoster;
  String movieReleaseYear;
  String movieCategory;
  String movieDuration;
  String movieRating;
  String movieSinopsis;
  List<Map<String, String>> movieCast;
  List<String> movieCastImage;
  Widget child;
  // Widget moviePage;
}

var newMovies = [
  Movie(
    movieName: 'Spider-Man: No Way Home',
    moviePoster: 'assets/movie-posters/img-spiderman.jpg',
    movieReleaseYear: '2021',
    movieCategory: 'Action-Adventure-Fantasy',
    movieDuration: '2h 28m',
    movieRating: '4.7',
    movieSinopsis:
        'With Spider-Man\'s identity now revealed, Peter asks Doctor Strange for help. When a spell goes wrong, dangerous foes from other worlds start to appear, forcing Peter to discover what it truly means to be Spider-Man.',
    movieCast: [
      {
        'image': '',
        'name': 'Tom Holland',
      },
      {
        'image': '',
        'name': 'Zendaya',
      },
      {
        'image': '',
        'name': 'Benedict Cumberbatch',
      },
    ],
    child: const MovieDetailsScreen(
      castMovieIndex: 0,
      movieDuration: '2h 28m',
      movieName: '',
      moviePostImage: 'assets/movie-posters/img-spiderman.jpg',
      movieSinopsis:
          'With Spider-Man\'s identity now revealed,\n Peter asks Doctor Strange for help. \nWhen a spell goes wrong, dangerous\n foes from other worlds start to appear, forcing Peter to discover what it truly means to be Spider-Man.',
    ),
  ),
  Movie(
    movieName: 'The Matrix Resurrections',
    moviePoster: 'assets/movie-posters/img-matrix.jpg',
    movieReleaseYear: '2021',
    movieCategory: 'Action-Sci-Fi',
    movieDuration: '2h 28m',
    movieRating: '3.5',
    movieSinopsis:
        'Return to a world of two realities: one, everyday life; the other, what lies behind it. To find out if his reality is a construct, to truly know himself, Mr. Anderson will have to choose to follow the white rabbit once more.',
    movieCast: [
      {
        'image': '',
        'name': 'Keanu Reeves',
      },
      {
        'image': '',
        'name': 'Carrie-Anne Moss',
      },
      {
        'image': '',
        'name': 'Yahya Abdul-Mateen II',
      },
    ],
    child: const MovieDetailsScreen(
      castMovieIndex: 1,
      movieDuration: '2h 28m',
      movieName: 'The Matrix Resurrections',
      moviePostImage: 'assets/movie-posters/img-matrix.jpg',
      movieSinopsis:
          'Return to a world of two realities:\n one, everyday life; the other, what lies behind it. \nTo find out if his reality is a construct, to truly know himself,\n Mr. Anderson will have to choose to follow the white rabbit once more.',
    ),
  ),
  Movie(
    movieName: 'Eternals',
    moviePoster: 'assets/movie-posters/img-eternals.jpg',
    movieReleaseYear: '2021',
    movieCategory: 'Action-Adventure-Fantasy',
    movieDuration: '2h 36m',
    movieRating: '4.2',
    movieSinopsis:
        'The saga of the Eternals, a race of immortal beings who lived on Earth and shaped its history and civilizations.',
    movieCast: [
      {
        'image': 'assets/movie-cast-img/castimg-1.jpg',
        'name': 'Angelina Jolie',
      },
      {
        'image': 'assets/movie-cast-img/castimg-2.jpg',
        'name': 'Gemma Chan',
      },
      {
        'image': 'assets/movie-cast-img/castimg-3.jpg',
        'name': 'Salma Hayek',
      },
      {
        'image': 'assets/movie-cast-img/castimg-4.jpg',
        'name': 'Richard Madden',
      },
    ],
    child: const MovieDetailsScreen(
      castMovieIndex: 2,
      movieDuration: '2h 36m',
      movieName: 'Eternals',
      moviePostImage: 'assets/movie-posters/Group-1.png',
      movieSinopsis:
          'The saga of the Eternals, a race of\nimmortal beings who lived on Earth\nand shaped its history and\ncivilizations.',
    ),
  ),
];

var upcomingMovies = [
  Movie(
    movieName: 'Aquaman',
    moviePoster: 'assets/movie-posters/img-aquaman.jpg',
    movieReleaseYear: '2018',
    movieCategory: 'Action-Adventure-Fantasy',
    movieDuration: '2h 23m',
    movieRating: '4.3',
    movieSinopsis:
        'Arthur Curry, the human-born heir to the underwater kingdom of Atlantis, goes on a quest to prevent a war between the worlds of ocean and land.',
    movieCast: [
      {
        'image': '',
        'name': 'Jason Momoa',
      },
      {
        'image': '',
        'name': 'Amber Heard',
      },
      {
        'image': '',
        'name': 'Willem Dafoe',
      },
    ],
  ),
  Movie(
    movieName: 'Batman',
    moviePoster: 'assets/movie-posters/img-batman.jpg',
    movieReleaseYear: '2022',
    movieCategory: 'Action-Crime-Drama',
    movieDuration: '2h 56m',
    movieRating: '4.7',
    movieSinopsis:
        'When the Riddler, a sadistic serial killer, begins murdering key political figures in Gotham, Batman is forced to investigate the city\'s hidden corruption and question his family\'s involvement.',
    movieCast: [
      {
        'image': '',
        'name': 'Robert Pattinson',
      },
      {
        'image': '',
        'name': 'Zoë Kravitz',
      },
      {
        'image': '',
        'name': 'Jeffrey Wright',
      },
    ],
  ),
  Movie(
    movieName: 'Sonic the Hedgehog 2',
    moviePoster: 'assets/movie-posters/img-sonic.jpg',
    movieReleaseYear: '2022',
    movieCategory: 'Animation-Action-Adventure',
    movieDuration: '2h 2m',
    movieRating: '4.5',
    movieSinopsis:
        'When the manic Dr Robotnik returns to Earth with a new ally, Knuckles the Echidna, Sonic and his new friend Tails is all that stands in their way.',
    movieCast: [
      {'image': '', 'name': 'Ben Schwartz'},
      {
        'image': '',
        'name': 'Idris Elba',
      },
      {
        'image': '',
        'name': 'Colleen O\'Shaughnessey',
      },
    ],
  ),
];

class SorryPage extends StatelessWidget {
  const SorryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text('Sorry No Movie'),
    );
  }
}
