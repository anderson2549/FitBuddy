import 'package:fitbuddy/app_localizations.localizations_access.g.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:fitbuddy/menu_items/menu_items.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String name = 'init';

  @override
  Widget build(BuildContext context) {
    // LocalizationAccessGenerator

    return Scaffold(
      //appBar: AppBar(title: TextLang('menu_animations_title')),
      body: _HomeView(),
    );
  }
}

class TextTranslation extends StatelessWidget {
  final String? data;
  final Key? key;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;

  const TextTranslation(
    this.data, {
    this.key,
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      TextLang(context).getByKey('data') ?? '',
      key: key,
      style: style,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
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
  const _CustomListTile({required this.item});

  final MenuItems item;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return ListTile(
      leading: Icon(item.icon, color: color.primary),
      trailing: Icon(Icons.arrow_forward_ios_rounded),
      title: TextTranslation(item.titleKey),
      subtitle: TextTranslation(item.subTitleKey),
      onTap: () {
        context.push(item.link);
      },
    );
  }
}
