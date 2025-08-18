import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:terra_app/core/utils/app_router.dart';
import 'package:terra_app/features/auth/presentation/pages/signup_page.dart';
import 'package:terra_app/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:terra_app/features/home/presentation/pages/home_page.dart';

class LoginPageBody extends StatelessWidget {
  const LoginPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20,
          children: [
            Text("Login", style: TextStyle(fontSize: 35)),
            SizedBox(height: 20),
            CustomTextField(
              hintText: "Email",
              keyboardType: TextInputType.emailAddress,
            ),
            CustomTextField(
              hintText: "Password",
              keyboardType: TextInputType.visiblePassword,
            ),
            GestureDetector(
              onTap: () {},
              child: Text(
                "Forgot your password?",
                style: TextStyle(decoration: TextDecoration.underline),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                GoRouter.of(context).push(AppRouter.kHomePage);
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(200, 60),
                shape: BeveledRectangleBorder(),
                backgroundColor: Color(0xffd16147),
              ),
              child: Text(
                "Sign in",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            GestureDetector(
              onTap: () {
                GoRouter.of(context).push(AppRouter.kSignUpPage);
              },
              child: Text(
                "Create account",
                style: TextStyle(decoration: TextDecoration.underline),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
