import 'package:flutter/material.dart';
import 'package:video_tutorial/models/tutorial_model.dart';
import 'package:video_tutorial/widgets/video_player_widget.dart';

class BuildVideoList extends StatelessWidget {
  List<TutorialModel> model;
  bool isplaying;
  int playingIndex;
  BuildVideoList(
      {super.key,
      required this.model,
      this.isplaying = false,
      this.playingIndex = 0});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        separatorBuilder: ((context, index) => SizedBox(
              height: 30.0,
            )),
        itemCount: model.length,
        itemBuilder: (context, index) {
          return InkWell(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  color: isplaying && playingIndex == index
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
                          model[index].thumbnail,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text(model[index].title),
                      Text('Rounds : '),
                      CircleAvatar(
                        child: Text(model[index].rounds.toString()),
                      ),
                    ],
                  ),
                ),
              ),
              onTap: () => Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => VideoPlayerWidget(
                          tutorialModel: model[index], modles: model))),
                  (route) => route.isFirst));
        });
  }
}
