import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';
import 'package:video_tutorial/models/tutorial_model.dart';
import 'package:video_tutorial/widgets/build_video_list.dart';

// ignore: must_be_immutable
class VideoPlayerWidget extends StatefulWidget {
  TutorialModel tutorialModel;
  List<TutorialModel> modles;
  VideoPlayerWidget({
    super.key,
    required this.tutorialModel,
    required this.modles,
  });

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  int count = 0;
  String time = '';
  int duration = 0;
  bool showMessage = false;

  late VideoPlayerController _controller;
  late ChewieController _chewieController;

  // void countRound() {
  //   if (_controller.value.position.inSeconds ==
  //       _controller.value.duration.inSeconds) {
  //     setState(() {
  //       _controller.seekTo(const Duration(seconds: 0));
  //     });
  //     print("*************${_controller.value.position.inSeconds}");
  //     print(count);
  //     if (count <= 1) {
  //       _chewieController.isPlaying ? _chewieController.pause() : null;
  //       setState(() {
  //         _controller.seekTo(const Duration(seconds: 0));
  //       });
  //       print('Video Ended');
  //     } else {
  //       count--;
  //       return;
  //     }
  //   }
  //   return;
  // }
  void countRoundIncrement() {
    if (time == '0') {
      count++;
      print('***************$count');
      if (count == widget.tutorialModel.rounds) {
        _chewieController.setLooping(false);
        _chewieController.pause();
        print('+++++++++++++++++$count');
      }
    }
  }

  @override
  void initState() {
    _controller = VideoPlayerController.network(widget.tutorialModel.videoLink);
    _chewieController = ChewieController(
        videoPlayerController: _controller,
        autoInitialize: true,
        looping: true,
        autoPlay: true,
        deviceOrientationsAfterFullScreen: [DeviceOrientation.portraitUp],
        deviceOrientationsOnEnterFullScreen: [DeviceOrientation.landscapeLeft],
        maxScale: 1);
    // setState(() {
    //   count = widget.tutorialModel.rounds;
    // });
    _controller.addListener(() {
      countRoundIncrement();
      if (_controller.value.position.inSeconds.toString() != time) {
        setState(() {
          time = _controller.value.position.inSeconds.toString();
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _chewieController.dispose();
    _controller.removeListener(() {});
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
          Text(
            time,
            style: TextStyle(color: Colors.black),
          ),
          Container(
              color: Colors.black,
              height: 300,
              width: width,
              child: Chewie(controller: _chewieController)),
          Text(
            duration.toString(),
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Expanded(
              child: BuildVideoList(
            model: widget.modles,
            isplaying: true,
            playingIndex: widget.modles.indexOf(widget.tutorialModel),
          )),
        ],
      ),
    ));
  }
}
