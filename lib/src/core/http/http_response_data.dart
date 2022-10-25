abstract class ResponseData<T> {
  final T? data;
  final int? total;
  final String? errorMessage;

  ResponseData({this.data, this.errorMessage, this.total});
}

class ResponseSuccess<T> extends ResponseData<T> {
  ResponseSuccess(T data, {int? total}) : super(data: data, total: total);
}

class ResponseFailure<T> extends ResponseData<T> {
  ResponseFailure(String errorMessage) : super(errorMessage: errorMessage);
}

// class RemoteData<T> {
//   final T data;
//   final int total;

//   RemoteData({required this.data, required this.total});
// }
