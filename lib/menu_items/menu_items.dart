import 'package:flutter/material.dart';

class MenuItems {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  MenuItems({
    required this.title,
    required this.subTitle,
    required this.link,
    required this.icon,
  });
}

List<MenuItems> appMenuItems = <MenuItems>[
  MenuItems(
    title: "Botones",
    subTitle: "Varios botones en flutter",
    link: "/buttons",
    icon: Icons.smart_button_outlined,
  ),
  MenuItems(
    title: "Tarjetas",
    subTitle: "Un contenedor estilizado",
    link: "/cards",
    icon: Icons.credit_card,
  ),
  MenuItems(
    title: "Progress indicators",
    subTitle: "Un contenedor estilizado",
    link: "/progress",
    icon: Icons.refresh_rounded,
  ),
  MenuItems(
    title: "Snackbars y dialogos",
    subTitle: "snackbars",
    link: "/snackbars",
    icon: Icons.info_outline,
  ),
  MenuItems(
    title: "Animations",
    subTitle: "Animacion",
    link: "/animation",
    icon: Icons.animation,
  ),
  MenuItems(
    title: "Ui controls",
    subTitle: "Controles",
    link: "/uicontrols",
    icon: Icons.construction_sharp,
  ),
  MenuItems(
    title: "Tutorial",
    subTitle: "Tutorial pequeño",
    link: "/tutorial",
    icon: Icons.book_online_outlined,
  ),
  MenuItems(
    title: "Screen template atomic",
    subTitle: "Import Screen",
    link: "/homescreen",
    icon: Icons.home_filled,
  ),
];
