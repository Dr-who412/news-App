
import 'dart:math';

import 'package:breakingnews/shared/provider/cacheHelper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../module/cubit/states.dart';
import '../../shared/netwprk/remote/dio/dioHelper.dart';
import '../busnisse screen/busnisse.dart';
import '../science screen/science.dart';
import '../sport screen/sport.dart';


class AppCubit extends Cubit<Appstate>{
   AppCubit() : super (initState());
   static AppCubit get(context)=>BlocProvider.of(context);
   List screens=[
      busnisse(),
      science(),
      sport(),
   ];
   List titels=[
      "busnisse",
      "science",
      "sport",
   ];
   int current_Sc_Index=0;

   void changeIndex(Index){
      current_Sc_Index=Index;
      emit(bottomnavchange());
   }
   List <dynamic> business=[];
   void getBusiness()
   {
    DioHelper.getData(url:'v2/top-headlines', query: {
       'country':'eg',
       'category':'business',
       'apikey':'c6e3d9993cb24aaebbb9d3c07aa4e4ae',
    },
    ).then((value) {
       business= value.data['articles'];
       print(value);
       emit(NewsgetBusiness());
    }).catchError((error){
       print("${error.toString()}");
       emit(NewsErrorBusiness(error.toString()));
    });
   }
   List<dynamic>sciences=[];
   void getScience(){
      DioHelper.getData( url: 'v2/top-headlines', query: {
         'country':'eg',
         'category':'science',
         'apikey':'c6e3d9993cb24aaebbb9d3c07aa4e4ae',
      },).then((value){
         sciences=value.data['articles'];
         emit(NewsgetScience());
      }).catchError((error){
         print(error.toString());
         emit(NewsErrorScience(error.toString()));
      });
   }
   List<dynamic>sports=[];
   void getSports(){
      DioHelper.getData( url: 'v2/top-headlines', query: {
         'country':'eg',
         'category':'sports',
         'apikey':'c6e3d9993cb24aaebbb9d3c07aa4e4ae',
      },).then((value){
         sports=value.data['articles'];
         emit(NewsgetSport());
      }).catchError((error){
         print(error.toString());
         emit(NewsErrorSport(error.toString()));
      });
   }
   List <dynamic> searchlist=[];
   void getSearch(String value){
      emit(SearchLoadingsport());
      DioHelper.getData(
          url: 'v2/everything',
          query:{ 'q':'$value',
             'apikey':'c6e3d9993cb24aaebbb9d3c07aa4e4ae',
          }).then((value) {
             searchlist=value.data['articles'];
             print(searchlist[0]);
             emit(SearchGet());
      }).catchError((error){
         emit(SearchErrorSport(error.toString()));
      });
   }
   bool isDark=false;
   void changemode( {  bool? fromshared}){
      if(fromshared !=null){
         isDark=fromshared;
         emit(changeThem());
      }else{
      isDark= !isDark;
      CacheHelper.putbool(key: "isDark", isdark: isDark).then((value) =>
      emit(changeThem()));

      }
   }

}