import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:screens_movie_stream/core/constants/contants.dart';
import 'package:screens_movie_stream/core/widgets/verticle_movie_tile.dart';
import 'package:screens_movie_stream/features/home/domain/entities/movie.dart';

class HomeVerticalMovieSection extends StatelessWidget {
  final String section;
  final List<MovieEntity> movies;

  const HomeVerticalMovieSection(
      {super.key, required this.section, required this.movies});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              section,
              style:
                  textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
            ),
            TextButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4))),
                child: const Row(
                  children: [
                    Text("See all"),
                    SizedBox(width: 8),
                    Icon(
                      Icons.arrow_forward,
                      color: CustomColors.red,
                    )
                  ],
                ))
          ],
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 20.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => const SizedBox(width: 16,),
            itemBuilder: (context, index) => VerticalMovieTile(movie: movies[index]),
            itemCount: movies.length,
          ),
        )
      ],
    );
  }
}
