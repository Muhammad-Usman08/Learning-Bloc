import 'package:equatable/equatable.dart';
import 'package:favourite_app/models/favourite_item_model.dart';

class FavouriteStates extends Equatable {
  final List<FavouriteItemModel> favouriteItemList;
  final List<FavouriteItemModel> tempItemList;

  const FavouriteStates({this.favouriteItemList = const [], this.tempItemList = const []});

  FavouriteStates copyWith({List<FavouriteItemModel>? favouriteItemList, List<FavouriteItemModel>? tempItemList}){
    return FavouriteStates(favouriteItemList: favouriteItemList ?? this.favouriteItemList, tempItemList: tempItemList??this.tempItemList);
  }

  @override
  List<Object?> get props => [favouriteItemList, tempItemList];
}
