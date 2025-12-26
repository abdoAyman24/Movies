
import 'package:get_it/get_it.dart';
import 'package:movies/core/service/data_base_service.dart';
import 'package:movies/core/service/fire_store_service.dart';
import 'package:movies/core/service/firebase_auth_service.dart';
import 'package:movies/feature/auth/data/repo_impl/auth_repo_impl.dart';
import 'package:movies/feature/auth/domain/repo/auth_repo.dart';

final getIt = GetIt.instance;
void setUpGetIt() {
  getIt.registerSingleton<FireBaseAuthService>(FireBaseAuthService());
  getIt.registerSingleton<DataBaseService>(FireStoreService());

  getIt.registerSingleton<AuthRepo>(AuthRepoImpl(fireBaseAuthService: getIt.get<FireBaseAuthService>(),dataBaseService:getIt.get<DataBaseService>() ));
  

  
  
}
