import 'package:flutter/material.dart';
import 'package:store_pr1/components/components.dart';
import 'package:store_pr1/cubit/cubit_logic/cubit_logic.dart';

class UpdateScreen extends StatefulWidget {
  const UpdateScreen({super.key});

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  TextEditingController product_name = TextEditingController();
  TextEditingController desc = TextEditingController();
  TextEditingController image = TextEditingController();
  int? price;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title:Text("Update"),),
      body:

      SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 150  ,),
            Text_field_component(HintText:'Product Name',controller: product_name,content_type:TextInputType.text),
            SizedBox(height: 20,),
            Text_field_component(HintText: 'Description',controller: desc,content_type:TextInputType.text),
            SizedBox(height: 20,),
            Text_field_component(HintText: 'Price',content_type:TextInputType.number,
                onchange: (data){
              price=int.parse(data);
            }),
            SizedBox(height: 20,),
            Text_field_component(HintText: 'Image'),
            SizedBox(height: 100,),
            Button_component(text:'Submit',width: 400,onPressed: (){

            
            })

        ],),
      ) ,
    );
  }
}
