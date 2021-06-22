import 'package:flutter/material.dart';
import 'package:rs_test/domain/entities/image_media_entity.dart';
import 'package:rs_test/presentation/widgets/info_text.dart';

class ViewPhotoDetails extends StatelessWidget {
  final ImageMediaEntity imageMediaEntity;
  const ViewPhotoDetails({Key? key, required this.imageMediaEntity})
      : super(key: key);

  @override
  Scaffold build(BuildContext context) => _buildScaffold();

  Scaffold _buildScaffold() => Scaffold(
        body: _buildContent(),
      );

  Stack _buildContent() => Stack(
        children: [
          _buildBackgroundImage(),
          _alignInfoTexts(),
        ],
      );

  Align _alignInfoTexts() => Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8), color: Colors.black54),
          child: _buildInfoColumn(),
        ),
      );

  Column _buildInfoColumn() => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InfoText(
            lable: 'ID',
            desc: imageMediaEntity.id.toString(),
          ),
          InfoText(
            lable: 'Photo By',
            desc: imageMediaEntity.photographer,
          ),
          InfoText(
            lable: 'User Id',
            desc: imageMediaEntity.photographerId.toString(),
          ),
        ],
      );

  Image _buildBackgroundImage() => Image.network(
        imageMediaEntity.src.large,
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Center(
            child: Text('Something Went Wrong'),
          );
        },
      );
}
