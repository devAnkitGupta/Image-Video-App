import 'package:flutter/material.dart';
import 'package:rs_test/presentation/dashboard/favorite/favorites.dart';
import 'package:rs_test/presentation/dashboard/photos/photos.dart';
import 'package:rs_test/presentation/dashboard/videos/videos.dart';

class DashboardData{

static List<Widget> get dashboardPages => [
  Photos(),
  Videos(),
  Favorites(),
];

static List<BottomNavigationBarItem> get getBottomNavigationItems => [
      BottomNavigationBarItem(
        icon: Icon(Icons.photo),
        label: 'Photos',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.video_collection_rounded),
        label: 'Video',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.favorite),
        label: 'Favorite',
      )
    ];
}


