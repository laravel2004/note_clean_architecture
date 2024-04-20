  import 'package:dio/dio.dart';

abstract class DataState<T> {
  final DioException? error;
  final T? data;

  const DataState({this.error, this.data});

}

class DataSuccess<T> extends DataState<T> {
  DataSuccess(T data) : super(data: data);
}

class DataFailed<T> extends DataState<T> {
  DataFailed(DioException error) : super(error: error);
}