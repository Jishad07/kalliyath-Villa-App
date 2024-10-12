class Message {
    final String messageId;
  final String senderId;
  final String receiverId;
  final String content;
  final DateTime sentTime;
  bool read;

  Message({
    this.messageId='',
    this.read = false,
    required this.senderId,
    required this.receiverId,
    required this.sentTime,
    required this.content,
  });

  factory Message.fromJson(id,Map<String, dynamic> json) => Message(
    messageId:id ,
        read: json['read'],
        receiverId: json['receiverId'],
        senderId: json['senderId'],
        sentTime: json['sentTime'].toDate(),
        content: json['content'],
      );

  Map<String, dynamic> toJson() => {
        'read': read,
        'receiverId': receiverId,
        'senderId': senderId,
        'sentTime': sentTime,
        'content': content,
      };
}
