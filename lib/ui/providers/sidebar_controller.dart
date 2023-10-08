import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sidebarx/sidebarx.dart';

final sideBarControllerProvider = StateProvider(
    (ref) => SidebarXController(selectedIndex: 0, extended: true));
