import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/home/presentation/manager/home_bloc.dart';

class MovieDetailesScreen extends StatelessWidget {
  const MovieDetailesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movie Details"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          // ✅ Debug log
          debugPrint("Current state in MovieDetailesScreen: $state");

          if (state is GetMovieDetailsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is GetMovieDetailsSuccsed) {
            final movie = state.movieDetails.data?.movie;

            if (movie == null) {
              return const Center(child: Text("No movie details found"));
            }

            return SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Poster
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: CachedNetworkImage(
                        imageUrl: movie.largeCoverImage ?? "",
                        placeholder: (context, url) =>
                            const Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error, size: 100),
                        fit: BoxFit.cover,
                        height: 400,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Title
                  Text(
                    movie.title ?? "No title",
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  // Rating + Year + Runtime
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 24),
                      const SizedBox(width: 8),
                      Text(
                        movie.rating?.toString() ?? "-",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const Spacer(),
                      Text(
                        '${movie.year ?? "-"} | ${movie.runtime ?? "-"} min',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // Genres
                  Text('Genres', style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8.0,
                    runSpacing: 4.0,
                    children:
                        movie.genres
                            ?.map((genre) => Chip(label: Text(genre)))
                            .toList() ??
                        [],
                  ),

                  const SizedBox(height: 20),

                  // Synopsis
                  Text(
                    'Synopsis',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    movie.descriptionIntro ?? "No description available",
                    style: Theme.of(context).textTheme.bodyLarge,
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
    );
  }
}
