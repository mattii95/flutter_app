import 'package:flutter/material.dart';
import 'package:flutter_basic_app/blocs/post_list/post_list_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CRUDScreen extends StatelessWidget {
  const CRUDScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final post = BlocProvider.of<PostListBloc>(context, listen: false)
        .add(PostListLoadedEvent());
    return Scaffold(
      appBar: AppBar(
        title: const Text('CRUD Posts'),
      ),
      body: BlocBuilder<PostListBloc, PostListState>(
        builder: (context, state) {
          if (state is PostListLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is PostListLoadedState) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  margin: const EdgeInsets.all(8),
                  child: ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, 'post',
                          arguments: state.posts[index].id);
                    },
                    title: Text(
                      state.posts[index].title.toUpperCase(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    trailing: const Icon(Icons.arrow_right_outlined),
                  ),
                );
              },
              itemCount: state.posts.length,
            );
          }

          return const Center(
            child: Text('No data'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Navigator.pushNamed(context, 'add-post', arguments: 'no-id'),
        child: const Icon(Icons.add),
      ),
    );
  }
}
