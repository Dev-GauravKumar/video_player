import 'dart:io';

import 'package:archive/archive.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
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
            'https://drive.google.com/file/d/1CZeu43Q3A7mvHAMJV0R17mYttzmZ17gA/view?usp=share_link',
        title: 'Push Ups',
        thumbnail:
            'https://images.unsplash.com/photo-1599058917212-d750089bc07e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1169&q=80'),
    TutorialModel(
        rounds: 3,
        videoLink:
            'https://drive.google.com/file/d/15FoeiA5Jl4ZWBQrEFiwKW_PAEihNEQuk/view?usp=share_link',
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
  Future<void> downloadFile() async {
    Dio dio = Dio();
    print('inside download function');
    try {
      var dir = await getApplicationDocumentsDirectory();
      print("path ${dir.path}");
      setState(() => downloading = true);
      await dio.download(
        'https://drive.google.com/u/0/uc?id=18cDB3y7lII933aE3d_a0v6WL3oX6VupK&export=download',
        '${dir.path}./ezyzip.zip',
      );
      // await dio.download(_model[0].videoLink, "${dir.path}/demo.mp4",
      //     onReceiveProgress: (rec, total) {
      //   print("Rec: $rec , Total: $total");

      //   setState(() {
      //     downloading = true;
      //     progressString = ((rec / total) * 100).toStringAsFixed(0) + "%";
      //   });
      // });
    } catch (e) {
      print(e);
    }

    setState(() {
      downloading = false;
      progressString = "Completed";
    });
    print("Download completed");
  }

  void unzip(String zip, String path) {
    File file = File(zip);
    Archive archive = ZipDecoder().decodeBytes(file.readAsBytesSync());
    for (var archiveFile in archive) {
      File file = File(path + '/' + archiveFile.name);
      file.createSync(recursive: true);
      file.writeAsBytesSync(archiveFile.content);
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
        child: ListView.separated(
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () async {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => BuildVideoList(model: _model)));
                  // print('button pressed');
                  final file = await getApplicationDocumentsDirectory();

                  setState(() {
                    filePath = file.path;
                  });
                  await downloadFile();
                  unzip('$filePath/ezyzip.zip', filePath);
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
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                ],
              );
            },
            itemCount: _model.length),
      ),
    );
  }
}
