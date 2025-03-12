import 'package:api_integration_app/bloc/api_events.dart';
import 'package:api_integration_app/bloc/api_states.dart';
import 'package:api_integration_app/models/api_response_model.dart';
import 'package:api_integration_app/repository/api_repository.dart';
import 'package:api_integration_app/utils/enums.dart';
import 'package:bloc/bloc.dart';

class ApiBloc extends Bloc<ApiEvents, ApiStates> {
  List<ApiResponseModel> tempList = [];

  ApiRepository apiRepository = ApiRepository();
  ApiBloc() : super(const ApiStates()) {
    on<FetchData>(_getApiData);
    on<FilterData>(_filterData);
  }

  void _getApiData(FetchData event, Emitter<ApiStates> emit) async {
    await apiRepository.fetchData().then((value) {
      emit(state.copyWith(
          postStatus: PostStatus.success, message: 'Success', apiList: value));
    }).onError((e, stackTrace) {
      print(stackTrace);
      emit(state.copyWith(
          message: e.toString(), postStatus: PostStatus.failure));
    });
  }

  void _filterData(FilterData event, Emitter<ApiStates> emit) async {
    if (event.stSearch.isEmpty) {
      emit(state.copyWith(temApiList: []));
    } else {
      tempList = state.apiList
          .where(
              (element) => element.title.toString().toLowerCase().contains(event.stSearch.toLowerCase()))
          .toList();
      if (tempList.isEmpty) {
        emit(state.copyWith(temApiList: tempList, searchMessage: 'Data Not Found!' ));
      } else {
        emit(state.copyWith(temApiList: tempList, searchMessage: ''));
      }
    }
  }
}
