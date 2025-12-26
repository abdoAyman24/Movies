import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/conatant.dart';
import 'package:movies/core/cache/cach_helper_with_secure.dart';
import 'package:movies/core/helper/on_generate_route.dart';
import 'package:movies/core/service/service_locator.dart';
import 'package:movies/core/utils/AppTheme.dart';
import 'package:movies/feature/auth/domain/repo/auth_repo.dart';
import 'package:movies/feature/auth/presentation/manager/cubit/auth_cubit.dart';
import 'package:movies/feature/home/presentation/view/home.dart';
import 'package:movies/feature/on_bording/presentation/view/on_bording.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:movies/firebase_options.dart';
import 'package:movies/generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setUpGetIt();
  //  await ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(192, 245),
      builder: (context, child) {
        return BlocProvider(
          create: (context) => AuthCubit(getIt.get<AuthRepo>()),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            localizationsDelegates: [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            title: 'Movies',
            theme: appTheme,
            onGenerateRoute: onGenerateRoute,
            initialRoute:CacheHelper.getString(key: KUserData)!=null?Home.routeName: OnBording.routeName,
          ),
        );
      },
    );
  }
}
//Api Key
//e610a9e4aea5e6cc384486c10e1bb4d8

//API Read Access Token
//eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlNjEwYTllNGFlYTVlNmNjMzg0NDg2YzEwZTFiYjRkOCIsIm5iZiI6MTc2NjQ3NjM5OC4zNiwic3ViIjoiNjk0YTRhNmU3ZjkzZjQxYTVkOGNlZjAzIiwic2NvcGVzIjpbImFwaV9yZWFkIl0sInZlcnNpb24iOjF9.gfXm9Z8fiGzhcfpGkjYnifUk6tLwErm1ZIX0GAlzIc0

//end point movies 
//https://media.themoviedb.org/t/p/w440_and_h660_face/