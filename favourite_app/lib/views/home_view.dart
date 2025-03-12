import 'package:favourite_app/bloc/favourite_bloc.dart';
import 'package:favourite_app/bloc/favourite_events.dart';
import 'package:favourite_app/bloc/favourite_states.dart';
import 'package:favourite_app/models/favourite_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    context.read<FavouriteBloc>().add(FetchFavouriteListEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        title: const Text(
          'Favourite App',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          BlocBuilder<FavouriteBloc, FavouriteStates>(builder: (context, state){
            return Visibility(
            visible: state.tempItemList.isEmpty?false:true ,
            child: IconButton(
                onPressed: () {
                  context.read<FavouriteBloc>().add(DeleteItems());
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                )),
            );
          })
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: BlocBuilder<FavouriteBloc, FavouriteStates>(
            builder: (context, state) {
          return ListView.builder(
              itemCount: state.favouriteItemList.length,
              itemBuilder: (context, index) {
                final data = state.favouriteItemList[index];
                return Card(
                  child: ListTile(
                    leading: Checkbox(
                        value: state.tempItemList.contains(data) ? true : false,
                        onChanged: (value) {
                          if (value!) {
                            context.read<FavouriteBloc>().add(
                                UnSelectedItemEvent(favouriteItemModel: data));
                          } else {
                            context.read<FavouriteBloc>().add(
                                SelectedItemEvent(favouriteItemModel: data));
                          }
                        }),
                    title: Text(data.value),
                    trailing: IconButton(
                      onPressed: () {
                        FavouriteItemModel items = FavouriteItemModel(
                            id: data.id,
                            value: data.value,
                            isFavourite: data.isFavourite ? false : true);
                        context
                            .read<FavouriteBloc>()
                            .add(FavouriteItemEvent(favouriteItemModel: items));
                      },
                      icon: Icon(
                        Icons.favorite,
                        color: data.isFavourite ? Colors.red : Colors.grey,
                      ),
                    ),
                  ),
                );
              });
        }),
      ),
    );
  }
}
