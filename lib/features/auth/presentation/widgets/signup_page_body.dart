import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:terra_app/core/utils/app_router.dart';
import 'package:terra_app/features/auth/presentation/widgets/custom_text_field.dart';

class SignupPageBody extends StatelessWidget {
  const SignupPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 20,
                children: [
                  SizedBox(height: 70),
                  Text("Create account", style: TextStyle(fontSize: 35)),
                  SizedBox(height: 20),
                  CustomTextField(
                    hintText: "First name",
                    keyboardType: TextInputType.text,
                  ),
                  CustomTextField(
                    hintText: "Last name",
                    keyboardType: TextInputType.text,
                  ),
                  CustomTextField(
                    hintText: "Email",
                    keyboardType: TextInputType.emailAddress,
                  ),
                  CustomTextField(
                    hintText: "Password",
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  SizedBox(height: 10),
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
                      "Create",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
