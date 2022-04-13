import '../../domain/models/product_model.dart';
import '../../domain/types/category_product_type.dart';

final productsListData = [
  ProductModel(
    id: '1',
    name: 'Camiseta Roja',
    description:
        'Es una camiseta de marca oficial con estampado rojo y logo de la marca',
    imageUrl: 'assets/images/products/camiseta_roja.png',
    category: CategoryProductType.tshirts(),
    price: 2.99,
    oldPrice: 4.99,
  ),
  ProductModel(
    id: '2',
    name: 'Camisa Azul',
    description:
        'Es una camiseta de marca oficial con estampado rojo y logo de la marca',
    imageUrl: 'assets/images/products/camisa_azul_pro.png',
    category: CategoryProductType.tshirts(),
    price: 2.99,
    oldPrice: 4.99,
  ),
  ProductModel(
    id: '3',
    name: 'Camiseta Gris',
    description:
        'Es una camiseta de marca oficial con estampado rojo y logo de la marca',
    imageUrl: 'assets/images/products/camiseta_gris_pro.png',
    category: CategoryProductType.tshirts(),
    price: 2.99,
    oldPrice: 4.99,
  ),
  ProductModel(
    id: '4',
    name: 'Falda corta',
    description:
        'Es una camiseta de marca oficial con estampado rojo y logo de la marca',
    imageUrl: 'assets/images/products/falda_uno.png',
    category: CategoryProductType.pants(),
    price: 2.99,
    oldPrice: 4.99,
  ),
  ProductModel(
    id: '5',
    name: 'Gorra venture',
    description:
        'Es una camiseta de marca oficial con estampado rojo y logo de la marca',
    imageUrl: 'assets/images/products/gorra_cinco.png',
    category: CategoryProductType.caps(),
    price: 2.99,
    oldPrice: 4.99,
  ),
  ProductModel(
    id: '6',
    name: 'Gorra español',
    description:
        'Es una camiseta de marca oficial con estampado rojo y logo de la marca',
    imageUrl: 'assets/images/products/gorra_cuatro.png',
    category: CategoryProductType.caps(),
    price: 2.99,
    oldPrice: 4.99,
  ),
  ProductModel(
    id: '7',
    name: 'Vestido de flores',
    description:
        'Es una camiseta de marca oficial con estampado rojo y logo de la marca',
    imageUrl: 'assets/images/products/vestido_cuatro.png',
    category: CategoryProductType.dresses(),
    price: 2.99,
    oldPrice: 4.99,
  ),
  ProductModel(
    id: '8',
    name: 'Zapatos de mujer',
    description:
        'Es una camiseta de marca oficial con estampado rojo y logo de la marca',
    imageUrl: 'assets/images/products/zapatos_seis.png',
    category: CategoryProductType.caps(),
    price: 2.99,
    oldPrice: 4.99,
  ),
];
