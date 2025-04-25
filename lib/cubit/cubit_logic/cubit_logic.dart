import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_pr1/cubit/cubit_state/cubit_state.dart';
import 'package:store_pr1/models/product_model.dart';
import 'package:store_pr1/network/api/api_helper.dart';

class App_cubit extends Cubit<App_state>{

  App_cubit():super(App_init_state());

  static App_cubit get(context)=>BlocProvider.of(context);
  static List<Product_model?>products_list=[];

  static var sp_products_list = [];
 static  var put_products_list=[];


   Future<List<Product_model?>> Get_product()async{


    try {
      dynamic data =await Api_helper.GET(URL:'https://fakestoreapi.com/products');

      for(int i=0;i < data.length;i++){
            products_list.add(Product_model.FromJson(data[i]));
          }
          print(products_list[0]!.title);
      // products_list = data.map((item) => Product_model.FromJson(item)).toList();
      // emit(App_screen_succes_state(model: products_list));
      emit(App_screen_succes_state());
      return products_list;
    } catch (e) {
      print(e);
    }


  throw Exception();

  }
  static Future<dynamic> get_all_categories()async{

    var categoirs=  Api_helper.GET(URL:'https://fakestoreapi.com/products/categories');

    return categoirs;
  }

  Future<List<dynamic>> Get_sp_categ({String? category}) async {

    var sp_category= await Api_helper.GET(URL:'https://fakestoreapi.com/products/category/$category');


    for (int i = 0; i < sp_category.length;) {
      sp_products_list.add(Product_model.FromJson(sp_category[i]));

      return sp_products_list;
    }


    throw(Exception);

  }


  static Future<dynamic> post_product({String?title,dynamic price,String?desc,String?image,String?category})
  async{
    // var response=await http.get(Uri.parse('https://fakestoreapi.com/products'));
    var data =await Api_helper.POST(URL: 'https://fakestoreapi.com/products',body:{
      'title': title,
      'price':price,
      'description': desc,
      'image': image,
      'category': category,

    });


    return Product_model.FromJson(data);

  }



   Future<Product_model> put_product({String?title,dynamic price,String?desc,String?image,String?category,int? id})async{
           print('prduct id is ${id.toString()}');
    var data =await Api_helper.PUT(URL:'https://fakestoreapi.com/products/$id',body:{
      'title': title,
      'price':price,
      'description': desc,
      'image': image,
      'category': category,

    });



    return Product_model.FromJson(data);






  }
}