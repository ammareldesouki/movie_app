import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/colors.dart';
import 'package:movie_app/core/constants/image_strings.dart';
import 'package:movie_app/core/route/route_name.dart';
import 'package:movie_app/features/auth/presentation/widgets/custome_form_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Image(image: AssetImage(TImages.applogo))),
            TCustomeFormField(
              hintText: "email",
              prifixIcon: Icons.email_outlined,
            ),
            TCustomeFormField(
              hintText: "password",
              prifixIcon: Icons.lock_open_outlined,
            ),

            Align(
              alignment: Alignment.bottomRight,
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RouteNames.forgetPassword);
                },
                child: Text(
                  "forgot password?",
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall!.copyWith(color: TColors.primary),
                  textAlign: TextAlign.right,
                ),
              ),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, RouteNames.layout);
              },
              child: Text(
                "Login",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account ? ",
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall!.copyWith(color: Colors.white),
                ),

                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, RouteNames.register);
                  },
                  child: Text(
                    "Create an account",
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

            ElevatedButton(
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ImageIcon(
                    AssetImage(TImages.googleIcon),
                    color: Colors.black,
                  ),
                  SizedBox(width: 16),
                  Text(
                    "Login With Google",
                    style: Theme.of(
                      context,
                    ).textTheme.titleMedium!.copyWith(color: Colors.black),
                  ),
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
