import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/constants/image_strings.dart';
import 'package:movie_app/features/auth/presentation/widgets/custome_form_field.dart';
import 'package:movie_app/features/home/presentation/widgets/movie_card.dart';

import '../manager/home_bloc.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    PageController _pageController = PageController(viewportFraction: 0.75);
    return Scaffold(
      body: BlocProvider(
        create: (context) =>
        HomeBloc()
          ..add(GetAllMoviesEvent()),
        child: BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {},
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  TCustomeFormField(
                    hint: "Search Movie",
                    prefixIcon: ImageIcon(AssetImage(TImages.searchIconFilled),
                      color: Colors.white,),
                    backgroundColor: Color(0xff282A28),
                  ),

                  state is GetAllMovieSuccsed ?
                  SizedBox(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.5,
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: state.movies.length,
                      itemBuilder: (context, index) {
                        return AnimatedBuilder(
                          animation: _pageController,
                          builder: (context, child) {
                            double value = 1.0;
                            if (_pageController.position.haveDimensions) {
                              value = _pageController.page! - index;
                              value = (1 - (value.abs() * 0.3)).clamp(0.7, 1.0);
                            }
                            return Center(
                              child: Transform.scale(
                                scale: value,
                                child: Stack(
                                  alignment: Alignment.center,

                                  children: [


                                    Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withOpacity(
                                                0.5),
                                            blurRadius: 10,
                                            offset: Offset(0, 10),
                                          ),
                                        ],
                                        image: DecorationImage(
                                          image: NetworkImage(
                                              state.movies[index]
                                                  .largeCoverImage),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Container(
                                        height: 200,
                                        child: MovieCard(
                                            movie: state.movies[index])),


                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ) : SizedBox.shrink(),


                  state is GetAllMovieSuccsed ?
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.8,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                    ),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return MovieCard(movie: state.movies[index]);
                    },
                  ) : SizedBox.shrink(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}