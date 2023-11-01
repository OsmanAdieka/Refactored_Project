import 'package:refactored_project/Models/Coffee_type_models.dart';

class CoffeModel {
  String name;
  String image;
  List<String> type;
  String price;
  

CoffeModel(
  {
    required this.name,
    required this.image,
    required this.type,
    required this.price,
    }
    );
}
  
var coffee = [
  CoffeModel(
  name: "Tiramisu Coffe", 
  image: 'assets/Images/tiramisu_latte.jpg', 
  type: [coffee_models.Latte], 
  price: "25K"
  ),

  CoffeModel(
  name: "Vanilla Latte x Lion Year Edition", 
  image: 'assets/Images/lion_latte.jpg', 
  type: [coffee_models.Latte],  
  price: "28K"
  ),

  CoffeModel(
  name: "Creme Brulee", 
  image: 'assets/Images/creme_brulee.jpg', 
  type: [coffee_models.Creme], 
  price: "26K"
  ),

  CoffeModel(
  name: "Chocolate pots de creme", 
  image: 'assets/Images/chococreme.jpg', 
  type: [coffee_models.Chocolate], 
  price: "30K"
  )
];
  
