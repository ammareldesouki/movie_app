import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/constants/colors.dart';
import 'package:movie_app/core/constants/image_strings.dart';
import 'package:movie_app/core/route/route_name.dart';
import 'package:movie_app/core/utils/validator.dart';
import 'package:movie_app/features/auth/domain/entities/sign_up_request.dart';
import 'package:movie_app/features/auth/presentation/manager/auth_bloc.dart';
import 'package:movie_app/features/auth/presentation/widgets/custome_form_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _rePasswordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _rePasswordController.dispose();
    super.dispose();
  }

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
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSignUpLoading) {
            Center(child: CircularProgressIndicator());
          }
          if (state is AuthSignUpError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.error)));
          }
          if (state is AuthSignUpSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("succsessfully logged in!")),
            );
            Navigator.pushReplacementNamed(context, RouteNames.layout);
          }
        },
        builder: (context, state) {
          return Padding(
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
                    Expanded(
                      child: Image(image: AssetImage(TImages.userImage1)),
                    ),
                    Expanded(
                      child: Image(
                        image: AssetImage(TImages.userImage3),
                        height: 100,
                      ),
                    ),
                  ],
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TCustomeFormField(
                        controller: _nameController,
                        hint: "Name",
                        validation: Validator.validateFullName,
                        prefixIcon: Icon(Icons.person_outline),
                      ),
                      TCustomeFormField(
                        controller: _emailController,
                        hint: "email",
                        prefixIcon: Icon(Icons.email_outlined),
                        validation: Validator.validateEmail,
                      ),

                      TCustomeFormField(
                        controller: _passwordController,
                        hint: "password",
                        prefixIcon: Icon(Icons.lock_open_outlined),
                        validation: Validator.validatePassword,
                      ),

                      TCustomeFormField(
                        controller: _rePasswordController,
                        hint: "Confirm Password",
                        prefixIcon: Icon(Icons.lock_open_outlined),
                        validation: (value) =>
                            Validator.validateConfirmPassword(
                                value, _passwordController.text),
                      ),
                      TCustomeFormField(
                        controller: _phoneController,
                        hint: " Phone: +201XXXXXXXXX",
                        prefixIcon: Icon(Icons.phone_android_outlined),
                        validation: Validator.validatePhoneNumber,
                      ),

                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              var request = SignUpRequest(
                                email: _emailController.text,
                                name: _nameController.text,
                                password: _passwordController.text,
                                phoneNumber: _phoneController.text,
                                repassword: _passwordController.text,
                                avaterId: 1,
                              );
                              context.read<AuthBloc>().add(
                                SingUpEvent(request),
                              );
                            }
                          },
                          child: Text(
                            "Create An Account",
                            style: Theme
                                .of(context)
                                .textTheme
                                .titleMedium,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already Have Account ? ",
                      style: Theme
                          .of(
                        context,
                      )
                          .textTheme
                          .bodySmall!
                          .copyWith(color: Colors.white),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, RouteNames.login);
                      },
                      child: Text(
                        "Login",
                        style: Theme
                            .of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: TColors.primary),
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
                        style: Theme
                            .of(
                          context,
                        )
                            .textTheme
                            .bodySmall!
                            .copyWith(color: Colors.white),
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
          );
        },
      ),
    );
  }
}
