class PostResponse {
  int? code;
  String? message;
  List<Content>? content;

  PostResponse({this.code, this.message, this.content});

  PostResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['content'] != null) {
      content = <Content>[];
      json['content'].forEach((v) {
        content!.add(new Content.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.content != null) {
      data['content'] = this.content!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Content {
  String? title;
  String? userName;
  String? postTime;
  String? labelContent;
  int? postId;

  Content(
      {this.title,
      this.userName,
      this.postTime,
      this.labelContent,
      this.postId});

  Content.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    userName = json['user_name'];
    postTime = json['post_time'];
    labelContent = json['label_content'];
    postId = json['post_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['user_name'] = this.userName;
    data['post_time'] = this.postTime;
    data['label_content'] = this.labelContent;
    data['post_id'] = this.postId;
    return data;
  }
}