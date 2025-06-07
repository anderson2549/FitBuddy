import 'package:flutter/material.dart';
import 'dart:developer' as developer;

class InfiniteScrollScreen extends StatefulWidget {
  static const name = 'infinite_scroll_screen';

  final ImageProvider Function(int id)? imageProviderBuilder;

  const InfiniteScrollScreen({super.key, this.imageProviderBuilder});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  List<int> imageIds = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  final ScrollController scrollController = ScrollController();
  bool isLoading = false;
  bool isMounted = true;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if ((scrollController.position.pixels + 500) >=
          scrollController.position.maxScrollExtent) {
        loadNextPage().then((value) {
          developer.log('Cargando siguiente página', name: 'com.example.app');
        });
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    isMounted = false;
    super.dispose();
  }

  addIds() {
    final lastId = imageIds.last;
    imageIds.add(lastId + 1);
    imageIds.add(lastId + 2);
    imageIds.add(lastId + 3);
    imageIds.add(lastId + 4);
    imageIds.add(lastId + 5);
  }

  Future loadNextPage() async {
    if (isLoading) return;
    isLoading = true;
    await Future.delayed(const Duration(seconds: 2));
    addIds();
    isLoading = false;
    if (!isMounted) return;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: ListView.builder(
          controller: scrollController,
          itemCount: imageIds.length, // Mostrar todos los IDs
          itemBuilder: (context, index) {
            final imageProvider =
                widget.imageProviderBuilder != null
                    ? widget.imageProviderBuilder!(imageIds[index])
                    : NetworkImage(
                        "https://picsum.photos/id/${imageIds[index]}/500/300",
                      );
            return FadeInImage(
              placeholder: AssetImage('assets/images/jar-loading.gif'),
              image: imageProvider,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 300,
              fadeInDuration: const Duration(milliseconds: 300),
              fadeOutDuration: const Duration(milliseconds: 300),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Icon(Icons.arrow_back_ios_new_outlined),
      ),
    );
  }
}
