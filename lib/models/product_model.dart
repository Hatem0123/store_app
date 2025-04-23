class Product_model{

 final int? id ;
 final String? title,description,image;
 final dynamic rating_model,price;

  Product_model({this.id, this.title, this.price, this.description, this.image,this.rating_model});
  factory Product_model.FromJson(json_data)=> Product_model(id:json_data['id'],
        title: json_data['title'],
        price: json_data['price'],
        description:json_data['description'],
        image: json_data['image'],
        rating_model: json_data['rating']['rate']
    );
}

// class Rating_model{
//
//   double? rate;
//   int? count;
//
//   Rating_model({this.rate, this.count});
//
//   factory Rating_model.fromJson(json_rate){
//
//     return Rating_model(rate:json_rate['rate'],count:json_rate['count']);
//   }
//
//
//
//
//
// }