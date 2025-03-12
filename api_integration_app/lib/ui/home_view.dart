import 'package:api_integration_app/bloc/api_bloc.dart';
import 'package:api_integration_app/bloc/api_events.dart';
import 'package:api_integration_app/bloc/api_states.dart';
import 'package:api_integration_app/utils/enums.dart';
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
    context.read<ApiBloc>().add(FetchData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home View', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue[400],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: BlocBuilder<ApiBloc, ApiStates>(builder: (context, state) {
          switch (state.postStatus) {
            case PostStatus.loading:
              return Center(child: const CircularProgressIndicator());

            case PostStatus.failure:
              return Text(state.message.toString());

            case PostStatus.success:
              return Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                        hintText: 'Search...', border: OutlineInputBorder()),
                    onChanged: (filterkey) {
                      context.read<ApiBloc>().add(FilterData(filterkey));
                    },
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: state.searchMessage.isEmpty
                        ? ListView.builder(
                            shrinkWrap: true,
                            itemCount: state.temApiList.isEmpty
                                ? state.apiList.length
                                : state.temApiList.length,
                            itemBuilder: (context, index) {
                              if (state.temApiList.isNotEmpty) {
                                final data = state.temApiList[index];
                                return Card(
                                  child: ListTile(
                                    title: Text(data.title ?? ''),
                                    subtitle: Text(data.body ?? ''),
                                  ),
                                );
                              } else {
                                final data = state.apiList[index];
                                return Card(
                                  child: ListTile(
                                    title: Text(data.title ?? ''),
                                    subtitle: Text(data.body ?? ''),
                                  ),
                                );
                              }
                            })
                        : Center(
                            child: Text(state.searchMessage),
                          ),
                  ),
                ],
              );
          }
        }),
      ),
    );
  }
}
