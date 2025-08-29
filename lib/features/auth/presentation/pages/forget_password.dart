
import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/colors.dart';
import 'package:movie_app/core/constants/image_strings.dart';
import 'package:movie_app/features/auth/presentation/widgets/custome_form_field.dart';


class ForgotPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Forget Password',style: Theme.of(context).textTheme!.titleLarge!.copyWith(color: TColors.primary),),
      centerTitle: true,
      iconTheme: IconThemeData(color: TColors.primary),
      ),

      body: Center(
   child:  Padding(
     padding: const EdgeInsets.symmetric(horizontal: 16.0),
     child: Column(
       crossAxisAlignment: CrossAxisAlignment.stretch,
       spacing: 20,
       children: [
         Image(image: AssetImage(TImages.forgetPassword)),

         TCustomeFormField(
           hintText:  'Enter your email',

           prifixIcon:  Icons.email,


         ),

         ElevatedButton(onPressed: (){}, child: Text("Verify Email",style: Theme.of(context).textTheme.titleMedium))


       ],
     ),
   ),
      )
    );
  }

}