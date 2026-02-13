import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:online_store/feature/home/data/model/product_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());

  final supabase = Supabase.instance.client;

  Future<void> getAllProducts() async {
    emit(ProductLoading());
    try {
      final response = await supabase
          .from('products')
          .select()
          .order('created_at', ascending: false);
      final products = response
          .map<ProductModel>((e) => ProductModel.fromJson(e))
          .toList();

      emit(ProductSuccess(products: products));
    } catch (e) {
      emit(ProductError(message: e.toString()));
    }
  }

  addProducts({
    required String name,
    required String detail,
    required num price,
    required String image,
    required String category,
    required String size,
    required int quantity,
    required int review,
  }) async {
    emit(ProductLoading());
    try {
      await supabase.from('products').insert({
        'name': name,
        'detail': detail,
        'price': price,
        'image': image,
        'category': category,
        'size': size,
        'quantity': quantity,
        'review': review,
      });

      emit(AddProductSuccess(message: "Product added successfully"));
      await getAllProducts(); // Refresh the product list after adding a new product
    } catch (e) {
      emit(ProductError(message: e.toString()));
    }
  }
}
