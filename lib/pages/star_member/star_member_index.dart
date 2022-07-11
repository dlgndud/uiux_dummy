import 'package:flutter/material.dart';
import 'package:uiux_dummy/pages/home_screen/widgets/my_header.dart';
import 'package:uiux_dummy/pages/home_screen/widgets/star2book_member_header.dart';

class StarMemberIndex extends StatefulWidget {
  const StarMemberIndex({Key? key}) : super(key: key);

  @override
  State<StarMemberIndex> createState() => _StarMemberIndexState();
}

class _StarMemberIndexState extends State<StarMemberIndex> {
  final controller = ScrollController();
  double offset = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener(onScroll);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  void onScroll() {
    setState(() {
      offset = (controller.hasClients) ? controller.offset : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      controller: controller,
      child: Column(
        children: [
          Star2BookMemberHeader(
            image: "assets/icons/Drcorona.svg",
            textTop: "Nice to Meet you",
            textBottom: "is stay at home.",
            offset: offset,
          ),
          //memberCard(size: size, nickname: 'day by day')
          Column(
            children: List.generate(10, (index) => memberCard(size: size, nickname: 'day by day')),
          )
        ],
      ),
    ));
  }

  Widget memberCard({required Size size, String? nickname}) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(10)),
          width: size.width,
          height: 120,
          margin: EdgeInsets.symmetric(horizontal: 10),
        ),
        Positioned(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(top:10, left:8.0),
                child: Text(nickname??'', style: TextStyle(fontSize: 16),),
              ),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              width: size.width,
              height: 40,
              margin: EdgeInsets.symmetric(horizontal: 10),
            ))
      ],
    );
  }
}
