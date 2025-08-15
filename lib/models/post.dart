import 'dart:convert';

import 'package:equatable/equatable.dart';

class PostModel extends Equatable {
  const PostModel({this.posts, this.total, this.skip, this.limit});

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      posts: map['posts'] != null
          ? (map['posts'] as List<dynamic>)
                .map((e) => PostsItem.fromMap(e as Map<String, dynamic>))
                .toList()
          : null,
      total: map['total'] as int?,
      skip: map['skip'] as int?,
      limit: map['limit'] as int?,
    );
  }

  factory PostModel.fromJson(String source) =>
      PostModel.fromMap(json.decode(source) as Map<String, dynamic>);

  final List<PostsItem>? posts;
  final int? total;
  final int? skip;
  final int? limit;

  Map<String, dynamic> toMap() {
    return {
      'posts': posts?.map((x) => x.toMap()).toList(),
      'total': total,
      'skip': skip,
      'limit': limit,
    };
  }

  String toJson() => json.encode(toMap());

  PostModel copyWith({
    List<PostsItem>? posts,
    int? total,
    int? skip,
    int? limit,
  }) {
    return PostModel(
      posts: posts ?? this.posts,
      total: total ?? this.total,
      skip: skip ?? this.skip,
      limit: limit ?? this.limit,
    );
  }

  @override
  List<Object?> get props => [posts, total, skip, limit];
}

class PostsItem extends Equatable {
  const PostsItem({
    this.id,
    this.title,
    this.body,
    this.tags,
    this.reactions,
    this.views,
    this.userId,
  });

  factory PostsItem.fromMap(Map<String, dynamic> map) {
    return PostsItem(
      id: map['id'] as int?,
      title: map['title'] as String?,
      body: map['body'] as String?,
      tags: map['tags'] != null ? List<String>.from(map['tags'] as List) : null,
      reactions: map['reactions'] != null
          ? Reactions.fromMap(map['reactions'] as Map<String, dynamic>)
          : null,
      views: map['views'] as int?,
      userId: map['userId'] as int?,
    );
  }

  factory PostsItem.fromJson(String source) =>
      PostsItem.fromMap(json.decode(source) as Map<String, dynamic>);

  final int? id;
  final String? title;
  final String? body;
  final List<String>? tags;
  final Reactions? reactions;
  final int? views;
  final int? userId;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'body': body,
      'tags': tags,
      'reactions': reactions?.toMap(),
      'views': views,
      'userId': userId,
    };
  }

  String toJson() => json.encode(toMap());

  PostsItem copyWith({
    int? id,
    String? title,
    String? body,
    List<String>? tags,
    Reactions? reactions,
    int? views,
    int? userId,
  }) {
    return PostsItem(
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
      tags: tags ?? this.tags,
      reactions: reactions ?? this.reactions,
      views: views ?? this.views,
      userId: userId ?? this.userId,
    );
  }

  @override
  List<Object?> get props => [id, title, body, tags, reactions, views, userId];
}

class Reactions extends Equatable {
  const Reactions({this.likes, this.dislikes});

  factory Reactions.fromMap(Map<String, dynamic> map) {
    return Reactions(
      likes: map['likes'] as int?,
      dislikes: map['dislikes'] as int?,
    );
  }

  factory Reactions.fromJson(String source) =>
      Reactions.fromMap(json.decode(source) as Map<String, dynamic>);

  final int? likes;
  final int? dislikes;

  Map<String, dynamic> toMap() {
    return {'likes': likes, 'dislikes': dislikes};
  }

  String toJson() => json.encode(toMap());

  Reactions copyWith({int? likes, int? dislikes}) {
    return Reactions(
      likes: likes ?? this.likes,
      dislikes: dislikes ?? this.dislikes,
    );
  }

  @override
  List<Object?> get props => [likes, dislikes];
}
