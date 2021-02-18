class ChatListResModel {
  List<Chats> chats;

  ChatListResModel({this.chats});

  ChatListResModel.fromJson(Map<String, dynamic> json) {
    if (json['chats'] != null) {
      chats = new List<Chats>();
      json['chats'].forEach((v) {
        chats.add(new Chats.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.chats != null) {
      data['chats'] = this.chats.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Chats {
  String profilePic;
  String title;
  String lastMessage;
  String timeStamp;
  int unreadCount;
  bool isMute;

  Chats(
      {this.profilePic,
      this.title,
      this.lastMessage,
      this.timeStamp,
      this.unreadCount,
      this.isMute});

  Chats.fromJson(Map<String, dynamic> json) {
    profilePic = json['profilePic'];
    title = json['title'];
    lastMessage = json['lastMessage'];
    timeStamp = json['timeStamp'];
    unreadCount = json['unreadCount'];
    isMute = json['isMute'];
  }

  bool hasUnreadCount() => unreadCount != 0;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['profilePic'] = this.profilePic;
    data['title'] = this.title;
    data['lastMessage'] = this.lastMessage;
    data['timeStamp'] = this.timeStamp;
    data['unreadCount'] = this.unreadCount;
    data['isMute'] = this.isMute;
    return data;
  }
}
