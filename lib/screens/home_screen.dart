import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:video_tutorial/const/colors.dart';
import 'package:video_tutorial/models/tutorial_model.dart';
import 'package:video_tutorial/widgets/build_video_list.dart';
import 'package:video_tutorial/widgets/video_player_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> excerciseType = [
    'Leg\'s Excercise',
    'Chest Excercise',
    'Shoulder Excercise',
    'Back Excercise',
    'Biceps Exercise'
  ];
  final List<TutorialModel> _model = const [
    TutorialModel(
        rounds: 2,
        videoLink:
            'https://joy.videvo.net/videvo_files/video/free/2018-05/large_watermarked/180419_Boxing_15_06_preview.mp4',
        title: 'Push Ups',
        time: '15 mins',
        // thumbnail:
        //     'https://images.unsplash.com/photo-1599058917212-d750089bc07e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1169&q=80'),
        thumbnail: 'assets/2.png'),
    TutorialModel(
        rounds: 3,
        videoLink:
            'https://joy.videvo.net/videvo_files/video/free/2018-09/large_watermarked/180419_Boxing_06_01_preview.mp4',
        title: 'Pull Ups',
        time: '20 mins',
        thumbnail: 'assets/3.png'),
    // thumbnail:
    //     'https://images.unsplash.com/photo-1538805060514-97d9cc17730c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
    TutorialModel(
        rounds: 1,
        videoLink:
            'https://joy.videvo.net/videvo_files/video/free/2018-06/large_watermarked/180419_Boxing_15_09_preview.mp4',
        title: 'Dumbles',
        time: '10 mins',
        thumbnail: 'assets/4.png'),
    // thumbnail:
    //     'https://images.unsplash.com/photo-1599552683573-9dc48255fe85?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
    TutorialModel(
        rounds: 2,
        videoLink:
            'https://joy.videvo.net/videvo_files/video/free/2019-03/large_watermarked/180419_Boxing_17_13_preview.mp4',
        title: 'Squats',
        time: '35 mins',
        thumbnail: 'assets/2.png'),
    // thumbnail:
    //     'https://images.unsplash.com/photo-1595078475328-1ab05d0a6a0e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=400&q=80'),
    TutorialModel(
        rounds: 4,
        videoLink:
            'https://joy.videvo.net/videvo_files/video/free/2019-03/large_watermarked/180419_Boxing_17_10_preview.mp4',
        title: 'Dumbles',
        time: '10 mins',
        thumbnail: 'assets/3.png'),
    // thumbnail:
    //     'https://images.unsplash.com/photo-1518611012118-696072aa579a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
  ];

  Widget header(Size size) {
    return Container(
      height: size.height / 12,
      width: size.width,
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Icon(
              Icons.menu,
              color: color[2],
            ),
          ),
          SizedBox(
            width: size.width / 1.85,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Icon(
              Icons.search,
              color: color[2],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: Icon(
              Icons.notifications,
              color: color[2],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            width: size.width / 1.15,
            child: Text(
              "Select Your",
              style: TextStyle(
                fontSize: 25,
                color: color[2],
              ),
            ),
          ),
          Container(
            width: size.width / 1.15,
            child: Text(
              "Favourite Workout",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: color[2],
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return WorkoutTile(index: index, model: _model);

                  // return GestureDetector(
                  //   onTap: (() {
                  //     Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //             builder: (context) => BuildVideoList(model: _model)));
                  //   }),
                  //   child: Row(
                  //     children: [
                  //       Container(
                  //         height: 100,
                  //         width: 100,
                  //         child: Image.network(
                  //           _model[index].thumbnail,
                  //           fit: BoxFit.cover,
                  //         ),
                  //       ),
                  //       SizedBox(
                  //         width: 30,
                  //       ),
                  //       Text(
                  //         excerciseType[index],
                  //         style:
                  //             TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  //       ),
                  //     ],
                  //   ),
                  // );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 12,
                  );
                },
                itemCount: _model.length),
          ),
        ],
      ),
    );
  }
}

class WorkoutTile extends StatefulWidget {
  final int index;
  final List<TutorialModel> model;

  const WorkoutTile({super.key, required this.index, required this.model});

  @override
  State<WorkoutTile> createState() => _WorkoutTileState();
}

class _WorkoutTileState extends State<WorkoutTile> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: (() {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => BuildVideoList(model: widget.model)));
      }),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: size.height / 3.8,
          width: size.width / 1.2,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: color[widget.index]),
          child: Row(
            children: [
              Container(
                height: size.height / 3.8,
                width: size.width / 2.2,
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height / 30,
                    ),
                    Container(
                      width: size.width / 2.8,
                      child: Text(
                        widget.model[widget.index].title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Container(
                        height: size.height / 12,
                        width: size.width / 2.8,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const Text(
                                  'Total Rounds: ',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  widget.model[widget.index].rounds.toString(),
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                const Icon(
                                  Icons.timelapse,
                                  color: Colors.white,
                                ),
                                Text(
                                  widget.model[widget.index].time,
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: size.width / 2.8,
                      alignment: Alignment.centerLeft,
                      child: Container(
                        height: size.height / 13.5,
                        width: size.width / 13.5,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withOpacity(0.5),
                        ),
                        child: const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: size.height / 4,
                width: size.width / 2.3,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage(widget.model[widget.index].thumbnail),
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
