import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/colors.dart';
import 'package:movie_app/core/constants/image_strings.dart';
import 'package:movie_app/core/route/route_name.dart';
import 'package:movie_app/features/auth/presentation/widgets/custome_form_field.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Register",
          style: Theme.of(
            context,
          ).textTheme.titleLarge!.copyWith(color: TColors.primary),
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        iconTheme: IconThemeData(color: TColors.primary),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          spacing: 20,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: Image(
                    image: AssetImage(TImages.userImage2),
                    height: 100,
                  ),
                ),
                Expanded(child: Image(image: AssetImage(TImages.userImage1))),
                Expanded(
                  child: Image(
                    image: AssetImage(TImages.userImage3),
                    height: 100,
                  ),
                ),
              ],
            ),
            TCustomeFormField(
              hintText: "Name",
              prifixIcon: Icons.email_outlined,
            ),

            TCustomeFormField(
              hintText: "email",
              prifixIcon: Icons.email_outlined,
            ),

            TCustomeFormField(
              hintText: "password",
              prifixIcon: Icons.lock_open_outlined,
            ),

            TCustomeFormField(
              hintText: "Confirm Password",
              prifixIcon: Icons.lock_open_outlined,
            ),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Create An Account",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already Have Account ? ",
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall!.copyWith(color: Colors.white),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, RouteNames.login);
                  },
                  child: Text(
                    "Login",
                    style: Theme.of(
                      context,
                    ).textTheme.bodySmall!.copyWith(color: TColors.primary),
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Row(
                spacing: 10,
                children: [
                  Expanded(child: Divider(height: 1)),
                  Text(
                    "Or",
                    style: Theme.of(
                      context,
                    ).textTheme.bodySmall!.copyWith(color: Colors.white),
                  ),
                  Expanded(child: Divider(height: 1)),
                ],
              ),
            ),

            Center(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: TColors.primary),
                  borderRadius: BorderRadius.circular(16),
                ),

                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image(
                        image: AssetImage(TImages.englishIcon),
                        width: 24,
                        height: 24,
                      ),
                      SizedBox(width: 10),
                      Image(
                        image: AssetImage(TImages.arabicIcon),
                        width: 24,
                        height: 24,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
