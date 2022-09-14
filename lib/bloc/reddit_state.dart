part of 'reddit_bloc.dart';

enum RedditStatus { initial, success, failure }

class RedditState extends Equatable {
  final List<RedditModel> data;
  final RedditStatus status;

  const RedditState(
      {this.data = const <RedditModel>[], this.status = RedditStatus.initial});

  @override
  List<Object> get props => [data, status];

  RedditState copyWith({
    List<RedditModel>? data,
    RedditStatus? status,
  }) {
    return RedditState(
      data: data ?? this.data,
      status: status ?? this.status,
    );
  }
}
