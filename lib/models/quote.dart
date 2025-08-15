import 'dart:convert';

import 'package:equatable/equatable.dart';

class QuoteModel extends Equatable {
  const QuoteModel({this.quotes, this.total, this.skip, this.limit});

  factory QuoteModel.fromMap(Map<String, dynamic> map) {
    return QuoteModel(
      quotes: map['quotes'] != null
          ? (map['quotes'] as List<dynamic>)
                .map((e) => QuotesItem.fromMap(e as Map<String, dynamic>))
                .toList()
          : null,
      total: map['total'] as int?,
      skip: map['skip'] as int?,
      limit: map['limit'] as int?,
    );
  }

  factory QuoteModel.fromJson(String source) =>
      QuoteModel.fromMap(json.decode(source) as Map<String, dynamic>);

  final List<QuotesItem>? quotes;
  final int? total;
  final int? skip;
  final int? limit;

  Map<String, dynamic> toMap() {
    return {
      'quotes': quotes?.map((x) => x.toMap()).toList(),
      'total': total,
      'skip': skip,
      'limit': limit,
    };
  }

  String toJson() => json.encode(toMap());

  QuoteModel copyWith({
    List<QuotesItem>? quotes,
    int? total,
    int? skip,
    int? limit,
  }) {
    return QuoteModel(
      quotes: quotes ?? this.quotes,
      total: total ?? this.total,
      skip: skip ?? this.skip,
      limit: limit ?? this.limit,
    );
  }

  @override
  List<Object?> get props => [quotes, total, skip, limit];
}

class QuotesItem extends Equatable {
  const QuotesItem({this.id, this.quote, this.author});

  factory QuotesItem.fromMap(Map<String, dynamic> map) {
    return QuotesItem(
      id: map['id'] as int?,
      quote: map['quote'] as String?,
      author: map['author'] as String?,
    );
  }

  factory QuotesItem.fromJson(String source) =>
      QuotesItem.fromMap(json.decode(source) as Map<String, dynamic>);

  final int? id;
  final String? quote;
  final String? author;

  Map<String, dynamic> toMap() {
    return {'id': id, 'quote': quote, 'author': author};
  }

  String toJson() => json.encode(toMap());

  QuotesItem copyWith({int? id, String? quote, String? author}) {
    return QuotesItem(
      id: id ?? this.id,
      quote: quote ?? this.quote,
      author: author ?? this.author,
    );
  }

  @override
  List<Object?> get props => [id, quote, author];
}
