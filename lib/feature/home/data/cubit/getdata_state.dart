part of 'getdata_cubit.dart';

@immutable
sealed class GetdataState {}

final class GetdataInitial extends GetdataState {}

final class GetdataLoading extends GetdataState {}

final class GetdataSuccess extends GetdataState {
  final List<Note> data;

  GetdataSuccess(this.data);
}

final class GetdataFaluire extends GetdataState {
  final String errMessage;

  GetdataFaluire(this.errMessage);
}
