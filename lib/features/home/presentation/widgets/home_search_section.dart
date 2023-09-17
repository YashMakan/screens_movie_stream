import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:screens_movie_stream/core/widgets/verticle_movie_tile.dart';
import 'package:screens_movie_stream/features/home/domain/entities/movie.dart';

class HomeSearchSection extends StatelessWidget {
  final List<MovieEntity> movies;

  const HomeSearchSection(
      {super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Search Results (${movies.length})',
          style:
          textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 26),
        SizedBox(
          height: 80.h,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.6,
              crossAxisSpacing: 24,
              mainAxisSpacing: 24
            ),
            itemBuilder: (context, index) => VerticalMovieTile(movie: movies[index]),
            itemCount: movies.length,
          ),
        )
      ],
    );
  }
}
