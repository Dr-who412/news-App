import 'package:breakingnews/module/cubit/cubit.dart';
import 'package:breakingnews/shared/blocObserver.dart';
import 'package:breakingnews/shared/netwprk/remote/dio/dioHelper.dart';
import 'package:breakingnews/shared/provider/cacheHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'layout/home_bottom_navi_bar/home.dart';
import 'package:bloc/bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'module/cubit/states.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  DioHelper.init();
  BlocOverrides.runZoned(
    () {},
    blocObserver: MyBlocObserver(),
  );
  bool isdark=(CacheHelper.getbool(key: 'isDark')??false);
  runApp( MyApp( isdark));
}

class MyApp extends StatelessWidget {
   bool isdark;
   MyApp( this.isdark,{super.key});
   
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => AppCubit()..changemode(fromshared: isdark)..getBusiness()..getScience()..getSports(),
        child: BlocConsumer<AppCubit, Appstate>(
            listener: (BuildContext context,  state) {},
            builder: (BuildContext context, state) {
              print("test ${AppCubit.get(context).isDark}");
              return MaterialApp(
                title: 'Flutter Demo',
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  primaryColor: Colors.deepOrange,
                  scaffoldBackgroundColor: Colors.white,
                  appBarTheme: AppBarTheme(
                    systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarBrightness: Brightness.dark,
                      statusBarColor: Colors.grey,
                    ),
                    iconTheme: IconThemeData(
                      color: Colors.black,
                    ),
                    backgroundColor: Colors.white,
                    elevation: 0.0,
                  ),
                  bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    backgroundColor: Colors.white,
                    elevation: 0.0,
                    selectedItemColor: Colors.deepOrange,
                    selectedIconTheme: IconThemeData(size: 32),
                  ),
                  primarySwatch: Colors.deepOrange,
                  textTheme:  TextTheme(
                    bodyText1: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                darkTheme: ThemeData(
                  primaryColor: Colors.deepOrange,
                  scaffoldBackgroundColor: HexColor('333739'),
                  backgroundColor: HexColor('333739'),
                  appBarTheme: AppBarTheme(
                      backwardsCompatibility: false,
                      backgroundColor: HexColor('333739'),
                      systemOverlayStyle: SystemUiOverlayStyle(
                        statusBarBrightness: Brightness.light,
                        statusBarColor: Colors.black,
                      ),
                      titleTextStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                      iconTheme: IconThemeData(
                        color: Colors.white,
                      )),
                  bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    backgroundColor: HexColor('333739'),
                    selectedItemColor: Colors.deepOrange,
                    unselectedItemColor: Colors.grey,
                    elevation: 20.0,
                    type: BottomNavigationBarType.fixed,
                  ),
                  textTheme:  TextTheme(
                    bodyText1: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                themeMode: AppCubit.get(context).isDark?ThemeMode.dark:ThemeMode.light,
                home:  Directionality(
                    textDirection: TextDirection.ltr, child: home()),
              );
            }
            )
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
