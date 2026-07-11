import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/helpers/app_button.dart';
import 'package:store/core/helpers/app_colors.dart';
import 'package:store/core/helpers/app_field.dart';
import 'package:store/core/helpers/app_pass_field.dart';
import 'package:store/core/helpers/app_text_styles.dart';
import 'package:store/core/helpers/app_toast.dart';
import 'package:store/features/auth/cubit/login_cubit.dart';
import 'package:store/features/auth/sign_up.dart';
import 'package:store/features/home_nav/view.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    // ===================== 1. Bloc Provider on Scaffold =====================
    // --------------------- 2. Toast ==> SUCCESS ---------------------
    // --------------------- 3. fail ==> FAIL ---------------------
    // Listener ==> Listen state ==> toast , navigate
    // builder ==> build all widgets ===> display
    // consumer ==> listener + builder
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            // Toast ==> SUCCESS , FAIL
            if (state is LoginFailure) {
              showSnackBar(
                message: state.message,
                type: AnimatedSnackBarType.error,
                context: context,
              );
            }
            if (state is LoginSuccess) {
              showSnackBar(
                message: "Login Success",
                type: AnimatedSnackBarType.success,
                context: context,
              );
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const HomeNav(),
                ),
              );
            }
          },
          
          builder: (context, state) {
            final cubit = context.read<LoginCubit>();
            // ============= Loading =============
            if (state is LoginLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            // ================= Success =============
            else {
              return Padding(
                padding: const EdgeInsets.only(
                  top: 59,
                  left: 16,
                  right: 16,
                  bottom: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,

                  children: [
                    Text(
                      "Login to your account",
                      style: AppTextStyles.kText32Black,
                    ),

                    Text(
                      "It’s great to see you again.",
                      style: AppTextStyles.kText16Gray,
                    ),
                    SizedBox(height: 24),
                    Text("User Name", style: AppTextStyles.kText16Black),
                    AppField(
                      controller: cubit.userEmailController,
                      hint: "Enter your email address",
                      obscureText: false,
                    ),
                    SizedBox(height: 16),
                    Text("Password", style: AppTextStyles.kText16Black),
                    AppPassField(
                      controller: cubit.userPasswordController,
                      hint: "Enter your password",
                    ),
                    SizedBox(height: 55),
                    AppButton(onPressed: cubit.login, label: 'Sign In'),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account? ",
                          style: AppTextStyles.kText16Gray,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(
                              context,
                            ).push(MaterialPageRoute(builder: (_) => SignUp()));
                          },
                          child: Text(
                            "Join",
                            style: AppTextStyles.kText16Black.copyWith(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
