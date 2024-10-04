import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:graphql_example/get_it/get_it.dart';
import 'package:graphql_example/presentation/cubit/country_cubit/country_cubit.dart';
import 'package:graphql_example/presentation/cubit/item_cubit/item_cubit.dart';

import 'package:graphql_example/presentation/cubit/user_cubit/user_cubit.dart';
import 'package:graphql_example/presentation/pages/home_page.dart';


class GrapqlApp extends StatelessWidget {
  const GrapqlApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<UserCubit>()..getUsers()),
        BlocProvider(create: (_) => sl<ItemCubit>()..getItems()),
        BlocProvider(create: (_) => sl<CountryCubit>()..getItems()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter GraphQL Clean Architecture',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: const HomePage(),
      ),
    );
  }
}
