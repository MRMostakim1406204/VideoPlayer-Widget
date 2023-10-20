import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

late VideoPlayerController _videoPlayerController;
late CustomVideoPlayerController _customVideoPlayerController;

@override
  void initState() {
    _videoPlayerController = VideoPlayerController.network(
      "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",)..initialize().then(
        (value) => setState(() {}));
        _customVideoPlayerController = CustomVideoPlayerController(
          context: context, videoPlayerController: _videoPlayerController,
          customVideoPlayerSettings: CustomVideoPlayerSettings(
            placeholderWidget: Center(
              child: CircularProgressIndicator(),
            ),
            deviceOrientationsAfterFullscreen: [
              DeviceOrientation.portraitUp,
            ]
          )
          );
    super.initState();
  }
  @override
  void dispose() {
    _customVideoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Video Player"),
        centerTitle: true,
      ),
      body: CustomVideoPlayer(customVideoPlayerController: _customVideoPlayerController),
    );
  }
}