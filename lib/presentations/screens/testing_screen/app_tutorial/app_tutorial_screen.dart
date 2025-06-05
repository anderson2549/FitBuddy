import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppTutorialScreen extends StatefulWidget {
  static const name = 'app_tutorial_screen';

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final PageController _pageController = PageController();

  bool isLastPage = false;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      final page = _pageController.page ?? 0;
      if (!isLastPage && page >= slide.length - 1.5) {
        debugPrint("flutter: Ultima pagina");
        setState(() {
          isLastPage = true;
        });
      }
      /*
      final page = _pageController.page ?? 0;
      final index = page.round();
      final last = index == slide.length - 1;
      if (isLastPage != last) {
        if (last) debugPrint("flutter: Ultima pagina");
        setState(() {
          isLastPage = last;
        });
      }*/
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            physics: const BouncingScrollPhysics(),
            children:
                slide
                    .map(
                      (slideInfo) => _Slide(
                        title: slideInfo.title,
                        caption: slideInfo.caption,
                        imagePath: slideInfo.imagePath,
                      ),
                    )
                    .toList(),
          ),
          Positioned(
            left: 20,
            bottom: 50,
            child: TextButton(
              onPressed: () {
                context.pop();
              },
              child: const Text("Saltar"),
            ),
          ),
          isLastPage
              ? Positioned(
                right: 20,
                bottom: 50,
                child: FadeInRight(
                  duration: const Duration(milliseconds: 500),
                  child: FilledButton(
                    onPressed: () {
                      context.pop();
                    },
                    child: const Text("Finalizar"),
                  ),
                ),
              )
              : Container(),
        ],
      ),
    );
  }
}

final slide = <SlideInfo>[
  SlideInfo(
    "Busca la comida",
    "lorem ipsum dolor sit amet, consectetur adipiscing elit.",
    "assets/images/1.png",
  ),
  SlideInfo(
    "Entrega rapida",
    "lorem ipsum dolor sit amet, consectetur adipiscing elit.",
    "assets/images/2.png",
  ),
  SlideInfo(
    "Disfruta de la comida",
    "lorem ipsum dolor sit amet, consectetur adipiscing elit.",
    "assets/images/3.png",
  ),
];

class SlideInfo {
  final String title;
  final String caption;
  final String imagePath;

  SlideInfo(this.title, this.caption, this.imagePath);
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imagePath;

  const _Slide({
    super.key,
    required this.title,
    required this.caption,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage(imagePath)),
            const SizedBox(height: 20),
            Text(title, style: titleStyle),
            const SizedBox(height: 10),
            Text(caption, textAlign: TextAlign.center, style: captionStyle),
          ],
        ),
      ),
    );
  }
}
