import 'dart:async';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:video_tutorial/models/tutorial_model.dart';

class BuildVideoList extends StatefulWidget {
  List<TutorialModel> model;
  bool isplaying;
  int playingIndex;
  BuildVideoList(
      {super.key,
      required this.model,
      this.isplaying = false,
      this.playingIndex = 0});

  @override
  State<BuildVideoList> createState() => _BuildVideoListState();
}

class _BuildVideoListState extends State<BuildVideoList> {
  late VideoPlayerController _controller;
  int rounds = 1;
  int currentIndex = 0;
  bool nextvideo = false;
  int _duration = 0;
  late Timer _timer;
  Timer? _restTimer;
  int restTime = 30;
  void _startTimer() {
    print('Duration : $_duration');
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_duration > 0) {
        setState(() {
          _duration--;
          print('duration: $_duration');
        });
      } else {
        _timer.cancel();
        print('video Ended');
        setState(() {
          rounds--;
        });
        if (rounds > 0) {
          _startRest();
        } else {
          setState(() {
            nextvideo = true;
          });
          _startRest();
        }
      }
    });
  }

  void _startRest() {
    restTime = 10;
    _restTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (restTime > 0) {
        setState(() {
          restTime--;
          print('rest time : $restTime');
        });
      } else {
        _restTimer?.cancel();
        print('rest time ended!');
        if (rounds > 0) {
          _playVideo(index: currentIndex);
        } else {
          _playVideo(index: currentIndex + 1);
          setState(() {
            nextvideo = false;
          });
        }
      }
    });
  }

  void _playVideo({int index = 0, bool init = false}) {
    if (index < 0 || index >= widget.model.length) return;
    if (!init) {
      _controller.pause();
      _timer.cancel();
    } else {
      rounds = widget.model[index].rounds;
      print('Rounds  :  $rounds');
    }
    if (!init && currentIndex != index) {
      rounds = widget.model[index].rounds;
      print('Rounds  :  $rounds');
    }
    setState(() {
      currentIndex = index;
    });
    _controller =
        VideoPlayerController.network(widget.model[currentIndex].videoLink)
          ..addListener(() => setState(() {}))
          ..setLooping(false)
          ..initialize().then((value) {
            setState(() {
              _duration = _controller.value.duration.inSeconds;
            });
            _controller.play();
            _startTimer();
          });
  }

  @override
  void initState() {
    _playVideo(init: true);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercise Type'),
      ),
      body: Column(
        children: [
          _restTimer?.isActive ?? false
              ? Container(
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  height: 250,
                  color: Colors.black,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        nextvideo ? 'Next Video' : 'Take Rest',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        restTime.toString(),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ))
              : Container(
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  color: Colors.black,
                  height: 250,
                  child: _controller.value.isInitialized
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 200,
                              child: GestureDetector(
                                onTap: (() {
                                  // if (rounds > 0) {
                                  if (_controller.value.isPlaying) {
                                    _controller.pause();
                                    _timer.cancel();
                                  } else {
                                    _controller.play();
                                    _startTimer();
                                  }
                                  // }
                                  // else {
                                  //   _playVideo(index: currentIndex, init: true);
                                  // }
                                }),
                                child: Stack(children: [
                                  VideoPlayer(_controller),
                                  _controller.value.isPlaying
                                      ? SizedBox()
                                      : Center(
                                          child: rounds > 0
                                              ? Icon(
                                                  Icons.play_arrow,
                                                  color: Colors.white,
                                                  size: 25,
                                                )
                                              : Icon(
                                                  Icons.replay_outlined,
                                                  color: Colors.white,
                                                  size: 25,
                                                ),
                                        ),
                                ]),
                              ),
                            ),
                            VideoProgressIndicator(_controller,
                                allowScrubbing: false),
                          ],
                        )
                      : Center(child: CircularProgressIndicator()),
                ),
          Expanded(
            child: ListView.separated(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                separatorBuilder: ((context, index) => SizedBox(
                      height: 30.0,
                    )),
                itemCount: widget.model.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        color: widget.isplaying && widget.playingIndex == index
                            ? Colors.black26
                            : null,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 100,
                              width: 100,
                              child: Image.network(
                                widget.model[index].thumbnail,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(widget.model[index].title),
                            Text('Rounds : '),
                            CircleAvatar(
                              child:
                                  Text(widget.model[index].rounds.toString()),
                            ),
                          ],
                        ),
                      ),
                    ),
                    onTap: () {
                      _playVideo(index: index);
                      setState(() {
                        nextvideo = false;
                        _restTimer?.cancel();
                      });
                    },
                  );
                }),
          ),
        ],
      ),
    );
  }
}
