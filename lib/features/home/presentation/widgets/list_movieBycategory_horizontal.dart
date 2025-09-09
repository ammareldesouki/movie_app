import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/home/domain/entities/MovieResponse.dart';
import 'package:movie_app/features/home/presentation/manager/home_bloc.dart';
import 'package:movie_app/features/home/presentation/widgets/movie_card.dart';

class ListOfMovieHorizontal extends StatelessWidget {
  final List<MovieEntity> movies;

  const ListOfMovieHorizontal({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is GetMoviesByCategoryLoading) {
          showDialog(
            context: context,
            builder: (context) =>
                const Center(child: CircularProgressIndicator()),
          );
        }
        if (state is GetMoviesByCategorySuccsed) {
          Navigator.pop(context);
        }
        if (state is GetMoviesByCategoryError) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        if (state is GetMoviesByCategorySuccsed) {
          return SizedBox(
            height: 200,
            width: double.infinity,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: state.movies.length,
              itemBuilder: (context, index) {
                return MovieCard(movie: state.movies[index]);
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(width: 10),
            ),
          );
        }
        return const SizedBox(height: 200);
      },
    );
  }
}
