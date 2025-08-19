import 'package:go_router/go_router.dart';
import 'package:terra_app/features/auth/presentation/pages/forget_password_page.dart';
import 'package:terra_app/features/auth/presentation/pages/login_page.dart';
import 'package:terra_app/features/auth/presentation/pages/signup_page.dart';
import 'package:terra_app/features/cart/presentation/screens/cart_screen.dart';
import 'package:terra_app/features/customized_accessories/presentation/pages/bracelet_carousel_screen.dart';
import 'package:terra_app/features/customized_accessories/presentation/pages/bracelet_customizer.dart';
import 'package:terra_app/features/home/presentation/pages/home_page.dart';
import 'package:terra_app/features/product_details/presentation/pages/product_details_page.dart';
import 'package:terra_app/features/profile/presentation/pages/user_addresses.dart';
import 'package:terra_app/features/profile/presentation/pages/user_profile.dart';
import 'package:terra_app/features/shop/pages/shop_screen.dart';

abstract class AppRouter {
  static const kSignUpPage = '/signup_page';
  static const kHomePage = '/home_page';
  static const kProductDetailSPage = '/product_details_page';
  static const kShopPage = '/shop_page/:category';
  static const kForgetPassPage = '/forget_pass_page';
  static const kCartPage = "/cart_page";
  static const kBraceletCarousel = '/bracelet_carousel';
  static const kCustomizeAccessory = '/customize_accessory';
  static const kUserProfile = '/user_profile';
  static const kUserAddresses = '/user_addresses';

  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => LoginPage()),
      GoRoute(path: kSignUpPage, builder: (context, state) => SignupPage()),
      GoRoute(path: kHomePage, builder: (context, state) => HomePage()),
      GoRoute(
        path: kProductDetailSPage,
        builder: (context, state) => ProductDetailsPage(),
      ),
      GoRoute(
        path: kShopPage,
        builder: (context, state) {
          final category = Uri.decodeComponent(
            state.pathParameters['category']!,
          );
          return ShopScreen(category: category);
        },
      ),
      GoRoute(
        path: kForgetPassPage,
        builder: (context, state) => ForgetPasswordPage(),
      ),
      GoRoute(path: kCartPage, builder: (context, state) => CartScreen()),
      GoRoute(
        path: kBraceletCarousel,
        builder: (context, state) => BraceletCarouselScreen(),
      ),
      GoRoute(
        path: kCustomizeAccessory,
        builder: (context, state) => BraceletCustomizer(),
      ),
      GoRoute(path: kUserProfile, builder: (context, state) => UserProfile()),
      GoRoute(
        path: kUserAddresses,
        builder: (context, state) => UserAddresses(),
      ),
    ],
  );
}
