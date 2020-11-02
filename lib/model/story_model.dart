class StoryModel {
  int id;
  String createdAt;
  int createdAtI;
  String type;
  String author;
  String title;
  String url;
  String text;
  int points;
  int parentId;
  int storyId;
  List<Children> children;

  StoryModel(
      {this.id,
      this.createdAt,
      this.createdAtI,
      this.type,
      this.author,
      this.title,
      this.url,
      this.text,
      this.points,
      this.parentId,
      this.storyId,
      this.children});

  StoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    createdAtI = json['created_at_i'];
    type = json['type'];
    author = json['author'];
    title = json['title'];
    url = json['url'];
    text = json['text'];
    points = json['points'];
    parentId = json['parent_id'];
    storyId = json['story_id'];
    if (json['children'] != null) {
      children = new List<Children>();
      json['children'].forEach((v) {
        children.add(new Children.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['created_at_i'] = this.createdAtI;
    data['type'] = this.type;
    data['author'] = this.author;
    data['title'] = this.title;
    data['url'] = this.url;
    data['text'] = this.text;
    data['points'] = this.points;
    data['parent_id'] = this.parentId;
    data['story_id'] = this.storyId;
    if (this.children != null) {
      data['children'] = this.children.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Children {
  int id;
  String createdAt;
  int createdAtI;
  String type;
  String author;
  String title;
  String url;
  String text;
  int points;
  int parentId;
  int storyId;
  List<Children> children;
  Children(
      {this.id,
      this.createdAt,
      this.createdAtI,
      this.type,
      this.author,
      this.title,
      this.url,
      this.text,
      this.points,
      this.parentId,
      this.storyId,
      this.children});

  Children.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    createdAtI = json['created_at_i'];
    type = json['type'];
    author = json['author'];
    title = json['title'];
    url = json['url'];
    text = json['text'];
    points = json['points'];
    parentId = json['parent_id'];
    storyId = json['story_id'];

    if (json['children'] != null) {
      children = new List<Children>();
      json['children'].forEach((v) {
        children.add(new Children.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['created_at_i'] = this.createdAtI;
    data['type'] = this.type;
    data['author'] = this.author;
    data['title'] = this.title;
    data['url'] = this.url;
    data['text'] = this.text;
    data['points'] = this.points;
    data['parent_id'] = this.parentId;
    data['story_id'] = this.storyId;
    return data;
  }
}
