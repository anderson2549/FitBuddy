import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:fitbuddy/menu_items/menu_items.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String name = 'init';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter + Material APP')),
      body: _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: appMenuItems.length,
      itemBuilder: (context, index) {
        final item = appMenuItems[index];
        return _CustomListTile(item: item);
      },
    );
  }
}

class _CustomListTile extends StatelessWidget {
  static const String name = 'init';

  const _CustomListTile({required this.item});

  final MenuItems item;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return ListTile(
      leading: Icon(item.icon, color: color.primary),
      trailing: Icon(Icons.arrow_forward_ios_rounded),
      title: Text(item.title),
      subtitle: Text(item.subTitle),
      onTap: () {
        context.push(item.link);
      },
    );
  }
}
