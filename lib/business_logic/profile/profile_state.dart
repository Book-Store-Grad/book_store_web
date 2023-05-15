part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

///get profile
class ProfileLoadingState extends ProfileState {}

class ProfileSuccessState extends ProfileState {}

class ProfileErrorState extends ProfileState {}

///update profile
class UpdateProfileLoadingState extends ProfileState {}

class UpdateProfileSuccessState extends ProfileState {}

class UpdateProfileErrorState extends ProfileState {}
///Get profile Image
class GetProfileImageLoadingState extends ProfileState {}

class GetProfileImageSuccessState extends ProfileState {}

class GetProfileImageErrorState extends ProfileState {}

///update Profile Image
class UpdateProfileImageLoadingState extends ProfileState {}

class UpdateProfileImageSuccessState extends ProfileState {}

class UpdateProfileImageErrorState extends ProfileState {}

///Choose Image from device
class ChooseImageState extends ProfileState {}
