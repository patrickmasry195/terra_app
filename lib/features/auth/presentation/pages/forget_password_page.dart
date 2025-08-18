import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:terra_app/features/auth/presentation/widgets/custom_text_field.dart';

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 20,
            children: [
              Text(
                "Reset your password",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Text(
                "We will send you an email to reset your password",
                style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
              ),
              CustomTextField(
                hintText: "Email",
                keyboardType: TextInputType.emailAddress,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(120, 50),
                  shape: BeveledRectangleBorder(),
                  backgroundColor: Color(0xffd16147),
                ),
                child: Text(
                  "Submit",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              TextButton(
                onPressed: () {
                  GoRouter.of(context).pop();
                },
                child: Text(
                  "Cancel",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
