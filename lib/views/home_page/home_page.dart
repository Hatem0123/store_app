import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_pr1/components/components.dart';
import 'package:store_pr1/cubit/cubit_logic/cubit_logic.dart';
import 'package:store_pr1/cubit/cubit_state/cubit_state.dart';

class HomePage extends StatelessWidget {
   HomePage({super.key});

  @override
  Widget build(BuildContext context) {


    return

      BlocBuilder<App_cubit,App_state>(
       bloc: App_cubit()..Get_product(),
        builder: (context,state) {
          var cubit =App_cubit.products_list;
          if(state is App_init_state){
            return Scaffold(backgroundColor:Colors.white,body: Center(child: CircularProgressIndicator()),);
          }
          else if(state is app_error_state){
            return Center(child: Text("THERE was an error"));
          }
          else{
            return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                clipBehavior: Clip.none,
                scrolledUnderElevation: 0.0,

                backgroundColor: Colors.white ,
                elevation: 0,
                title: Text("New Trend"),
                actions: [
                  IconButton(onPressed: (){}, icon:Icon(Icons.shopping_cart)),
                ],
              ),
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3),
                child:
                   GridView.builder(
                     padding: EdgeInsets.only(top: 50),
                  shrinkWrap: true,
                  physics:BouncingScrollPhysics() ,
                  clipBehavior: Clip.none,
                  gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:2,
                      childAspectRatio: 1.7,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 50
                  ) ,

                  itemBuilder:(context,index)=>Custome_card(context: context,products: cubit[index]),
                  itemCount:cubit.length)

              ),
            );
          }
        },
      );
  }
}

/*
    BlocBuilder<App_cubit,App_state>(
       bloc: App_cubit()..Get_product(),
        builder: (context,state) {
          var cubit =App_cubit.products_list;

          if(state is App_init_state){
            return Center(child: CircularProgressIndicator());
          }
          else if(state is app_error_state){

            return Text("THERE was an errer");
          }
          else{
            return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: Colors.white ,
                elevation: 0,
                title: Text("New Trend"),
                actions: [
                  IconButton(onPressed: (){}, icon:Icon(Icons.shopping_cart)),
                ],
              ),
              body: Padding(
                padding: const EdgeInsets.only(top: 40),
                child: ListView.separated(
                    padding: EdgeInsets.only(left: 70,right: 70),

                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    clipBehavior: Clip.none,
                    itemBuilder: (context,index)=>Custome_card(products:cubit[index]),
                    separatorBuilder: (context,index)=>Divider(),
                    itemCount:cubit.length ),
              ),
            );
          }
        },
      );
 */
// ListView.separated(
//     padding: EdgeInsets.only(left: 70,right: 70),
//
//     physics: BouncingScrollPhysics(),
//     shrinkWrap: true,
//     clipBehavior: Clip.none,
//     itemBuilder: (context,index)=>Custome_card(products:cubit[index]),
//     separatorBuilder: (context,index)=>Divider(thickness: 0.0,height: 50,color:Colors.transparent,),
//     itemCount:cubit.length ),