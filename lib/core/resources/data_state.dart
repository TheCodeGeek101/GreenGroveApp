// Import necessary dependencies
import 'package:dio/dio.dart';

// Generic abstract class representing the state of data
abstract class DataState<T> {
  // Nullable field for the data associated with the state
  final T? data;

  // Nullable field for an error associated with the state
  final DioError? error;

  // Constructor to initialize DataState with optional data and error parameters
  const DataState({this.data, this.error});
}

// Concrete class representing a successful data state
class DataSuccess<T> extends DataState<T> {
  // Constructor to initialize DataSuccess with non-nullable data
  const DataSuccess(T data) : super(data: data);
}

// Concrete class representing a failed data state
class DataFailed<T> extends DataState<T> {
  // Constructor to initialize DataFailed with non-nullable error
  const DataFailed(DioError error) : super(error: error);
}
