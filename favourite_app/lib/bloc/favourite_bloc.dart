import 'package:bloc/bloc.dart';
import 'package:favourite_app/bloc/favourite_events.dart';
import 'package:favourite_app/bloc/favourite_states.dart';
import 'package:favourite_app/models/favourite_item_model.dart';
import 'package:favourite_app/repository/favourite_repositry.dart';

class FavouriteBloc extends Bloc<FavouriteEvents, FavouriteStates> {
  List<FavouriteItemModel> favouriteList = [];
  List<FavouriteItemModel> tempList = [];
  final FavouriteRepositry faviouriteRepositry;
  FavouriteBloc(this.faviouriteRepositry) : super(const FavouriteStates()) {
    on<FetchFavouriteListEvent>(fetchList);
    on<FavouriteItemEvent>(addFavourite);
    on<SelectedItemEvent>(selectItems);
    on<UnSelectedItemEvent>(unSelectItems);
    on<DeleteItems>(deleteItems);
  }

  void fetchList(
      FetchFavouriteListEvent event, Emitter<FavouriteStates> emit) async {
    favouriteList = await faviouriteRepositry.fetchItems();
    emit(state.copyWith(favouriteItemList: List.from(favouriteList)));
  }

  void addFavourite(
      FavouriteItemEvent event, Emitter<FavouriteStates> emit) async {
    final index = favouriteList
        .indexWhere((element) => element.id == event.favouriteItemModel.id);
    if (event.favouriteItemModel.isFavourite) {
      if (tempList.contains(favouriteList[index])) {
        tempList.remove(favouriteList[index]);
        tempList.add(event.favouriteItemModel);
      }
    } else {
      if (tempList.contains(favouriteList[index])) {
        tempList.remove(favouriteList[index]);
        tempList.add(event.favouriteItemModel);
      }
    }
    favouriteList[index] = event.favouriteItemModel;
    emit(state.copyWith(
        favouriteItemList: List.from(favouriteList),
        tempItemList: List.from(tempList)));
  }

  void selectItems(
      SelectedItemEvent event, Emitter<FavouriteStates> emit) async {
    tempList.remove(event.favouriteItemModel);
    emit(state.copyWith(tempItemList: List.from(tempList)));
  }

  void unSelectItems(
      UnSelectedItemEvent event, Emitter<FavouriteStates> emit) async {
    tempList.add(event.favouriteItemModel);
    emit(state.copyWith(tempItemList: List.from(tempList)));
  }

  void deleteItems(DeleteItems event, Emitter<FavouriteStates> emit) {
    for (int i = 0; i < tempList.length; i++) {
      favouriteList.remove(tempList[i]);
    }
    tempList.clear();
    emit(state.copyWith(
        tempItemList: List.from(tempList),
        favouriteItemList: List.from(favouriteList)));
  }
}
