part of 'reddit_bloc.dart';

@immutable
abstract class RedditEvent extends Equatable {
  const RedditEvent();

  @override
  List<Object> get props => [];
}

@immutable
class RedditFetched extends RedditEvent {
  const RedditFetched();
}
