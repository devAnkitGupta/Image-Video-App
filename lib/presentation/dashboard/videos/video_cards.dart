import 'package:flutter/material.dart';
import 'package:rs_test/domain/entities/video_media_entity.dart';
import 'package:rs_test/presentation/dashboard/favorite/bloc/favorite_bloc_bloc.dart';
import 'package:rs_test/presentation/dashboard/videos/video_player.dart';
import 'package:rs_test/presentation/widgets/favorite_button.dart';

class VideoCard extends StatelessWidget {
  final VideoMediaEntity videoMediaEntity;
  final FavoriteBlocBloc bloc;
  final bool showButton;
  const VideoCard({
    Key? key,
    required this.videoMediaEntity,
    required this.bloc,
    required this.showButton,
  }) : super(key: key);

  void toggle() {
    if (videoMediaEntity.isSelected == true) {
      videoMediaEntity.isSelected = false;
      bloc.add(RemoveFavoriteEvent(videoMediaEntity));
    } else {
      videoMediaEntity.isSelected = true;
      bloc.add(AddFavoriteEvent(videoMediaEntity));
    }
  }

  @override
  GestureDetector build(BuildContext context) => GestureDetector(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Player(
                  videoUrl: videoMediaEntity.videoFiles.first.link,
                ))),
        child: _buildStack(),
      );

  Stack _buildStack() => Stack(
        alignment: Alignment.center,
        children: [
          _buildBackgroungImage(),
          // This is a thing that I have would designed better so it could be operated from Favorites Screen
         if(showButton) FavoriteButton(
            callback: () {
              toggle();
            },
            isSelected: videoMediaEntity.isSelected,
          ),
          _buildPlayIcon()
        ],
      );

  Container _buildBackgroungImage() => Container(
        child: Image.network(
          videoMediaEntity.image,
          errorBuilder: (context, error, stackTrace) => Text('Image Not Found'),
        ),
      );

  Container _buildPlayIcon() => Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white70),
      child: Icon(
        Icons.play_arrow,
        size: 40,
      ));
}
