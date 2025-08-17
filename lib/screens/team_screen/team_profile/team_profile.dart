import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/app_images.dart';
import '../../../widgets/text_widget.dart';


class TeamProfileView extends StatelessWidget {
  const TeamProfileView({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        leading: IconButton(onPressed: (){Get.offNamed('/MainBNav');}, icon: Icon(Icons.arrow_back, color: Colors.white,)),
        backgroundColor: Colors.blueGrey,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage(AppImages.pic1),
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    regularText(
                      title:  'Loading...',
                      textSize: 20,
                      textColor: Colors.black,
                    ),
                    regularText(
                      title:'Loading...',
                      textSize: 16,
                      textColor: Colors.grey,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(thickness: 2, color: Colors.black),

          ListView.builder(
            itemCount: 4,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadiusGeometry.circular(10),
                    border: BoxBorder.all(color: Colors.blueGrey),
                    color: Colors.grey.shade100
                ),
                child: ListTile(
                  title: Text('Mia khalif'),
                  subtitle: Text('Mia khalif'),
                ),
              );
            },)

        ],
      ),
    );
  }
}
