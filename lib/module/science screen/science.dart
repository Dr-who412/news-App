import 'package:breakingnews/module/cubit/cubit.dart';
import 'package:breakingnews/module/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/componant/componant.dart';
class science extends StatelessWidget {
  const science({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,Appstate>(
      listener: (BuildContext context, Object? state) {  },
      builder: (BuildContext context, state) {
        var list=AppCubit.get(context).sciences;
        return coditionalList(list,context); },
    );
  }
}