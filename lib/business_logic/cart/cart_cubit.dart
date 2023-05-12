import 'package:bloc/bloc.dart';
import 'package:book_store_web/features/cart/repository/cart_repository.dart';
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
    response.data["content"]["cart_items"].forEach(
      (e) => cartItems.add(Cart.fromJson(e)),
    );
    emit(GetAllCartSuccess(
      cartItems: cartItems,
    ));
  }

  // Add Item To Cart
  Future<void> addToCart({
    required int bookId,
  }) async {
    emit(AddToCartLoading());
    Response response = await cartRepository.addToCart(bookId: bookId);
    if (response.statusCode == 200) {
      print("add to cart done");
      emit(AddToCartSuccess());
    }
  }

  // Remove Item From Cart
  Future<void> removeFromCart({
    required int bookId,
  }) async {
    emit(RemoveFromCartLoading());
    Response response = await cartRepository.removeFromCart(bookId: bookId);
    if (response.statusCode == 200) {
      print("removed from cart done");
      emit(RemoveFromCartSuccess());
      getAllCartItems();
    } else {
      print("remove from cart error");
      emit(RemoveFromCartError());
    }
  }

  void refreshPage() {
    emit(CartRefresh());
  }
}

