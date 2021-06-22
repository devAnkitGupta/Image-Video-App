import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'favorite_bloc_event.dart';
part 'favorite_bloc_state.dart';

class FavoriteBlocBloc extends Bloc<FavoriteBlocEvent, FavoriteBlocState> {
  FavoriteBlocBloc() : super(FavoriteInitial());

  @override
  Stream<FavoriteBlocState> mapEventToState(
    FavoriteBlocEvent event,
  ) async* {
    switch (event.runtimeType) {
      case AddFavoriteEvent:
        yield* _processAddFavoriteEvent(event as AddFavoriteEvent);
        break;
      case RemoveFavoriteEvent:
        yield* _processRemoveFavoriteEvent(event as RemoveFavoriteEvent);
        break;
    }
  }

  Stream<FavoriteBlocState> _processAddFavoriteEvent(
      AddFavoriteEvent event) async* {
    state.mediaList.add(event.media);
    yield UpdatedState(state.mediaList);
  }

  Stream<FavoriteBlocState> _processRemoveFavoriteEvent(
      RemoveFavoriteEvent event) async* {
    state.mediaList.removeWhere((element) => element == event.media);
    yield UpdatedState(state.mediaList);
  }
}
