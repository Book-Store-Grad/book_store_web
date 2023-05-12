part of 'cart_cubit.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}

class GetAllCartLoading extends CartState {}

class GetAllCartSuccess extends CartState {}

class AddToCartLoading extends CartState {}

class AddToCartSuccess extends CartState {}

class RemoveFromCartLoading extends CartState {}

class RemoveFromCartSuccess extends CartState {}

class RemoveFromCartError extends CartState {}

class CartRefresh extends CartState {}
