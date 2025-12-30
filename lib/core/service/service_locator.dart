import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movies/config/api_service.dart';
import 'package:movies/core/service/data_base_service.dart';
import 'package:movies/core/service/fire_store_service.dart';
import 'package:movies/core/service/firebase_auth_service.dart';
import 'package:movies/feature/auth/data/repo_impl/auth_repo_impl.dart';
import 'package:movies/feature/auth/domain/repo/auth_repo.dart';
import 'package:movies/feature/home/data/data_source/home_remote_data_source.dart';

final getIt = GetIt.instance;
void setUpGetIt() {
  getIt.registerSingleton<FireBaseAuthService>(FireBaseAuthService());
  getIt.registerSingleton<DataBaseService>(FireStoreService());

  
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<HomeRemoteDataSource>(HomeRemoteDataSourceImpl(apiService: getIt.get<ApiService>()));



  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(
      fireBaseAuthService: getIt.get<FireBaseAuthService>(),
      dataBaseService: getIt.get<DataBaseService>(),
    ),
  );
}
