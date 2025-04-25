import 'package:flutter/material.dart';
import 'package:store_pr1/models/product_model.dart';
import 'package:store_pr1/views/update_screen/update_screen.dart';

Widget Custome_card({ products,BuildContext? context})=>

    GestureDetector(
      onTap: (){
        Navigationito(context,UpdateScreen(products: products,));
      },
      child: Container(
        width: 220,
        height: 130,
        // color: Colors.white,
        decoration: BoxDecoration(

            boxShadow: [BoxShadow(
                color:Colors.grey.shade300,
                blurRadius: 10,
                spreadRadius: 0,
                offset: Offset(5, 5)

            )]
        ),
        child:

        Stack(

          clipBehavior: Clip.none,
          children: [
            Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 30,),
                    Expanded(
                      child: Text(products.title.substring(0,6),
                        style:TextStyle(color:Colors.black87,fontSize:14),),
                    ),
                    SizedBox(height: 15,),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(r'$''${products.price.toString()}',style:TextStyle(color:Colors.black87,fontSize:14),),
                          Icon(Icons.favorite,color:Colors.red,)

                        ],
                      ),
                    ),



                  ],
                ),
              ),

            ),


            Positioned(
              right: 32,
              bottom: 70,
              child: Image.network(products.image,
                height:100,
                width: 100,

              ),
            )
          ],
        ),
      ),
    );

void Navigationito(context,Widget widget)=>
    Navigator.push(context,MaterialPageRoute(builder: (context)=>widget));

Widget Text_field_component(
    {
      String? HintText,
      String? LabelText,
      Widget? icon,
      Widget? icon_suffix,
      bool? Is_password =false,
      void Function(String)? onchange,

      void Function(String)? onSubmit,
      TextInputType? content_type,
      TextEditingController? controller
      //String? Function(String?)? validator
    }

    )=>
    Padding(
      padding: const EdgeInsets.only(left: 15,right: 15),
      child: TextFormField(
        validator: (String? data){
          if(data!.isEmpty){
            return 'please enter data';
          }
          else if(data.length < 3){
            return 'please enter above 3 charchters';
          }
          return null;
        },
        onChanged: onchange,
        onFieldSubmitted: onSubmit,
        controller: controller,
        obscureText:Is_password!,
        keyboardType:content_type,
        decoration: InputDecoration(
            hintText: HintText,
            labelText: LabelText,
            hintStyle: TextStyle(color:Colors.black38),
            prefixIcon: icon,
            suffixIcon:icon_suffix ,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.white)
            ),
            focusedBorder:OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(20),
            ) ,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.orange),
              borderRadius: BorderRadius.circular(20),
            )
        ),
      ),
    );
Widget Button_component({double? width,double? height,void Function()? onPressed,
  String? text})=>SizedBox(
  width: width,
  height: height,
  child: ElevatedButton(onPressed: onPressed,

      style:ElevatedButton.styleFrom(
        elevation: 5,
        backgroundColor: Colors.orangeAccent,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12)
        ),




      ),
      child: Text("$text",style:TextStyle(fontFamily:'spicy',color: Colors.black),)
  ),
);