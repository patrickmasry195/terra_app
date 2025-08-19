import "package:get_it/get_it.dart";
import "package:terra_app/features/cart/data/datasources/cart_local_data_source.dart";
import "package:terra_app/features/cart/data/repositories/cart_repository_impl.dart";
import "package:terra_app/features/cart/domain/repositories/cart_repository.dart";
import "package:terra_app/features/cart/domain/usecases/add_to_cart.dart";
import "package:terra_app/features/cart/domain/usecases/remove_from_cart.dart";
import "package:terra_app/features/cart/domain/usecases/increase_quantity.dart";
import "package:terra_app/features/cart/domain/usecases/decrease_quantity.dart";
import "package:terra_app/features/cart/presentation/cubits/cart_cubit.dart";

final sl = GetIt.instance;

Future<void> getInit() async {
  // Data source
  sl.registerSingleton<CartLocalDataSource>(CartLocalDataSource());

  // Repository
  sl.registerSingleton<CartRepository>(
    CartRepositoryImpl(sl<CartLocalDataSource>()),
  );

  // Usecases
  sl.registerLazySingleton(() => AddToCart(sl<CartRepository>()));
  sl.registerLazySingleton(() => RemoveFromCart(sl<CartRepository>()));
  sl.registerLazySingleton(() => IncreaseQuantity(sl<CartRepository>()));
  sl.registerLazySingleton(() => DecreaseQuantity(sl<CartRepository>()));

  // Cubit
  sl.registerFactory<CartCubit>(() => CartCubit());
}
