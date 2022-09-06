import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';

import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen(
      {Key? key, required this.url, required this.movieTitle})
      : super(key: key);
  final String movieTitle;

  final String url;

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  ChewieController? _chewieController;
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    super.initState();
    initializeVideoPlayer();
  }

  @override
  void dispose() {
    super.dispose();
    _videoPlayerController.dispose();
    _chewieController!.dispose();
  }

  Future<ChewieController?> initializeVideoPlayer() async {
    _videoPlayerController = VideoPlayerController.network(widget.url);
    await _videoPlayerController.initialize();
    _chewieController =
        ChewieController(videoPlayerController: _videoPlayerController);
    return _chewieController;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text(widget.movieTitle),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.black,
        ),
        body: FutureBuilder(
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Center(
                  child: Text(
                    '${snapshot.error} occurred',
                    style: TextStyle(fontSize: 18),
                  ),
                );
              } else if (snapshot.hasData) {
                return Expanded(
                  child: Chewie(
                    controller: _chewieController!,
                  ),
                );
              }
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
          future: initializeVideoPlayer(),
        ));
  }
}

List<VideoPlayerScreen> moviePlayer = [
  VideoPlayerScreen(movieTitle: '', url: 'url'),
  VideoPlayerScreen(movieTitle: '', url: 'url'),
  VideoPlayerScreen(
      movieTitle: 'Eternals',
      url:
          'https://b.mandela.h.sabishare.com/dl/aCWqrAphP70/81d77010f9d33b8620b5c8192c3c28a4247497cc247a709a16f22a66c78e1c55/Eternals_(2021)_(NetNaija.com).mp4'),
];
