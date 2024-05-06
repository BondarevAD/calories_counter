import 'package:calories_counter/data/data_source/api_datasource.dart';
import 'package:calories_counter/data/data_source/firebase_datasource.dart';
import 'package:calories_counter/data/data_source/image_api_datasource.dart';
import 'package:calories_counter/data/repository_impl/auth_repository.dart';
import 'package:calories_counter/data/repository_impl/products_repository.dart';
import 'package:calories_counter/data/repository_impl/user_repository_impl.dart';
import 'package:calories_counter/domain/interactors/auth_interactor.dart';
import 'package:calories_counter/domain/interactors/home_interactor.dart';
import 'package:calories_counter/domain/interactors/profile_interactor.dart';
import 'package:calories_counter/domain/interactors/search_interactor.dart';
import 'package:calories_counter/domain/repositories/products_repository.dart';
import 'package:calories_counter/firebase_options.dart';
import 'package:calories_counter/presentation/pages/auth_page/cubit/auth_cubit.dart';
import 'package:calories_counter/presentation/pages/main/main_page.dart';
import 'package:calories_counter/presentation/pages/main/tabs/home_body/cubit/home_cubit.dart';
import 'package:calories_counter/presentation/pages/main/tabs/profile_body/cubit/profile_cubit.dart';
import 'package:calories_counter/presentation/pages/main/tabs/search_body/cubit/search_cubit.dart';
import 'package:calories_counter/presentation/pages/splash_screen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_frame/flutter_web_frame.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final apiDataSource = ApiDataSource();
  final imageApiDataSource = ImageApiDataSource();

  final firebaseDataSource = FirebaseDataSource();

  final productsRepository = ProductsRepositoryImpl(
      apiDataSource, firebaseDataSource, imageApiDataSource);
  final userRepository = UserRepositoryImpl(firebaseDataSource);
  final authRepository = AuthRepositoryImpl(firebaseDataSource);

  final searchInteractor = SearchInteractor(productsRepository, userRepository);
  final profileInteractor = ProfileInteractor(userRepository);
  final homeInteractor = HomeInteractor(userRepository, productsRepository);
  final authInteractor = AuthInteractor(authRepository, userRepository);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<AuthCubit>(
        create: (_) => AuthCubit(authInteractor),
      ),
      BlocProvider<HomeCubit>(
        create: (_) => HomeCubit(homeInteractor)..getProductsByUser(),
      ),
      BlocProvider<SearchCubit>(
        create: (_) => SearchCubit(searchInteractor),
      ),
      BlocProvider<ProfileCubit>(
        create: (_) => ProfileCubit(profileInteractor)..getUser(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FlutterWebFrame(
      builder: (BuildContext context) {
        return GetMaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'AppFont',
            colorScheme: const ColorScheme.light(primary: Colors.black),
            useMaterial3: true,
            primaryColor: Colors.black,
            navigationBarTheme: NavigationBarThemeData(
              indicatorColor: Colors.black,
            ),
          ),
          home: const SplashScreen(),
        );
      },
      enabled: kIsWeb,
      backgroundColor: Colors.white,
      maximumSize: const Size(475.0, 812.0),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
