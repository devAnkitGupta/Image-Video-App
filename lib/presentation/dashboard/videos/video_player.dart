import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Player extends StatefulWidget {
  final String videoUrl;
  const Player({Key? key, required this.videoUrl}) : super(key: key);

  @override
  _PlayerState createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  late VideoPlayerController _controller;
  late ChewieController _chewieController;

  @override
  void initState() {
    initializePlayer(widget.videoUrl);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _chewieController.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: _controller.value.isInitialized
              ? Chewie(
                  controller: _chewieController,
                )
              : CircularProgressIndicator(),
        ),
      );

  Future<void> initializePlayer(String url) async {
    _controller = VideoPlayerController.network(url);
    await Future.wait([_controller.initialize()]);
    _chewieController = ChewieController(
      videoPlayerController: _controller,
      autoInitialize: true,
      autoPlay: true,
      errorBuilder: (context, errorMessage) => Center(
        child: Text(errorMessage),
      ),
    );
    setState(() {});   // Only a Small portion o widget tree would rebuild so avoided over Engineering
  } 
}
