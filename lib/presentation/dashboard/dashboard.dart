import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rs_test/di/injector.dart';
import 'package:rs_test/presentation/dashboard/dashboard_data.dart';
import 'bloc/dashboard_bloc.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late DashboardBloc _dashboardBloc;

  @override
  void initState() {
    _dashboardBloc = Injector.resolve<DashboardBloc>();
    super.initState();
  }

  @override
  BlocBuilder build(BuildContext context) {
    return _buildDashboard();
  }

  BlocBuilder<DashboardBloc, DashboardState> _buildDashboard() =>
      BlocBuilder<DashboardBloc, DashboardState>(
        builder: (context, state) {
          return _buildScaffold(state);
        },
      );

  Scaffold _buildScaffold(DashboardState state) => Scaffold(
        body: IndexedStack(
          index: state.index,
          children: DashboardData.dashboardPages,
        ),
        bottomNavigationBar: _buildBottomNavigation(),
      );

  BottomNavigationBar _buildBottomNavigation() => BottomNavigationBar(
        currentIndex: _dashboardBloc.state.index,
        onTap: (value) => _dashboardBloc.add(ChangeTabEvent(value)),
        items: DashboardData.getBottomNavigationItems,
      );
}
