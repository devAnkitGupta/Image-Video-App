import 'package:flutter/material.dart';
import 'package:rs_test/domain/entities/image_media_entity.dart';
import 'package:rs_test/presentation/dashboard/favorite/bloc/favorite_bloc_bloc.dart';
import 'package:rs_test/presentation/dashboard/photos/view_photo_details.dart';
import 'package:rs_test/presentation/widgets/favorite_button.dart';

class PhotoCard extends StatelessWidget {
  final ImageMediaEntity imageMediaEntity;
  final FavoriteBlocBloc bloc;
  final bool showButton;
  const PhotoCard({
    Key? key,
    required this.imageMediaEntity,
    required this.bloc,
    required this.showButton,
  }) : super(key: key);

  void toggle() {
    if (imageMediaEntity.isSelected == true) {
      imageMediaEntity.isSelected = false;
      bloc.add(RemoveFavoriteEvent(imageMediaEntity));
    } else {
      imageMediaEntity.isSelected = true;
      bloc.add(AddFavoriteEvent(imageMediaEntity));
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
              ViewPhotoDetails(imageMediaEntity: imageMediaEntity))),
      child: _buildPhotoStack(context),
    );
  }

  Stack _buildPhotoStack(BuildContext context) => Stack(
        children: [
          _buildBackgroundImage(),
          // This is a thing that I have would designed better so it could be operated from Favorites Screen
         if(showButton) FavoriteButton(    
            callback: () {
              toggle();
            },
            isSelected: imageMediaEntity.isSelected,
          ) ,
          Positioned(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.black54,
              ),
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: _buildRowInfo(context),
            ),
          ),
        ],
      );

  Row _buildRowInfo(BuildContext context) => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.person,
            color: Colors.white,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            imageMediaEntity.photographer,
            style: Theme.of(context)
                .textTheme
                .bodyText1
                ?.copyWith(color: Colors.white),
          ),
        ],
      );

  Container _buildBackgroundImage() => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          image: DecorationImage(
            image: NetworkImage(imageMediaEntity.src.medium),
            fit: BoxFit.cover,
          ),
        ),
        height: 180,
      );
}
