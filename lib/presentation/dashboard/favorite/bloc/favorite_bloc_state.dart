part of 'favorite_bloc_bloc.dart';

@immutable

abstract class FavoriteBlocState {
  final List<Object> mediaList;

  FavoriteBlocState({required this.mediaList});
}

class FavoriteInitial extends FavoriteBlocState {
  FavoriteInitial() : super(mediaList: []);
}

class UpdatedState extends FavoriteBlocState {
  final List<Object> mediaList;

  UpdatedState(this.mediaList) : super(mediaList: mediaList);
}