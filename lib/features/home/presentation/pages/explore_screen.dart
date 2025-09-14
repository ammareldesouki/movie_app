import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/data.dart';
import '../manager/home_bloc.dart';
import '../widgets/movie_card.dart';

class ExploreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) =>
            HomeBloc()..add(GetMoviesByCategoryEvent(Data.category[0])),
        child: BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {},
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: DefaultTabController(
                      length: Data.category.length,
                      child: TabBar(
                        onTap: (index) {
                          BlocProvider.of<HomeBloc>(
                            context,
                          ).add(GetMoviesByCategoryEvent(Data.category[index]));
                        },
                        tabAlignment: TabAlignment.start,
                        isScrollable: true,
                        indicatorSize: TabBarIndicatorSize.label,

                        indicatorColor: Colors.transparent,
                        dividerColor: Colors.transparent,
                        tabs: Data.category
                            .map(
                              (category) => Container(
                                width: 100,
                                decoration: BoxDecoration(
                                  color: TColors.primary,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Tab(text: category),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ),

                  state is GetMoviesByCategorySuccsed
                      ? GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.8,
                                crossAxisSpacing: 10.0,
                                mainAxisSpacing: 10.0,
                              ),
                          itemCount: state.movies.length,
                          itemBuilder: (context, index) {
                            return MovieCard(movie: state.movies[index]);
                          },
                        )
                      : SizedBox.shrink(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
