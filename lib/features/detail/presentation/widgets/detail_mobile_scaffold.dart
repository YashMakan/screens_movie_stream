import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:screens_movie_stream/config/assets/asset.dart';
import 'package:screens_movie_stream/core/constants/contants.dart';
import 'package:screens_movie_stream/core/widgets/horizontal_movie_tile.dart';
import 'package:screens_movie_stream/dependencies.dart';
import 'package:screens_movie_stream/features/detail/presentation/controllers/detail_controller.dart';
import 'package:screens_movie_stream/features/home/domain/entities/movie.dart';

class DetailMobileScaffold extends StatefulWidget {
  final MovieEntity movie;

  const DetailMobileScaffold({super.key, required this.movie});

  @override
  State<DetailMobileScaffold> createState() => _DetailMobileScaffoldState();
}

class _DetailMobileScaffoldState extends State<DetailMobileScaffold> {
  final controller = Get.put(sl<DetailController>());

  @override
  void initState() {
    controller.getMovieDetails(widget.movie.id);
    super.initState();
  }

  @override
  void dispose() {
    controller.player.value?.dispose();
    controller.player.value = null;
    controller.isDownloadInitiated.value = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: CustomColors.blackShade200,
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: Image.asset(Assets.images.logo),
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            const Divider(
              thickness: 4,
              height: 4,
              color: Color(0xFF363536),
            ),
            Obx(() {
              return controller.player.value != null
                  ? VlcPlayer(
                    controller: controller.player.value!,
                    aspectRatio: 16 / 9,
                    placeholder:
                        const Center(child: CircularProgressIndicator()),
                  )
                  : GestureDetector(
                      onTap: () {
                        controller.downloadAndStream(widget.movie.id);
                      },
                      child: SizedBox(
                          height: 30.h,
                          child: Stack(
                            children: [
                              HorizontalMovieTile(
                                movie: widget.movie,
                                width: 100.w,
                              ),
                              Center(
                                child: controller.isDownloadInitiated.isTrue
                                    ? const Center(
                                        child: CircularProgressIndicator(),
                                      )
                                    : const CircleAvatar(
                                        backgroundColor: CustomColors.red,
                                        maxRadius: 26,
                                        foregroundColor: Colors.white,
                                        child: Icon(
                                          Icons.play_arrow,
                                          size: 26,
                                        ),
                                      ),
                              ),
                            ],
                          )),
                    );
            }),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  Text(widget.movie.title ?? "",
                      style: textTheme.headlineSmall
                          ?.copyWith(fontWeight: FontWeight.w600)),
                  Row(
                    children: [
                      Text(
                        "${DateFormat("yyyy").format(widget.movie.date!)} • ${widget.movie.vote?.toStringAsFixed(1)} ⭐",
                        style:
                            textTheme.bodyMedium?.copyWith(color: Colors.grey),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Icon(
                              Icons.playlist_add,
                              size: 28,
                              color: CustomColors.blackShade800,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Watchlist',
                              style:
                                  TextStyle(color: CustomColors.blackShade800),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Icon(
                              Icons.share_outlined,
                              size: 28,
                              color: CustomColors.blackShade800,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Share',
                              style:
                                  TextStyle(color: CustomColors.blackShade800),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Icon(
                              Icons.download_outlined,
                              size: 28,
                              color: CustomColors.blue,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Download',
                              style:
                                  TextStyle(color: CustomColors.blackShade800),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  Text(
                    'Description',
                    style: textTheme.headlineSmall
                        ?.copyWith(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    widget.movie.description ?? "",
                    style: textTheme.titleMedium,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
