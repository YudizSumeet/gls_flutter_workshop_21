import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_whatsapp_clone/chat_row.dart';

import 'chat_list_res_model.dart';
import 'package:http/http.dart';

class ChatList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getChatData(),
        builder: (_, snapshot) {
          return snapshot.hasData
              ? ListView.separated(
                  itemBuilder: (_, pos) => ChatRow(ChatListResModel.fromJson(
                          jsonDecode((snapshot.data as Response).body))
                      .chats[pos]),
                  itemCount: ChatListResModel.fromJson(
                          jsonDecode((snapshot.data as Response).body))
                      .chats
                      .length,
                  separatorBuilder: (_, pos) => Row(
                    children: [
                      SizedBox(
                        width: 80,
                      ),
                      Expanded(
                        child: Divider(
                          color: Color(0xffE1E1E1),
                          thickness: 1,
                        ),
                      )
                    ],
                  ),
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        });
  }

  Future<Response> getChatData() {
    return get("https://api.jsonbin.io/b/602d6ba80665b21b00b90e15/3");
  }
}
