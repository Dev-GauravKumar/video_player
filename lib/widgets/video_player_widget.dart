import 'package:chewie/chewie.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';
import 'package:video_tutorial/models/tutorial_model.dart';
import 'package:video_tutorial/widgets/build_video_list.dart';

// ignore: must_be_immutable
class VideoPlayerWidget extends StatefulWidget {
  TutorialModel tutorialModel;
  List<TutorialModel> models;
  VideoPlayerWidget({
    super.key,
    required this.tutorialModel,
    required this.models,
  });

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;
  int currentIndex = 0;

  void _playVideo({int index = 0, bool init = false}) {
    if (index < 0 || index >= widget.models.length) return;
    _controller =
        VideoPlayerController.network(widget.models[currentIndex].videoLink)
          ..addListener(() => setState(() {}))
          ..setLooping(false)
          ..initialize().then((value) {
            _controller.play();
          });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              color: Colors.black,
              height: 300,
              width: width,
              child: VideoPlayer(_controller)),
          Expanded(
              child: BuildVideoList(
            model: widget.models,
            isplaying: true,
            playingIndex: widget.models.indexOf(widget.tutorialModel),
          )),
        ],
      ),
    ));
  }
}
