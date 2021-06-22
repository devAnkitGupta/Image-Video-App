import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rs_test/di/injector.dart';
import 'package:rs_test/domain/entities/image_media_entity.dart';
import 'package:rs_test/domain/entities/video_media_entity.dart';
import 'package:rs_test/presentation/dashboard/favorite/bloc/favorite_bloc_bloc.dart';
import 'package:rs_test/presentation/dashboard/photos/photo_card.dart';
import 'package:rs_test/presentation/dashboard/videos/video_cards.dart';

class Favorites extends StatefulWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  late FavoriteBlocBloc favoriteBloc;

  @override
  void initState() {
    favoriteBloc = Injector.resolve<FavoriteBlocBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: _buildAppBar(),
        body: BlocBuilder<FavoriteBlocBloc, FavoriteBlocState>(
          builder: (context, state) {
            return state.mediaList.length == 0
                ? SizedBox()
                : ListView.separated(
                    key: Key(state.mediaList.length.toString()),
                    padding: EdgeInsets.symmetric(horizontal: 16,vertical: 16),
                    itemCount: state.mediaList.length,
                    itemBuilder: (context, index) {
                      if (state.mediaList[index] is ImageMediaEntity) {
                        return PhotoCard(
                          imageMediaEntity:
                              state.mediaList[index] as ImageMediaEntity,
                          bloc: favoriteBloc,
                          showButton: false,
                        );
                      } else {
                        return VideoCard(
                            videoMediaEntity:
                                state.mediaList[index] as VideoMediaEntity,
                            bloc: favoriteBloc,
                            showButton: false,
                            );
                      }
                    },
                    separatorBuilder: (context, index) => const SizedBox(height: 8,),
                  );
          },
        ),
      );

  AppBar _buildAppBar() => AppBar(
        title: Text('Favorites'),
      );
}
