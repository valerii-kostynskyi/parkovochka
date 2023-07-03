import 'package:bloc_exempl/util/json_extension.dart';
import 'package:equatable/equatable.dart';

abstract class ListModel<T> extends Equatable {
  late final int count;
  late final String previous;
  late final String next;
  late final List<T> results;
  late final int offset;
  late final int limit;
  ListModel.fromJson(Map json) {
    count = json.parseJsonAsInt(key: 'count');
    next = json.parseJsonAsString(key: 'next');
    offset = json.parseJsonAsInt(key: 'offset');
    limit = json.parseJsonAsInt(key: 'limit');
    previous = json.parseJsonAsString(key: 'prev');
    results = json['results'] != null && json['results'] is Iterable
        ? (json['results'] as Iterable).map((e) => fromJson(e)).toList()
        : [];
  }

  T fromJson(Map json);

  @override
  List<Object?> get props => [count, previous, next, offset, limit, results];
}
