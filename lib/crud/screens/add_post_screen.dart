import 'package:flutter/material.dart';
import 'package:flutter_basic_app/blocs/post/post_bloc.dart';
import 'package:flutter_basic_app/crud/models/post_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({Key? key}) : super(key: key);

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  final titleTextController = TextEditingController();
  final bodyTextController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final String id =
        ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-id';
    final postBloc = BlocProvider.of<PostBloc>(context, listen: false);

    if (id != 'no-id') {
      postBloc.add(FindPostEvent(int.parse(id)));
    }

    return Scaffold(
      appBar: AppBar(
        title:
            (id == 'no-id') ? const Text('Add Post') : const Text('Edit Post'),
      ),
      body: (id == 'no-id')
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextField(
                    decoration: const InputDecoration(hintText: 'Title Post'),
                    controller: titleTextController,
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    decoration: const InputDecoration(hintText: 'Body Post'),
                    controller: bodyTextController,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      final PostModel postModel = PostModel(
                        userId: 1,
                        id: 0,
                        title: titleTextController.text,
                        body: bodyTextController.text,
                      );
                      postBloc.add(AddPostEvent(postModel));
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.indigo),
                    ),
                    child: const Text('add post'),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: BlocBuilder<PostBloc, PostState>(
                      builder: (context, state) {
                        if (state is PostLoadingState) {
                          return const Text('Agrega un nuevo post');
                        }

                        if (state is PostLoadedState) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Titulo: ${state.post.title}',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              Text(
                                'Body: ${state.post.body}',
                                style: const TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          );
                        }
                        return const Center(
                          child: Text(''),
                        );
                      },
                    ),
                  ),
                ],
              ),
            )
          : BlocBuilder<PostBloc, PostState>(
              builder: (context, state) {
                if (state is PostLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (state is PostLoadedState) {
                  titleTextController.text = state.post.title;
                  bodyTextController.text = state.post.body;
                  return Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextField(
                          decoration:
                              const InputDecoration(hintText: 'Title Post'),
                          controller: titleTextController,
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          decoration:
                              const InputDecoration(hintText: 'Body Post'),
                          controller: bodyTextController,
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {
                            final PostModel postModel = PostModel(
                              userId: 1,
                              id: int.parse(id),
                              title: titleTextController.text,
                              body: bodyTextController.text,
                            );
                            postBloc.add(UpdatePostEvent(postModel));
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.indigo),
                          ),
                          child: const Text('Edit post'),
                        ),
                        Text(
                          'Titulo: ${state.post.title}',
                          style:
                              Theme.of(context).textTheme.headline5?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        Text(
                          'Body: ${state.post.body}',
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
    );
  }
}
