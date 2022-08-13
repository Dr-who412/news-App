import 'package:flutter/material.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

import '../../module/webViewSearch/webViewSearch.dart';
Widget BuildItems(item,context)=>item!=null?InkWell(
  onTap: (){
    navigatTo(context,WebViewSearch(url: item['url'],),);
  },
  child:   Container(

      padding: EdgeInsets.only(top: 4,bottom:4,right: 5,left: 5),

      height: 120.0,

      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),

      //padding: EdgeInsets.all(2.0),

      child: Row(

        children: [

          Container(

            height: 120.0,

            width: 120.0,

            decoration: BoxDecoration(

                borderRadius: BorderRadius.circular(10.0),

                image: DecorationImage(

                    image: NetworkImage(

                        "${item['urlToImage']}"),

                    fit: BoxFit.cover)),

          ),

          SizedBox(

            width: 10.0,

          ),

          Expanded(

              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,

                mainAxisAlignment: MainAxisAlignment.start,

                children: [

                  Expanded(

                      child: Text(

                        "${item['title']}",

                        maxLines: 3,

                        overflow: TextOverflow.ellipsis,

                        style:Theme.of(context).textTheme.bodyText1,

                        // TextStyle(

                        //     fontSize: 16,

                        //     fontWeight: FontWeight.bold,

                        //     color: Colors.black),

                      )),

                  SizedBox(

                    height: 5,

                  ),

                  Text(

                    "${item['publishedAt']}",

                    maxLines: 1,

                    overflow: TextOverflow.ellipsis,

                    style: TextStyle(

                        fontSize: 12,

                        fontWeight: FontWeight.bold,

                        color: Colors.grey),

                  ),

                  Divider(color: Colors.grey,)

                ],

              ))

        ],

      ),

    ),
):Center(child: CircularProgressIndicator(),);

  Widget coditionalList(List <dynamic> list,context,{isSearch=false})=>ConditionalBuilder(
    condition: list.isNotEmpty,
    builder: (BuildContext context) =>ListView.builder(itemBuilder: (context,int i)=>BuildItems(list[i],context),
      itemCount: list.length,
    ),
    fallback: (BuildContext context) =>isSearch?Container(): Center(child: CircularProgressIndicator()),
  );
Future navigatTo(context,widget){
  return Navigator.push(context,MaterialPageRoute(builder:(context)=>widget));
}