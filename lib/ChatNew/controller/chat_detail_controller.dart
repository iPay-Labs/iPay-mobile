import 'dart:collection';

import 'package:get/get.dart';
import 'package:leancloud_official_plugin/leancloud_plugin.dart';
import 'package:leancloud_storage/leancloud.dart';
import 'package:acy_ipay/base/base_getx.dart';
import 'package:acy_ipay/utils/navigator_utils.dart';


class ChatDetailContoller extends BaseXController{

  late Conversation conversation;

  @override
  void onInit() {
    super.onInit();
    conversation = Get.arguments;
  }

  chatPin(bool pin) async {
   // await ChatManagerController.instance.chatPin(conversation, pin);
   update();
  }

  chatMute(bool mute) async {
    // await ChatManagerController.instance.chatMute(conversation, mute);
    update();
  }

  void quit() async {
    // var bool = await ChatManagerController.instance.deleteChat(conversation);
    // if(bool){
    //   NavigatorUtils.until(MainPage.routeName);
    // }
  }

  void inviteMember(Set<String> members){
    lcPost(() async {
      await conversation.addMembers(members: members);
      update();
    });
  }

  updateChatName(String name) async {
    // await ChatManagerController.instance.updateChatName(conversation, name);
    update();
  }

}