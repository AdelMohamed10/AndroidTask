import 'package:flutter/material.dart';
import 'package:untitled1/core/routing/my_route.dart';
import 'package:untitled1/dashboard/view/page/dashboard_page.dart';

void main() {
  MaterialApp materialApp = MaterialApp(
    // Uncomment the following line if you want DashboardPage as the initial route
    // home: DashboardPage(),
    onGenerateInitialRoutes: (_) => MyRoute.initialRoutes,
    onGenerateRoute: MyRoute.onNavigateByName,
  );
  runApp(materialApp);
}
