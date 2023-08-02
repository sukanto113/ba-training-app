import 'package:flutter/material.dart';

class SliverAppBarDemo1 extends StatelessWidget {
  const SliverAppBarDemo1({super.key});

  @override
  Widget build(BuildContext context) {
    const boxTopOffset = 50.0;
    const boxBottomOffset = 120.0;
    // const boxBottomOffset = 50.0;
    const boxHeight = boxTopOffset + boxBottomOffset;
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFFF2F2F2),
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                elevation: 0,
                // backgroundColor: Colors.white,
                backgroundColor: Color(0xFFF2F2F2),
                flexibleSpace: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Positioned(
                      // top: -10,
                      child: Container(
                        margin: EdgeInsets.only(bottom: 20),
                        decoration: BoxDecoration(
                          color: Color(0xFFFFFFFF),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        height: boxHeight,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: boxBottomOffset),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            final height = constraints.maxHeight;
                            double radius = 25;
                            double padding = 0;
                            if (height < 250) {
                              radius = 100 / height * 150;
                              padding = 50;
                            }
                            return Padding(
                              padding: EdgeInsets.only(
                                top: padding,
                              ),
                              child: AspectRatio(
                                aspectRatio: 1,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(radius),
                                  child: Image.network(
                                    'https://www.jewishvirtuallibrary.org/jsource/images/People/Joe_Biden1.jpg',
                                    fit: BoxFit.cover,
                                    // height: 50,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                expandedHeight:
                    MediaQuery.of(context).size.width + boxBottomOffset,
                pinned: true,
                collapsedHeight: 100 + boxHeight,
                // collapsedHeight: 400,
                // toolbarHeight: 50,
              ),
              // SliverToBoxAdapter(
              //   child: SizedBox(
              //     height: 20,
              //   ),
              // ),
              // SliverCon
              // SliverToBoxAdapter(
              //   child: Container(
              //     height: MediaQuery.of(context).size.height -
              //         100 -
              //         boxHeight -
              //         20 -
              //         MediaQuery.of(context).padding.bottom -
              //         MediaQuery.of(context).padding.top,
              //     decoration: BoxDecoration(
              //       color: const Color(0xFFFFFFFF),
              //       borderRadius: BorderRadius.circular(25),
              //     ),
              //     child: Column(
              //       children: [
              //         Text("01973376465"),
              //         // Expanded(child: SliverList.builder(itemBuilder: itemBuilder)

              //         // )
              //         Expanded(
              //           child: ListView.builder(
              //             itemBuilder: (context, index) {
              //               return ListTile(
              //                 title: Text("number $index"),
              //               );
              //             },
              //           ),
              //         )
              //       ],
              //     ),
              //   ),
              // )

              // SliverPersistentHeader(delegate: SliverPersistentHeaderDelegate())
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return ListTile(
                      title: Text("item $index"),
                    );
                  },
                  childCount: 30,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
