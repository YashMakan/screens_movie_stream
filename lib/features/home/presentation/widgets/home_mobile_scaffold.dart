import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:screens_movie_stream/config/assets/asset.dart';
import 'package:screens_movie_stream/core/constants/contants.dart';
import 'package:screens_movie_stream/core/widgets/horizontal_movie_section.dart';
import 'package:screens_movie_stream/dependencies.dart';
import 'package:screens_movie_stream/features/home/presentation/controllers/home_controller.dart';
import 'package:screens_movie_stream/features/home/presentation/widgets/home_button.dart';
import 'package:screens_movie_stream/features/home/presentation/widgets/home_search_section.dart';
import 'package:screens_movie_stream/features/home/presentation/widgets/home_vertical_movie_section.dart';

class HomeMobileScaffold extends StatefulWidget {
  const HomeMobileScaffold({super.key});

  @override
  State<HomeMobileScaffold> createState() => _HomeMobileScaffoldState();
}

class _HomeMobileScaffoldState extends State<HomeMobileScaffold> {
  final controller = Get.put(sl<HomeController>());

  @override
  void initState() {
    controller.getPopularMovies();
    controller.getDiscoveryMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: CustomColors.blackShade200,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Obx(() {
          return controller.isSearch.isTrue
              ? AppBar(
                  centerTitle: false,
                  automaticallyImplyLeading: false,
                  title: TextField(
                    controller: controller.searchController,
                    onChanged: controller.onSearchChanged,
                    cursorColor: CustomColors.blackShade400,
                    autofocus: true,
                    decoration: const InputDecoration(
                        hintStyle: TextStyle(color: Colors.white),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: CustomColors.red)),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: CustomColors.red)),
                        hintText: "Search movies..."),
                  ),
                  actions: [
                    if (controller.search.trim().isNotEmpty)
                      IconButton(
                        onPressed: controller.onSearchClicked,
                        icon: Image.asset(Assets.icons.search, width: 20),
                      ),
                    IconButton(
                      onPressed: controller.toggleSearch,
                      icon: const Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 26,
                      ),
                    ),
                  ],
                  backgroundColor: Colors.transparent,
                )
              : AppBar(
                  centerTitle: false,
                  automaticallyImplyLeading: false,
                  title: Image.asset(Assets.images.logo),
                  actions: [
                    IconButton(
                      onPressed: controller.toggleSearch,
                      icon: Image.asset(Assets.icons.search, width: 20),
                    ),
                    const SizedBox(width: 12),
                    HomeButton(text: "Sign in", onPressed: () {}),
                    const SizedBox(width: 16),
                  ],
                  backgroundColor: Colors.transparent,
                );
        }),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16),
            const Divider(
              thickness: 4,
              height: 4,
              color: Color(0xFF363536),
            ),
            Obx(
              () => controller.searchMovies.isEmpty
                  ? Column(
                      children: [
                        SizedBox(
                          height: 50.h,
                          child: Stack(
                            children: [
                              Image.asset(
                                Assets.images.signInOverlay,
                                width: double.infinity,
                                height: 50.h,
                                alignment: Alignment.bottomCenter,
                                fit: BoxFit.cover,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Welcome to BD Screens",
                                      style: textTheme.titleMedium?.copyWith(
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      "Download Unlimited\nMovies, Drama, Music Video\nand More Content.",
                                      style: textTheme.titleLarge?.copyWith(
                                          fontWeight: FontWeight.w700),
                                    ),
                                    const SizedBox(height: 16),
                                    Text(
                                      "Enjoy exclusive Music Video popular movies\nand Live shows. Subscribe BD Screen now ",
                                      style: textTheme.titleSmall?.copyWith(
                                          fontWeight: FontWeight.w400),
                                    ),
                                    const SizedBox(height: 16),
                                    Container(
                                      width: double.infinity,
                                      height: 48,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      child: const TextField(
                                        cursorColor: CustomColors.red,
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText:
                                                "Enter your email address"),
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    HomeButton(
                                      text: "Subscribe",
                                      onPressed: () {},
                                    ),
                                    const SizedBox(height: 32),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 55.h,
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Positioned(
                                top: -50,
                                child: SizedBox(
                                  width: 100.w,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0),
                                    child: Column(
                                      children: [
                                        HomeVerticalMovieSection(
                                            section: "Most Popular",
                                            movies: controller
                                                .popularMovies.value),
                                        const SizedBox(height: 16),
                                        HorizontalMovieSection(
                                            section: "Discover Movies",
                                            movies: controller
                                                .discoverMovies.value),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16)
                          .copyWith(top: 16),
                      child: HomeSearchSection(
                          movies: controller.searchMovies.value),
                    ),
            )
          ],
        ),
      ),
    );
  }
}
