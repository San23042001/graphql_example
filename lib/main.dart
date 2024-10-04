import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_example/app.dart';
import 'package:graphql_example/data/models/country.dart';

import 'package:graphql_example/get_it/get_it.dart';
import 'package:graphql_example/presentation/cubit/bloc_observer.dart';

import 'package:hive_flutter/adapters.dart';

FutureOr<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  Hive.initFlutter();
  Hive.registerAdapter(CountryAdapter());
  Bloc.observer = MyBlocObserver();
  runApp(const GrapqlApp());
}
