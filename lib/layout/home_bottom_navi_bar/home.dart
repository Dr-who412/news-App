import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../module/cubit/cubit.dart';
import '../../module/cubit/states.dart';
import '../../module/search/search.dart';
import '../../shared/componant/componant.dart';

class home extends StatelessWidget {
  const home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<AppCubit,Appstate>(
          listener: (BuildContext context, state) {},
          builder: (BuildContext context, state) {
            var cubit = AppCubit.get(context);
            return Scaffold(
              appBar: AppBar(
                elevation: 0.0,
                titleTextStyle: TextStyle(
                    color: Colors.deepOrange,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
                actions: [
                  IconButton(
                    onPressed: () {
                      navigatTo(context,searchs());
                    },
                    icon: Icon(Icons.search),
                  ),
                  IconButton(
                    onPressed: () {
                      cubit.changemode();
                      // print("changedthem");
                      // AppCubit.get(context).changethem();
                      // print(AppCubit.get(context).isDark);

                    },
                    icon: Icon(Icons.brightness_4_outlined),
                  ),
                ],
                title: Text(cubit.titels[cubit.current_Sc_Index]),
              ),
              bottomNavigationBar: BottomNavigationBar(
                elevation: 0.0,
                selectedItemColor: Colors.deepOrange,
                currentIndex: cubit.current_Sc_Index,
                onTap: (index) {
                  cubit.changeIndex(index);
                },
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.business_center_outlined),
                      label: "business"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.science_outlined), label: "science"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.sports_baseball_outlined),
                      label: "sports"),
                ],
              ),
              body: cubit.screens[cubit.current_Sc_Index],
            );
          },
        );
  }
}
