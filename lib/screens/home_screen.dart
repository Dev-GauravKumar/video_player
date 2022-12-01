import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
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
        thumbnail:
            'https://images.unsplash.com/photo-1599058917212-d750089bc07e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1169&q=80'),
    TutorialModel(
        rounds: 3,
        videoLink:
            'https://joy.videvo.net/videvo_files/video/free/2018-09/large_watermarked/180419_Boxing_06_01_preview.mp4',
        title: 'Pull Ups',
        thumbnail:
            'https://images.unsplash.com/photo-1538805060514-97d9cc17730c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
    TutorialModel(
        rounds: 1,
        videoLink:
            'https://joy.videvo.net/videvo_files/video/free/2018-06/large_watermarked/180419_Boxing_15_09_preview.mp4',
        title: 'Dumbles',
        thumbnail:
            'https://images.unsplash.com/photo-1599552683573-9dc48255fe85?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
    TutorialModel(
        rounds: 2,
        videoLink:
            'https://joy.videvo.net/videvo_files/video/free/2019-03/large_watermarked/180419_Boxing_17_13_preview.mp4',
        title: 'Squats',
        thumbnail:
            'https://images.unsplash.com/photo-1595078475328-1ab05d0a6a0e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=400&q=80'),
    TutorialModel(
        rounds: 4,
        videoLink:
            'https://joy.videvo.net/videvo_files/video/free/2019-03/large_watermarked/180419_Boxing_17_10_preview.mp4',
        title: 'Dumbles',
        thumbnail:
            'https://images.unsplash.com/photo-1518611012118-696072aa579a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video Tutorial'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: (() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BuildVideoList(model: _model)));
                }),
                child: Row(
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      child: Image.network(
                        _model[index].thumbnail,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      excerciseType[index],
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 50,
              );
            },
            itemCount: _model.length),
      ),
    );
  }
}
