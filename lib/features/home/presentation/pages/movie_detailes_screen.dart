import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/home/presentation/manager/home_bloc.dart';
import 'package:movie_app/features/home/presentation/widgets/container_cast_details.dart';

import '../widgets/container_about_movie.dart';

class MovieDetailesScreen extends StatefulWidget {
  final int movieId;

  const MovieDetailesScreen({super.key, required this.movieId});

  @override
  State<MovieDetailesScreen> createState() => _MovieDetailesScreenState();
}

class _MovieDetailesScreenState extends State<MovieDetailesScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) =>
            HomeBloc()..add(GetMovieDetailsEvent(widget.movieId)),
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            debugPrint("Current state in MovieDetailesScreen: $state");

            if (state is GetMovieDetailsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is GetMovieDetailsSuccsed) {
              final movie = state.movieDetails.data?.movie;

              if (movie == null) {
                return const Center(child: Text("No movie details found"));
              }
              print("#------------- ${state.movieDetails.data.toString()},");

              return SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      child: CachedNetworkImage(
                        imageUrl: movie.largeCoverImage ?? "",
                        placeholder: (context, url) =>
                            const Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error, size: 100),
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Title
                    Column(
                      children: [
                        Text(
                          movie.title ?? "No title",
                          style: Theme.of(context).textTheme.headlineLarge
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          movie.year.toString() ?? "-",
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(color: Colors.white),
                        ),
                      ],
                    ),

                    const SizedBox(height: 8),

                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "Watch",
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        elevation: 2,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        spacing: 6,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ContainerAboutMovie(
                            icon: Icons.star,
                            title: movie.rating.toString(),
                          ),
                          ContainerAboutMovie(
                            icon: Icons.access_time_filled_sharp,
                            title: movie.runtime.toString(),
                          ),

                          ContainerAboutMovie(
                            icon: Icons.favorite,
                            title: movie.likeCount.toString(),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),
                    Column(
                      children: [
                        CachedNetworkImage(
                          imageUrl: movie.mediumScreenshotImage1 ?? "",
                          placeholder: (context, url) =>
                              const Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error, size: 100),
                          fit: BoxFit.cover,
                        ),
                        CachedNetworkImage(
                          imageUrl: movie.mediumScreenshotImage2 ?? "",
                          placeholder: (context, url) =>
                              const Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error, size: 100),
                          fit: BoxFit.cover,
                        ),
                        CachedNetworkImage(
                          imageUrl: movie.mediumScreenshotImage3 ?? "",
                          placeholder: (context, url) =>
                              const Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error, size: 100),
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    Text(
                      'Summary',
                      style: Theme.of(
                        context,
                      ).textTheme.titleLarge!.copyWith(color: Colors.white),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      movie.descriptionIntro ?? "No description available",
                      style: Theme.of(
                        context,
                      ).textTheme.bodyLarge!.copyWith(color: Colors.white),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Cast",
                      style: Theme.of(
                        context,
                      ).textTheme.bodyLarge!.copyWith(color: Colors.white),
                    ),

                    ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: movie.cast!.length,
                      itemBuilder: (context, index) {
                        final castMember = movie.cast![index];
                        return ContainerCastDetails(
                          castMember: movie.cast![index],
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          SizedBox(height: 10),
                    ),
                    Text(
                      'Genres',
                      style: Theme.of(
                        context,
                      ).textTheme.titleLarge!.copyWith(color: Colors.white),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8.0,
                      runSpacing: 4.0,
                      children:
                          movie.genres
                              ?.map(
                                (genre) => Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0,
                                    vertical: 6.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0xff282A28),
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  child: Text(
                                    genre,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                              )
                              .toList() ??
                          [],
                    ),
                  ],
                ),
              );
            } else if (state is GetMovieDetailsError) {
              return Center(
                child: Text(
                  "Failed to load details:",
                  style: const TextStyle(color: Colors.red),
                ),
              );
            }

            // Initial or unknown state
            return const Center(child: Text("No data yet"));
          },
        ),
      ),
    );
  }
}
