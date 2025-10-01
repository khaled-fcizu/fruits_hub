part of 'forget_password_cubit.dart';

abstract class ForgetPasswordState  {}

final class ForgetPasswordInitial extends ForgetPasswordState {}
final class ForgetPasswordLoading extends ForgetPasswordState {}
final class ForgetPasswordFailure extends ForgetPasswordState {
  final String message;
   ForgetPasswordFailure({required this.message});
}
final class ForgetPasswordSuccess extends ForgetPasswordState {}
