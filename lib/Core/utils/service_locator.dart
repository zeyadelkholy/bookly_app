import 'package:booklyapp/Core/api%20service/api_service.dart';
import 'package:booklyapp/data%20layer/repositories/home_screen_repo_implementation.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  //  create Singleton for every repo i created

  getIt.registerSingleton<ApiService>(ApiService(Dio()),);
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(
        getIt.get<ApiService>(),

      ),
  );


}
