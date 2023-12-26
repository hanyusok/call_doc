import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

class TabHome extends StatefulWidget {
  const TabHome({super.key});

  @override
  State<TabHome> createState() => _TabHomeState();
}

class SpecialityModel {
  String? imgAssetPath;
  String? speciality;
  int? noOfDoctors;
  Color? backgroundColor;
  SpecialityModel(
      {this.imgAssetPath,
      this.speciality,
      this.noOfDoctors,
      this.backgroundColor});
}

class _TabHomeState extends State<TabHome> {
  List<String> categories = ['마트의원', '비대면신청', '알림', '설정'];
  // List<SpecialityModel> specialities;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 10,
              ),
              Text(
                "Find your nearby \nClinics",
                style: TextStyle(
                    color: Colors.black87.withOpacity(0.8),
                    fontSize: 30,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(14)),
                child: const Row(children: <Widget>[
                  Icon(Icons.search),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Search",
                    style: TextStyle(color: Colors.grey, fontSize: 19),
                  )
                ]),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Categories",
                style: TextStyle(
                    color: Colors.black87.withOpacity(0.8),
                    fontSize: 27,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 30,
                child: ListView.builder(
                  itemCount: categories.length,
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return CategorieTile(
                      categorie: categories[index],
                      isSelected: selectedCategorie == categories[index],
                      context: this,
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 250,
                // child: ListView.builder(
                //     itemCount: specialities.length,
                //     shrinkWrap: true,
                //     physics: const ClampingScrollPhysics(),
                //     scrollDirection: Axis.horizontal,
                //     itemBuilder: (context, index) {
                //       return SpecialistTile(
                //         imgAssetPath: specialities[index].imgAssetPath,
                //         speciality: specialities[index].speciality,
                //         noOfDoctors: specialities[index].noOfDoctors,
                //         backColor: specialities[index].backgroundColor,
                //       );
                //     }),
              ),
              Text(
                "Doctors",
                style: TextStyle(
                    color: Colors.black87.withOpacity(0.8),
                    fontSize: 25,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 20,
              ),
              const DoctorsTile(),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DoctorsTile extends StatelessWidget {
  const DoctorsTile({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
            color: Colors.yellow, borderRadius: BorderRadius.circular(20)),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
        child: Row(children: <Widget>[
          Image.asset("assets/images/doctor_pic.png"),
          const SizedBox(
            width: 17,
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "한유석 원장",
                style: TextStyle(color: Colors.grey, fontSize: 19),
              ),
              SizedBox(
                height: 2,
              ),
              Text(
                "전문의",
                style: TextStyle(fontSize: 15),
              ),
            ],
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 9),
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(13)),
            child: const Text(
              "Call",
              style: TextStyle(
                  color: Colors.white24,
                  fontSize: 13,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ]),
      ),
    );
  }
}

String? selectedCategorie = "Adults";

class CategorieTile extends StatefulWidget {
  final String? categorie;
  final bool? isSelected;
  final State<TabHome>? context;
  const CategorieTile(
      {super.key, this.categorie, this.isSelected, this.context});

  @override
  CategorieTileState createState() => CategorieTileState();
}

class CategorieTileState extends State<CategorieTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.context!.setState(() {
          selectedCategorie = widget.categorie;
        });
      },
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        margin: const EdgeInsets.only(left: 8),
        height: 30,
        decoration: BoxDecoration(
            color: widget.isSelected! ? const Color(0xffFFD0AA) : Colors.white,
            borderRadius: BorderRadius.circular(30)),
        child: Text(
          widget.categorie!,
          style: TextStyle(
              color: widget.isSelected!
                  ? const Color(0xffFC9535)
                  : const Color(0xffA1A1A1)),
        ),
      ),
    );
  }
}

class SpecialistTile extends StatelessWidget {
  final String? imgAssetPath;
  final String? speciality;
  final int? noOfDoctors;
  final Color? backColor;
  const SpecialistTile(
      {super.key,
      required this.imgAssetPath,
      required this.speciality,
      required this.noOfDoctors,
      required this.backColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
          color: backColor, borderRadius: BorderRadius.circular(24)),
      padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            speciality!,
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
          const SizedBox(
            height: 6,
          ),
          Text(
            "$noOfDoctors Doctors",
            style: const TextStyle(color: Colors.white, fontSize: 13),
          ),
          Image.asset(
            imgAssetPath!,
            height: 160,
            fit: BoxFit.fitHeight,
          )
        ],
      ),
    );
  }
}
