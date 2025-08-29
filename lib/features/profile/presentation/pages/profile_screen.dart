import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/colors.dart';
import 'package:movie_app/core/constants/image_strings.dart';
import 'package:movie_app/core/route/route_name.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      appBar: AppBar(
        title: Text(
          "Profile",
          style: Theme.of(
            context,
          ).textTheme!.titleLarge!.copyWith(color: TColors.primary),
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        iconTheme: IconThemeData(color: TColors.primary),
      ),

      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.40,
            color: Color(0xff212121),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 24),
              child: Column(
                spacing: 10,

                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        spacing: 10,
                        children: [
                          Image(
                            image: AssetImage(TImages.userImage1),
                            height: 118,
                            width: 118,
                          ),
                          Text("John Doe",style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.white),)
                        ],
                      ),
                      Column(
                        spacing: 10,

                        children: [
                          Text(
                            "10",
                            style: Theme.of(context).textTheme.headlineLarge!
                                .copyWith(color: Colors.white),
                          ),
                          Text(
                            "Wish List",
                            style: Theme.of(context).textTheme.titleLarge!
                                .copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                      Column(
                        spacing: 10,

                        children: [
                          Text(
                            "10",
                            style: Theme.of(context).textTheme.headlineLarge!
                                .copyWith(color: Colors.white),
                          ),
                          Text(
                            " History",
                            style: Theme.of(context).textTheme.titleLarge!
                                .copyWith(color: Colors.white),
                          ),
                        ],

                      ),
                    ],
                  ),

                  Row(
                    spacing: 10,
                    children: [
                      Expanded(
                          flex:2,
                          child: ElevatedButton(onPressed: (){
                            Navigator.pushNamed(context, RouteNames.updateProfile);

                          }, child: Text("Edit Profile",style: Theme.of(context).textTheme!.bodyMedium),)),
                      Expanded(
                        child: ElevatedButton(onPressed: (){},
                            style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                              backgroundColor: WidgetStateProperty.all(Colors.red),
                              foregroundColor: WidgetStateProperty.all(Colors.white)
                            ),
                            child: Row(
                          mainAxisAlignment:MainAxisAlignment.center,
                            children: [
                          Text("Exite"),
                          Icon(Icons.exit_to_app),

                        ],)),
                      ),
                    ],
                  ),
                      Spacer(),
                  DefaultTabController(

                      length: 2, child: TabBar(
                    dividerColor: Colors.transparent,
                    indicatorColor: TColors.primary,

                      tabs: [
                    Tab(

                        icon: Icon(Icons.movie_filter,color: TColors.primary,), child: Text("Movies",style:TextStyle(color: Colors.white),)),
                    Tab(icon: Icon(Icons.library_books,color: TColors.primary,), child: Text("Books",style:TextStyle(color: Colors.white))),
                  ]))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
