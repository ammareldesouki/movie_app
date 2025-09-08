import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/constants/colors.dart';
import 'package:movie_app/core/constants/image_strings.dart';
import 'package:movie_app/core/route/route_name.dart';
import 'package:movie_app/core/utils/validator.dart';
import 'package:movie_app/features/auth/domain/use_cases/sign_in_use_case.dart';
import 'package:movie_app/features/auth/presentation/manager/auth_bloc.dart';
import 'package:movie_app/features/auth/presentation/manager/auth_bloc.dart';
import 'package:movie_app/features/auth/presentation/widgets/custome_form_field.dart';

import '../../domain/entities/sign_in_request.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();
    final _formKey = GlobalKey<FormState>();
    @override
    void dispose() {
      _emailController.dispose();
      _passwordController.dispose();
      super.dispose();
    }

    String? _validateEmail(String? value) {
      if (value == null || value.isEmpty || !value.contains('@')) {
        return 'Please enter a valid email';
      }
      return null;
    }

    String? _validatePassword(String? value) {
      if (value == null || value.length < 6) {
        return 'Password must contain 6 letters';
      }
      return null;
    }

    return Scaffold(
      body: BlocProvider(
        create: (context) => AuthBloc(),
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthSignInLoading) {
              showDialog(
                context: context,
                builder: (context) =>
                const Center(child: CircularProgressIndicator()),
              );
            }

            if (state is AuthSignInSuccess) {
              Navigator.pushReplacementNamed(context, RouteNames.layout);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("succsessfully logged in!")),
              );
            }

            if (state is AuthSignInError) {
              Navigator.pop(context); // Dismiss loading indicator
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error)),
              );
            }
          },
          builder: (context, state) {
            return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  spacing: 20,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(child: Image(image: AssetImage(TImages.applogo))),
                    TCustomeFormField(
                      controller: _emailController,
                      hint: "email",
                      prefixIcon: Icon(Icons.email_outlined,
                      ), validation: Validator.validateEmail,
                    ),
                    TCustomeFormField(
                      controller: _passwordController,
                      hint: "password",
                      prefixIcon: Icon(Icons.lock_open_outlined,),
                      validation: Validator.validatePassword,
                    ),

                    Align(
                      alignment: Alignment.bottomRight,
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                              context, RouteNames.forgetPassword);
                        },
                        child: Text(
                          "forgot password?",
                          style: Theme
                              .of(
                            context,
                          )
                              .textTheme
                              .bodySmall!
                              .copyWith(color: TColors.primary),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ),

                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          var request = SignInRequest(
                              email: _emailController.text,
                              password: _passwordController.text);
                          context.read<AuthBloc>().add(SingInEvent(request));
                        }
                      },
                      child: Text(
                        "Login",
                        style: Theme
                            .of(context)
                            .textTheme
                            .titleMedium,
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account ? ",
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
                            Navigator.pushNamed(context, RouteNames.register);
                          },
                          child: Text(
                            "Create an account",
                            style: Theme
                                .of(
                              context,
                            )
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

                    ElevatedButton(
                      onPressed: () {


                      },
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
                            style: Theme
                                .of(
                              context,
                            )
                                .textTheme
                                .titleMedium!
                                .copyWith(color: Colors.black),
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
          },
        ),
      ),
    );
  }
}
