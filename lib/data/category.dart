import 'package:burger/models/category_product.dart';

import '../models/category.dart';

List<CategoryItem> categories = [
  CategoryItem(
    id: 1,
    name: "Signature Burgers",
    img: "assets/img/sig.png",
    categoryProduct: [
      CategoryProduct(
        id: 1,
        name: "American Burger",
        img: "assets/img/amerikanBurger.png",
        price: 10.99,
      ),
      CategoryProduct(
        id: 2,
        name: "Spicy Southwest Burger",
        img: "assets/img/spicy.png",
        price: 11.99,
      ),
      CategoryProduct(
        id: 3,
        name: "Truffle Bliss Burger",
        img: "assets/img/truffle.png",
        price: 12.99,
      ),
      CategoryProduct(
        id: 4,
        name: "Galactic Veggie Delight",
        img: "assets/img/galactic.png",
        price: 12.99,
      ),
      CategoryProduct(
        id: 5,
        name: "Peanut Butter Paradise Burger",
        img: "assets/img/peanut.png",
        price: 14.99,
      ),
    ],
  ),
  CategoryItem(
    id: 2,
    name: "Gourmet Creations",
    img: "assets/img/gour.png",
    categoryProduct: [
      CategoryProduct(
        id: 6,
        name: "Peanut Butter Paradise Burger",
        img: "assets/img/bbq.png",
        price: 13.99,
      ),
      CategoryProduct(
        id: 7,
        name: "Beyond Garden Burger",
        img: "assets/img/beyond.png",
        price: 14.99,
      ),
    ],
  ),
  CategoryItem(
    id: 3,
    name: "Sides",
    img: "assets/img/sides.png",
    categoryProduct: [
      CategoryProduct(
        id: 8,
        name: "Truffle Parmesan Tater Tots",
        img: "assets/img/truffle_balls.png",
        price: 5.99,
      ),
      CategoryProduct(
        id: 9,
        name: "Buffalo Cauliflower Bites",
        img: "assets/img/buffalo.png",
        price: 6.99,
      ),
      CategoryProduct(
        id: 10,
        name: "Crispy Onion Rings",
        img: "assets/img/crispy.png",
        price: 4.99,
      ),
      CategoryProduct(
        id: 11,
        name: "Potato Fries",
        img: "assets/img/fries.png",
        price: 3.99,
      ),
    ],
  ),
  CategoryItem(
    id: 4,
    name: "Kid's Menu",
    img: "assets/img/kids.png",
    categoryProduct: [
      CategoryProduct(
        id: 12,
        name: "Mini Cheeseburger",
        img: "assets/img/mini-cheese.png",
        price: 5.99,
      ),
      CategoryProduct(
        id: 13,
        name: "Dino Nuggets Adventure",
        img: "assets/img/dino.png",
        price: 6.99,
      ),
      CategoryProduct(
        id: 14,
        name: "Grilled Chicken Strips",
        img: "assets/img/grilled-chicken.png",
        price: 6.99,
      ),
      CategoryProduct(
        id: 15,
        name: "Fruit Cup Delight",
        img: "assets/img/fruit.png",
        price: 2.99,
      ),
    ],
  ),
  CategoryItem(
    id: 5,
    name: "Drinks",
    img: "assets/img/drinks.png",
    categoryProduct: [
      CategoryProduct(
        id: 16,
        name: "Refreshing Citrus Splash",
        img: "assets/img/refreshing.png",
        price: 2.99,
      ),
      CategoryProduct(
        id: 17,
        name: "Berry Burst Lemonade",
        img: "assets/img/berry.png",
        price: 1.99,
      ),
      CategoryProduct(
        id: 18,
        name: "Classic Iced Tea",
        img: "assets/img/ice-tea.png",
        price: 2.99,
      ),
      CategoryProduct(
        id: 19,
        name: "Smooth Cold Brew Coffee",
        img: "assets/img/smooth.png",
        price: 2.99,
      ),
      CategoryProduct(
        id: 20,
        name: "Classic Shake",
        img: "assets/img/shake.png",
        price: 3.99,
      ),
      CategoryProduct(
        id: 21,
        name: "Bottled Water",
        img: "assets/img/water.png",
        price: 1.29,
      ),
    ],
  ),
];
