import 'package:go_router/go_router.dart';
import 'package:terra_app/features/auth/presentation/pages/forget_password_page.dart';
import 'package:terra_app/features/auth/presentation/pages/login_page.dart';
import 'package:terra_app/features/auth/presentation/pages/signup_page.dart';
import 'package:terra_app/features/home/presentation/pages/home_page.dart';
import 'package:terra_app/features/product_details/presentation/pages/product_details_page.dart';
import 'package:terra_app/features/shop/pages/shop_screen.dart';

abstract class AppRouter {
  static const kSignUpPage = '/signup_page';
  static const kHomePage = '/home_page';
  static const kProductDetailSPage = '/product_details_page';
  static const kShopPage = '/shop_page';
  static const kForgetPassPage = '/forget_pass_page';

  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => LoginPage()),
      GoRoute(path: kSignUpPage, builder: (context, state) => SignupPage()),
      GoRoute(path: kHomePage, builder: (context, state) => HomePage()),
      GoRoute(
        path: kProductDetailSPage,
        builder: (context, state) => ProductDetailsPage(),
      ),
      GoRoute(path: kShopPage, builder: (context, state) => ShopScreen()),
      GoRoute(
        path: kForgetPassPage,
        builder: (context, state) => ForgetPasswordPage(),
      ),
    ],
  );
}
