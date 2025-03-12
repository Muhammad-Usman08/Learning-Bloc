import 'package:favourite_app/models/favourite_item_model.dart';

class FavouriteRepositry {
  Future<List<FavouriteItemModel>> fetchItems() async {
    await Future.delayed(const Duration(seconds: 3));
    return List.of(_generateList(10));
  }

  List<FavouriteItemModel> _generateList(int length) {
    return List.generate(length, (index)=> FavouriteItemModel(id: index.toString(), value: 'Item $index'));
  }
}
