import 'package:api_integration_app/models/api_response_model.dart';
import 'package:api_integration_app/utils/enums.dart';
import 'package:equatable/equatable.dart';

class ApiStates extends Equatable {
  final PostStatus postStatus;
  final List<ApiResponseModel> apiList;
  final List<ApiResponseModel> temApiList;
  final String message;
  final String searchMessage;

  const ApiStates(
      {this.apiList = const <ApiResponseModel>[],
      this.temApiList = const <ApiResponseModel>[],
      this.postStatus = PostStatus.loading,
      this.message = '',
      this.searchMessage = ''});

  ApiStates copyWith(
      {PostStatus? postStatus,
      List<ApiResponseModel>? apiList,
      String? message,
      List<ApiResponseModel>? temApiList,
      String? searchMessage}) {
    return ApiStates(
        apiList: apiList ?? this.apiList,
        postStatus: postStatus ?? this.postStatus,
        message: message ?? this.message,
        temApiList: temApiList ?? this.temApiList,
        searchMessage: searchMessage ?? this.searchMessage);
  }

  @override
  List<Object?> get props => [postStatus, apiList, temApiList, message, searchMessage];
}
