abstract class ResponseData<T> {
  final T? data;
  final int? totalItens;
  final String? errorMessage;

  ResponseData({this.data, this.errorMessage, this.totalItens});
}

class ResponseSuccess<T> extends ResponseData<T> {
  ResponseSuccess(T data, {int? total}) : super(data: data, totalItens: total);
}

class ResponseFailure<T> extends ResponseData<T> {
  ResponseFailure(String errorMessage) : super(errorMessage: errorMessage);
}

class ResponseCanceled<T> extends ResponseData<T> {
  ResponseCanceled() : super();
}

class ResponseExpired<T> extends ResponseData<T> {
  ResponseExpired() : super(errorMessage: 'Sua sessão expirou!');
}

class RemoteData<T> {
  final T data;
  final int total;

  RemoteData({required this.data, required this.total});
}
