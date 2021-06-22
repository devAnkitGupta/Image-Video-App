import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rs_test/presentation/dashboard/bloc/dashboard_bloc.dart';
import 'package:rs_test/presentation/dashboard/dashboard.dart';
import 'package:rs_test/presentation/dashboard/favorite/bloc/favorite_bloc_bloc.dart';
import 'package:rs_test/presentation/dashboard/photos/bloc/photos_bloc.dart';
import 'package:rs_test/presentation/dashboard/videos/bloc/videos_bloc.dart';

import 'di/injector.dart';

void main() {
  Injector.setup();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Media Studio',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiBlocProvider(providers: [
        BlocProvider(
            create: (BuildContext context) =>
                Injector.resolve<DashboardBloc>()),
        BlocProvider(
            create: (BuildContext context) => Injector.resolve<PhotosBloc>()),
        BlocProvider(
            create: (BuildContext context) => Injector.resolve<VideosBloc>()),
        BlocProvider(
            create: (BuildContext context) =>
                Injector.resolve<FavoriteBlocBloc>()),
      ], child: Dashboard()),
    );
  }
}
