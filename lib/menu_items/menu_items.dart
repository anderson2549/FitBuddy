import 'package:flutter/material.dart';

class MenuItems {
  final String titleKey;
  final String subTitleKey;
  final String link;
  final IconData icon;

  MenuItems({
    required this.titleKey,
    required this.subTitleKey,
    required this.link,
    required this.icon,
  });
}

List<MenuItems> appMenuItems = <MenuItems>[
  MenuItems(
    titleKey: "menu_buttons_title",
    subTitleKey: "menu_buttons_subtitle",
    link: "/buttons",
    icon: Icons.smart_button_outlined,
  ),
  MenuItems(
    titleKey: "menu_cards_title",
    subTitleKey: "menu_cards_subtitle",
    link: "/cards",
    icon: Icons.credit_card,
  ),
  MenuItems(
    titleKey: "menu_progress_title",
    subTitleKey: "menu_progress_subtitle",
    link: "/progress",
    icon: Icons.refresh_rounded,
  ),
  MenuItems(
    titleKey: "menu_snackbars_title",
    subTitleKey: "menu_snackbars_subtitle",
    link: "/snackbars",
    icon: Icons.info_outline,
  ),
  MenuItems(
    titleKey: "menu_animations_title",
    subTitleKey: "menu_animations_subtitle",
    link: "/animation",
    icon: Icons.animation,
  ),
  MenuItems(
    titleKey: "menu_uicontrols_title",
    subTitleKey: "menu_uicontrols_subtitle",
    link: "/uicontrols",
    icon: Icons.construction_sharp,
  ),
  MenuItems(
    titleKey: "menu_tutorial_title",
    subTitleKey: "menu_tutorial_subtitle",
    link: "/tutorial",
    icon: Icons.book_online_outlined,
  ),
  MenuItems(
    titleKey: "menu_scroll_title",
    subTitleKey: "menu_scroll_subtitle",
    link: "/scroll",
    icon: Icons.insert_link_outlined,
  ),
  MenuItems(
    titleKey: "menu_controltheme_title",
    subTitleKey: "menu_controltheme_subtitle",
    link: "/controltheme",
    icon: Icons.dark_mode_outlined,
  ),
  MenuItems(
    titleKey: "Registro",
    subTitleKey: "Registro",
    link: "/register",
    icon: Icons.dark_mode_outlined,
  ),
];
