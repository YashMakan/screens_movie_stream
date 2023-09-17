import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:screens_movie_stream/features/home/domain/entities/movie.dart';

class HorizontalMovieTile extends StatelessWidget {
  final MovieEntity movie;
  final double? width;

  const HorizontalMovieTile({super.key, required this.movie, this.width});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      width: width ?? 70.w,
      decoration: BoxDecoration(
          image: movie.posterImage != null
              ? DecorationImage(
                  image: NetworkImage(movie.posterImage!),
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter)
              : null),
      child: Column(
        children: [
          const Spacer(),
          Container(
            width: double.infinity,
            height: 10.h,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.7)
                ])),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  movie.title ?? "Unknown",
                  style: textTheme.titleMedium,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
