part of 'favorite_bloc_bloc.dart';

@immutable
abstract class FavoriteBlocEvent {}

class AddFavoriteEvent extends FavoriteBlocEvent {
  final Object media;
  AddFavoriteEvent(this.media);
}

class RemoveFavoriteEvent extends FavoriteBlocEvent {
  final Object media;
  RemoveFavoriteEvent(this.media);
}
