import 'package:flutter/material.dart';
import 'package:screens_movie_stream/core/widgets/multi_device_scaffold.dart';
import 'package:screens_movie_stream/features/home/presentation/widgets/home_desktop_scaffold.dart';
import 'package:screens_movie_stream/features/home/presentation/widgets/home_mobile_scaffold.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MultiDeviceScaffold(
      mobileScaffold: HomeMobileScaffold(),
      desktopScaffold: HomeDesktopScaffold(),
    );
  }
}
