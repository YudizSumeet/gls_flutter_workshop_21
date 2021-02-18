import 'package:flutter/material.dart';
import 'package:flutter_whatsapp_clone/chat_list_res_model.dart';

class ChatRow extends StatelessWidget {
  Chats chat;

  ChatRow(this.chat);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15.0),
      child: Row(
        children: [
          SizedBox(
            width: 55,
            height: 55,
            child: CircleAvatar(
              backgroundColor: Color(0xffE6E6E6),
              backgroundImage: NetworkImage(chat.profilePic),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  chat.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  chat.lastMessage,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Color(0xff757575), fontSize: 15),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                chat.timeStamp,
                style: TextStyle(
                    color:
                        Color(chat.hasUnreadCount() ? 0xff00D55B : 0xff9B9B9B),
                    fontSize: 12),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Visibility(
                    visible: chat.isMute,
                    child: Icon(
                      Icons.volume_off,
                      color: Color(0xff959AA1),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Opacity(
                    opacity: chat.hasUnreadCount() ? 1 : 0,
                    child: SizedBox(
                      height: 20,
                      width: 20,
                      child: CircleAvatar(
                        backgroundColor: Color(0xff00D55B),
                        child: Text(
                          chat.unreadCount.toString(),
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
