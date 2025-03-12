import 'package:equatable/equatable.dart';
import 'package:favourite_app/models/favourite_item_model.dart';

abstract class FavouriteEvents extends Equatable {
  const FavouriteEvents();
}

class FetchFavouriteListEvent extends FavouriteEvents {
  @override
  List<Object?> get props => [];
}

class FavouriteItemEvent extends FavouriteEvents {
  final FavouriteItemModel favouriteItemModel;

  const FavouriteItemEvent({required this.favouriteItemModel});

  @override
  List<Object?> get props => [favouriteItemModel];
}

class SelectedItemEvent extends FavouriteEvents {
  final FavouriteItemModel favouriteItemModel;

  const SelectedItemEvent({required this.favouriteItemModel});

  @override
  List<Object?> get props => [favouriteItemModel];
}

class UnSelectedItemEvent extends FavouriteEvents {
  final FavouriteItemModel favouriteItemModel;

  const UnSelectedItemEvent({required this.favouriteItemModel});

  @override
  List<Object?> get props => [
        favouriteItemModel,
      ];
}

class DeleteItems extends FavouriteEvents {
  @override
  List<Object?> get props => [];
}
