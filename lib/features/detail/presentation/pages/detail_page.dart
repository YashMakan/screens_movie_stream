import 'package:flutter/material.dart';
import 'package:screens_movie_stream/core/widgets/multi_device_scaffold.dart';
import 'package:screens_movie_stream/features/detail/presentation/widgets/detail_desktop_scaffold.dart';
import 'package:screens_movie_stream/features/detail/presentation/widgets/detail_mobile_scaffold.dart';
import 'package:screens_movie_stream/features/home/domain/entities/movie.dart';

class DetailPage extends StatelessWidget {
  final MovieEntity movie;
  const DetailPage({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return MultiDeviceScaffold(
      mobileScaffold: DetailMobileScaffold(movie: movie),
      desktopScaffold: const DetailDesktopScaffold(),
    );
  }
}
