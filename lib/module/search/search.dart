import 'package:breakingnews/module/cubit/cubit.dart';
import 'package:breakingnews/module/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/componant/componant.dart';
class searchs extends StatelessWidget {

var searchcontoler=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,Appstate>(
         listener: (BuildContext context,state){},
      builder: (BuildContext context, state){
           var cubit =AppCubit.get(context);
           return Scaffold(
             appBar: AppBar(),
             body: Column(
               children: [
                 Padding(
                   padding: const EdgeInsets.all(6.0),
                   child: TextFormField(
                     controller: searchcontoler,
                     maxLines: 1,
                     keyboardType: TextInputType.text,
                     validator: (value){
                       if(value!.isEmpty){
                         return "Search can't be empty";
                       }
                       return null;
                     },
                     onChanged: (value){
                       cubit.getSearch(value);
                     },

                     decoration: InputDecoration(
                       label: Text("Search"),
                       prefix: Icon(Icons.search),

                     ),
                   ),
                 ),
                 Expanded(child: coditionalList(cubit.searchlist,context,isSearch: true)),
               ]
             ),
           );
      },);
  }
}
