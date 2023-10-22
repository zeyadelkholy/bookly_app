import 'package:booklyapp/Core/utils/App_router.dart';
import 'package:booklyapp/data%20layer/repositories/home_screen_repo_implementation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Core/utils/service_locator.dart';
import 'bloc/featured_books_cubit/featured_books_cubit.dart';
import 'bloc/newest_books_cubit/newest_books_cubit.dart';

void main() {

  // to call the register Singleton from service locator
  setupServiceLocator();
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [



        BlocProvider(create:(context) =>
            FeaturedBooksCubit(
                getIt.get<HomeRepoImpl>(),
              // get the cubit
          )..fetchFeaturedBooks(),

        ),


        BlocProvider(create: (context) =>
          NewestBooksCubit(
            getIt.get<HomeRepoImpl>(),
            // get the cubit
          )..fetchNewestBooks()

        ),



      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: const Color(0xff100B20),
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
