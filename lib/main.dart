import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:terra_app/core/injections.dart';
import 'package:terra_app/core/theme/app_theme.dart';
import 'package:terra_app/core/utils/app_router.dart';
import 'package:terra_app/features/cart/presentation/cubits/cart_cubit.dart';
import 'package:terra_app/features/customized_accessories/presentation/manager/customize_accessory_cubit/customize_accessory_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await getInit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CartCubit>(create: (_) => sl<CartCubit>()),
        BlocProvider<CustomizeAccessoryCubit>(
          create: (_) => CustomizeAccessoryCubit(),
        ),
      ],
      child: MaterialApp.router(
        theme: AppTheme.theme,
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
