import 'package:fruit_hub/core/repos/product_repo_impl.dart';
import 'package:fruit_hub/core/service/firebase_auth_service.dart';
import 'package:fruit_hub/core/service/firestore_service.dart';
import 'package:fruit_hub/features/auth/data/repos/auth_repo_impl.dart';
import 'package:fruit_hub/features/auth/presentation/managers/login_cubit/login_cubit.dart';
import 'package:fruit_hub/features/auth/presentation/managers/signup_cubit/signup_cubit.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void setupGetIt() {
  //Auth
  getIt.registerLazySingleton<FirebaseAuthService>(() => FirebaseAuthService());
  getIt.registerLazySingleton<FirestoreService>(() => FirestoreService());
  getIt.registerLazySingleton<AuthRepoImpl>(
    () => AuthRepoImpl(getIt<FirebaseAuthService>(), getIt<FirestoreService>()),
  );
  getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt<AuthRepoImpl>()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt<AuthRepoImpl>()));

  //main view
  getIt.registerLazySingleton<ProductRepoImpl>(()=> ProductRepoImpl(getIt<FirestoreService>()));

}
