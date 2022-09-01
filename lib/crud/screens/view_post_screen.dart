import 'package:flutter/material.dart';
import 'package:flutter_basic_app/blocs/post/post_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewPostScreen extends StatelessWidget {
  const ViewPostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String id =
        ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-id';

    final post = BlocProvider.of<PostBloc>(context, listen: false);
    post.add(FindPostEvent(int.parse(id)));

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              post.add(DeletePostEvent(int.parse(id)));
            },
            icon: const Icon(Icons.delete_outline),
          ),
        ],
      ),
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          if (state is PostLoadingState) {
            return const Center(
              child: Text('No data'),
            );
          }

          if (state is PostLoadedState) {
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    state.post.title.toUpperCase(),
                    style: Theme.of(context).textTheme.headline5?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    state.post.body,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            );
          }
          return const Center(
            child: Text('No data'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Navigator.pushNamed(context, 'add-post', arguments: id),
        child: const Icon(Icons.edit_note_outlined),
      ),
    );
  }
}
