import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/colors.dart';
import 'package:movie_app/core/constants/image_strings.dart';
import 'package:movie_app/features/auth/presentation/widgets/custome_form_field.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: Theme.of(
            context,
          ).textTheme.titleLarge!.copyWith(color: TColors.primary),
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        iconTheme: IconThemeData(color: TColors.primary),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 15,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image(image: AssetImage(TImages.userImage1), height: 118),
            TCustomeFormField(prefixIcon: Icon(Icons.person), hint: "Name"),
            TCustomeFormField(prefixIcon: Icon(Icons.phone), hint: "Name"),
            Text(
              "RestPassword Password",
              style: Theme.of(
                context,
              ).textTheme.bodyLarge!.copyWith(color: Colors.white),
            ),
            Spacer(),
            ElevatedButton(
              style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                backgroundColor: WidgetStateProperty.all(Colors.red),
                foregroundColor: WidgetStateProperty.all(Colors.white),
              ),

              onPressed: () {},
              child: Text("Delete Account"),
            ),
            ElevatedButton(onPressed: () {}, child: Text("Save Changes")),
          ],
        ),
      ),
    );
  }
}
