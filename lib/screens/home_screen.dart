import 'dart:io';

import 'package:archive/archive.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_tutorial/models/tutorial_model.dart';
import 'package:video_tutorial/widgets/build_video_list.dart';
import 'package:video_tutorial/widgets/video_player_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool downloading = false;
  String filePath = '';
  String progressString = '';
  String error = '';

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
            '/data/user/0/com.example.video_tutorial/app_flutter/video1.mp4',
        title: 'Push Ups',
        thumbnail:
            'https://images.unsplash.com/photo-1599058917212-d750089bc07e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1169&q=80'),
    TutorialModel(
        rounds: 3,
        videoLink:
            '/data/user/0/com.example.video_tutorial/app_flutter/video2.mp4',
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
  Future<File?> downloadFile() async {
    final storage = await getApplicationDocumentsDirectory();
    File file = File('${storage.path}/videos.zip');
    try {
      final response = await Dio().get(
        'https://firebasestorage.googleapis.com/v0/b/instagramanalysys-b6a09.appspot.com/o/videos.zip?alt=media&token=d909e13e-2d1a-4e37-bb2b-c04993073755',
        options: Options(
          responseType: ResponseType.bytes,
          followRedirects: false,
          receiveTimeout: 0,
        ),
        onReceiveProgress: (count, total) {
          setState(() {
            progressString = (count / total * 100).toStringAsFixed(1);
          });
        },
      );
      final raf = file.openSync(mode: FileMode.write);
      raf.writeFromSync(response.data);
      raf.closeSync();
    } catch (e) {
      print(e);
    }
    unzip(file.path, storage.path);
  }

  void unzip(String zip, String path) {
    try {
      File file = File(zip);
      Archive archive = ZipDecoder().decodeBytes(file.readAsBytesSync());
      for (var archiveFile in archive) {
        File file = File('$path/${archiveFile.name}');
        print('file Path :$path/${archiveFile.name}');
        file.createSync(recursive: true);
        file.writeAsBytesSync(archiveFile.content);
      }
    } catch (e) {
      print(e);
    }
    print('decompressed');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Tutorial'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            IconButton(
                onPressed: () => downloadFile(), icon: Icon(Icons.download)),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () async {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    BuildVideoList(model: _model)));
                        // print('button pressed');
                        // final file = await getApplicationDocumentsDirectory();

                        // setState(() {
                        //   filePath = file.path;
                        // });
                        // downloadFile();
                        // unzip('$filePath/ezyzip.zip', filePath);
                        //       // print(file.path);j
                      },
                      child: Row(
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            child: Image.network(
                              _model[index].thumbnail,
                              fit: BoxFit.cover,
                              errorBuilder: ((context, error, stackTrace) =>
                                  Icon(Icons.image)),
                            ),
                          ),
                          SizedBox(
                            width: 25,
                          ),
                          Text(
                            excerciseType[index],
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 25,
                          ),
                          // IconButton(
                          //     onPressed: () {
                          //       print('button pressed');
                          //     },
                          //     icon: Icon(Icons.download))
                          // IconButton(
                          //     onPressed: () {
                          //       print('button pressed');
                          //       // final file = getApplicationDocumentsDirectory();
                          //       // downloadFile();
                          //       // unzip(file.path,
                          //       //     '/storage/emulated/0');
                          //       // print(file.path);
                          //     },
                          //     icon: Icon(
                          //         downloading ? Icons.downloading : Icons.download)),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Column(
                      children: [
                        SizedBox(
                          height: 50,
                        ),
                        Text(filePath),
                        Text(progressString),
                        SelectableText(error),
                      ],
                    );
                  },
                  itemCount: _model.length),
            ),
          ],
        ),
      ),
    );
  }
}
