import 'package:get/route_manager.dart';
import 'package:hacker_new/view/details_screen.dart';
import 'package:hacker_new/view/home_screen.dart';

routes() => [
      GetPage(name: "/", page: () => HomeScreen()),
      GetPage(name: "detailsScreen", page: () => DetailsScreen())
    ];
