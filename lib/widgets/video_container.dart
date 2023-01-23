import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class AppVideoContainer extends StatefulWidget {
  const AppVideoContainer({Key? key}) : super(key: key);

  @override
  State<AppVideoContainer> createState() => _AppVideoContainerState();
}

class _AppVideoContainerState extends State<AppVideoContainer> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/videos/video.mp4');

    _controller.addListener(() {
      setState(() {});
    });
    _controller.setLooping(true);
    _controller.initialize().then((_) => setState(() {}));
    _controller.play();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Expanded(child: VideoPlayer(_controller))],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
