import 'package:bloc/bloc.dart';
import 'package:book_store_web/features/cart/repository/cart_repository.dart';
import 'package:book_store_web/models/book.dart';
import 'package:book_store_web/models/cart.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  // Cart Repository
  CartRepository cartRepository = CartRepository();

  // Cart Operations

  // Get All Cart Items
  List<Cart> cartItems = [];

  Future<void> getAllCartItems() async {
    emit(GetAllCartLoading());
    Response response = await cartRepository.getAllCartItems();
    cartItems.clear();
    response.data["content"]["cart_items"].forEach(
      (e) => cartItems.add(Cart.fromJson(e)),
    );
    emit(GetAllCartSuccess());
  }

  // Add Item To Cart
  Future<void> addToCart({
    required int bookId,
  }) async {
    emit(AddToCartLoading());
    Response response = await cartRepository.addToCart(cartId: bookId);
    if (response.statusCode == 200) {
      print("add to cart done");
      emit(AddToCartSuccess());
    }
  }

  // Remove Item From Cart
  Future<void> removeFromCart({
    required int cartId,
  }) async {
    emit(RemoveFromCartLoading());
    try {
      Response response = await cartRepository.removeFromCart(cartId: cartId);
      if (response.statusCode == 200) {
        cartItems.removeWhere((element) => element.cartId == cartId);
        emit(RemoveFromCartSuccess());
      } else {
        emit(RemoveFromCartError());
      }
    } catch (e) {
      emit(RemoveFromCartError());
    }
  }
}
