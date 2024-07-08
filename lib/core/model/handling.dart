class ResultModel{}
class ErrorModel extends ResultModel{}
class ExceptionModel extends ResultModel {
  final message;
  ExceptionModel({required this.message});

}
class SuccessModel extends ResultModel{}