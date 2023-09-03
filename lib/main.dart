import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:product_app/data/services/product_data_service.dart';
import 'package:product_app/domain/repositories/product_repo.dart';
import 'package:product_app/presentation/bloc/product_data_bloc/product_bloc.dart';
import 'package:product_app/presentation/ui/screens/signup_page.dart';

final getIt = GetIt.instance;

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  getIt.registerSingleton<ProductRepo>(ProductDataService());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductBloc(getIt())..loadedApi(),
        ),
      ],
      child: MaterialApp(debugShowCheckedModeBanner: false, home: SignUp()),
    );
  }
}
