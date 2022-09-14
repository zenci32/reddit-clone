import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:reddit_clone/constant/api_constant.dart';
import 'package:reddit_clone/model/reddit_model.dart';
import 'package:http/http.dart' as http;
part 'reddit_event.dart';
part 'reddit_state.dart';

typedef HttpClient = http.Client;

class RedditBloc extends Bloc<RedditEvent, RedditState> {
  RedditBloc({required HttpClient client})
      : _client = client,
        super(const RedditState()) {
    on<RedditFetched>(
      _onRedditFetched,
    );
  }
  final HttpClient _client;
  Duration _redditDuration = Duration(milliseconds: 100);

  // redditDroppable(Duration duration) {
  //   return (events, mapper) {
  //     return droppable().call(events.throattle(duration), mapper);
  //   };
  // }

  Future<void> _onRedditFetched(
      RedditFetched event, Emitter<RedditState> emit) async {
    try {
      if (state.status == RedditStatus.initial) {
        final data = await _fetchReddit();
        return emit(state.copyWith(status: RedditStatus.success, data: data));
      }
    } catch (e) {
      emit(state.copyWith(
        status: RedditStatus.failure,
      ));
    }
  }

  Future<List<RedditModel>> _fetchReddit() async {
    var uri = Uri.parse(ApiConstant.baseUrl + ApiConstant.lates);
    final response = await _client.get(uri);
    if (response.statusCode == 200) {
      List<RedditModel> data = [];
      var body = await jsonDecode(response.body);
      data.add(RedditModel.fromMap(body));
      return data;
    }
    throw RedditException(error: response.body);
  }
}
