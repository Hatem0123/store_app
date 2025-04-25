import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_pr1/components/components.dart';
import 'package:store_pr1/cubit/cubit_logic/cubit_logic.dart';
import 'package:store_pr1/models/product_model.dart';

class UpdateScreen extends StatefulWidget {
   UpdateScreen({super.key,this.products});

  dynamic products;

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  TextEditingController product_name = TextEditingController();

  TextEditingController desc = TextEditingController();

  TextEditingController image = TextEditingController();

  String? price;
  bool Isloading = false;
  @override
  Widget build(BuildContext context) {

    Product_model prr =widget.products;
    return

      BlocProvider(
        create: (context)=>App_cubit(),
        child:
        
        ModalProgressHUD(
          inAsyncCall:Isloading ,
          child: Scaffold(
            appBar: AppBar(title:Text("Update"),),
          body:
          
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(child: Text('${prr.category}')),
                SizedBox(height: 150 ,),
                Text_field_component(HintText:'${prr.title}',controller: product_name,content_type:TextInputType.text),
                SizedBox(height: 20,),
                Text_field_component(HintText: '${prr.description}',controller: desc,content_type:TextInputType.text),
                SizedBox(height: 20,),
                Text_field_component(HintText: '${prr.price}',content_type:TextInputType.number,
                    onchange: (data){
                  price=data;
                }),
                SizedBox(height: 20,),
                Text_field_component(HintText: 'Image'),
                SizedBox(height: 100,),
                Button_component(text:'Submit',width: 400,onPressed: ()async{
                  Isloading =true;
                  setState(() {
                  });

                  try {
                    await put_prodactito(context, prr);
                    print('Succes');
                  } catch (e) {

                    print(e);
                  }
                  Isloading = false;
                  setState(() {});

          
                })

          
            ],),
          ) ,
              ),
        ),
      );
  }

  Future<void> put_prodactito(BuildContext context, Product_model prr)async {
    await App_cubit.get(context).put_product(
        id: prr.id,
        title:product_name.text ,
        price:price.toString() ,
        desc:desc.text ,
        image:image.text ,
        category:prr.category );
  }
}
