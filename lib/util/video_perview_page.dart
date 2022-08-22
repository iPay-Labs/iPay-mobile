import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:acy_ipay/color/colors.dart';
import 'package:acy_ipay/utils/navigator_utils.dart';
import 'package:acy_ipay/widget/base_scaffold.dart';
import 'package:acy_ipay/widget/tap_widget.dart';

import '../../widget/video_play_widget.dart';

class VideoArguments{

  static const int actionTypeMore = 1;
  static const int actionTypeDelete = 2;

  String url;
  int? actionType;///1更多 2删除
  bool hero;
  bool autoPlay;
  String? cacheId;

  VideoArguments({required this.url, this.actionType,this.hero = false,this.autoPlay = false,this.cacheId});
}

class VideoPerviewPage extends StatefulWidget {

  static const String routeName = '/VideoPerviewPage';

  const VideoPerviewPage({Key? key}) : super(key: key);

  @override
  State<VideoPerviewPage> createState() => _VideoPerviewPageState();
}

class _VideoPerviewPageState extends State<VideoPerviewPage> {

  late VideoArguments _arguments;

  @override
  void initState() {
    _arguments = Get.arguments;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      body: VidwoPlayWidget(path: _arguments.url,hero: _arguments.hero,autoPlay: _arguments.autoPlay,cacheId: _arguments.cacheId,),
      actions: [
        if(_arguments.actionType == VideoArguments.actionTypeDelete)
          TapWidget(onTap: () {
            NavigatorUtils.pop(VideoArguments.actionTypeDelete);
          },
          child: const Icon(Icons.delete,color: Colours.black,))
      ],
    );
  }

}
