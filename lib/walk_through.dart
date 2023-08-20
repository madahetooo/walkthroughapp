import 'package:flutter/material.dart';

class WalkThrough extends StatefulWidget {
  const WalkThrough({super.key});

  @override
  State<WalkThrough> createState() => _WalkThroughState();
}

class _WalkThroughState extends State<WalkThrough> {
  late PageController _pageController;
  int _pageIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<OnWalkThrough> walkThroughData = [
      OnWalkThrough(
        image: "assets/walkthroughone.png",
        title: "Learn",
        description: "Get Montored by experienced photographers",
      ),
      OnWalkThrough(
        image: "assets/walkthroughtwo.png",
        title: "Practice",
        description:
            "Practice in photo walks and contests happening in your city",
      ),
      OnWalkThrough(
        image: "assets/walkthroughthree.png",
        title: "Share",
        description: "Share your photographes in the community",
      ),
    ];

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          actions: const [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Skip",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            )
          ],
        ),
        body: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Expanded(
                    child: PageView.builder(
                        itemCount: walkThroughData.length,
                        controller: _pageController,
                        onPageChanged: (index) {
                          setState(() {
                            _pageIndex = index;
                          });
                        },
                        itemBuilder: (context, index) => WalkThroughContent(
                            pageIndex: index,
                            walkThroughData: walkThroughData)))
              ],
            ),
          ),
        ));
  }
}

class OnWalkThrough {
  final String image, title, description;

  OnWalkThrough({
    required this.image,
    required this.title,
    required this.description,
  });
}

class WalkThroughContent extends StatelessWidget {
  const WalkThroughContent({
    super.key,
    required this.pageIndex,
    required this.walkThroughData,
  });

  final int pageIndex;
  final List<OnWalkThrough> walkThroughData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 14,
        ),
        SizedBox(
          width: double.infinity,
          height: 250,
          child: Image.asset(walkThroughData[pageIndex].image),
        ),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(
                walkThroughData.length,
                (index) => Padding(
                      padding: const EdgeInsets.only(right: 6),
                      child: DotIndicator(
                        isActive: index == pageIndex,
                      ),
                    ))
          ],
        ),
        const Spacer(),
        Text(
          walkThroughData[pageIndex].title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Colors.black,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          walkThroughData[pageIndex].description,
          style: TextStyle(
            fontSize: 15,
            color: Colors.black,
          ),
        ),
        Spacer(),
        pageIndex == 2
            ? Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                    decoration: BoxDecoration(color: Colors.yellow),
                    child: MaterialButton(
                      onPressed: () {},
                      child: Text("Done"),
                    )),
              )
            : Container(),
        Spacer(),

      ],
    );
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({super.key, this.isActive = false});

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return isActive
        ? Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.yellow,
            ),
          )
        : Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey,
            ),
          );
  }
}
