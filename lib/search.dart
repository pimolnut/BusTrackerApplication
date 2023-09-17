import 'package:flutter/material.dart';
import 'package:testnewmap/track_bus.dart';
import 'package:testnewmap/track_bus2.dart';

///////////////////////////page 3/////////////////////////////////////////
/////show list location + button follow  each destination lacation//////////

class busStopModel {
  String? busStopTitle;
  String? busTracker;

  busStopModel(this.busStopTitle, this.busTracker);
}

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  static List<busStopModel> mainBusStopList = [
    busStopModel('อู่รถเมลล์ลาดกระบัง (Lat Krabang Bus Depot)', "สายรถ 111"),
    busStopModel('ตลาดหัวตะเข้ (HuaTakhe Market)', "สายรถ 111"),
    busStopModel('ซอยจินดา (Soi Chinda)', "สายรถ 111"),
    busStopModel('สวนพระนคร (Suan Phra Nakhon)', "สายรถ 111"),
    busStopModel('คณะเทคโนโลยีการเกษตร (Agri-teach Kmitl)', "สายรถ 111"),
    busStopModel(
        'ประตูทางโค้งคณะสถาปัตยกรรมศาสตร์ (Architecture Kmitl)', "สายรถ 111"),
    busStopModel('ป้ายใหญ่คณะวิศวกรรมศาสตร์ (Engineering Kmitl)', "สายรถ 111"),
    busStopModel('คณะวิทย์ (Science Kmitl)', "สายรถ 111"),
    busStopModel('คณะบริหาร (ฺBusiness Kmitl)', "สายรถ 111"),
    busStopModel('คณะเทคโนโลยี สารสนเทศ (IT Kmitl)', "สายรถ 111"),
    busStopModel('หมู่บ้านรุ่งอรุณ1 (Rung Arun Village 1)', "สายรถ 111"),
    busStopModel('หมู่บ้านรุ่งอรุณ2 (Rung Arun Village 2)', "สายรถ 111"),
    busStopModel('สง่าหมูกระทะ (Sa Nga BBQ)', "สายรถ 111"),
    busStopModel('ไอเพลส (Iplace)', "สายรถ 111"),
    busStopModel('นิคมลาดกระบัง (V condo)', "สายรถ 111"),
    busStopModel('แยกสนามบิน (Airport crossroads)', "สายรถ 777"),
    busStopModel('แยกร่มเกล้า-ลาดกระบัง (Romklao crossroads)', "สายรถ 777"),
    busStopModel(
        'สำนักงานเขตลาดกระบัง (LatKrabang District Office)', "สายรถ 777"),
    busStopModel('สน.ลาดกระบัง (Police station)', "สายรถ 777"),
    busStopModel('วัดปลูกศรัทธา(Wat Plook Sattha Wat 4)', "สายรถ 777"),
    busStopModel('แยกเจ้าคุณทหาร (Kmitl crossroads)', "สายรถ 777"),
    busStopModel('FBT', "สายรถ 777"),
    busStopModel('คณะเทคโนโลยีการเกษตร (Agri-teach Kmitl)', "สายรถ 777"),
    busStopModel(
        'ประตูทางโค้งคณะสถาปัตยกรรมศาสตร์ (Architecture Kmitl)', "สายรถ 777"),
    busStopModel('ป้ายใหญ่คณะวิศวกรรมศาสตร์ (Engineering Kmitl)', "สายรถ 777"),
    busStopModel('คณะวิทย์ (Science Kmitl)', "สายรถ 777"),
    busStopModel('คณะบริหาร (ฺBusiness Kmitl)', "สายรถ 777"),
    busStopModel('คณะเทคโนโลยี สารสนเทศ (IT Kmitl)', "สายรถ 777"),
    busStopModel('ทางออกมอเตอร์เวย์ (Motorway)', "สายรถ 777"),
    busStopModel('แอร์พอร์ตลิ้งค์ลาดกระบัง (ARL LatKrabang)', "สายรถ 777"),
  ];

  List<busStopModel> displayList = List.from(mainBusStopList);

  void updateList(String value) {
    setState(() {
      displayList = mainBusStopList
          .where((element) =>
              element.busStopTitle!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  void handleButtonAction(String? busTracker) {
    if (busTracker == "สายรถ 111") {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => BusStop2_111()));
    } else if (busTracker == "สายรถ 777") {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => BusStop()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(35, 51, 92, 0.614),
      appBar: AppBar(
        //backgroundColor: Colors.blue,
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "ค้นหาปลายทาง",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: "FCIconic",
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(191, 191, 191, 31),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(5),
                ),
              ),
              child: TextField(
                onChanged: (value) => updateList(value),
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "ระบุจุดหมายปลายทาง",
                  hintStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: "FCIconic",
                  ),
                  prefixIcon:
                      Icon(Icons.search, color: Color.fromRGBO(35, 51, 92, 1)),
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Expanded(
              child: displayList.length == 0
                  ? Center(
                      child: Text(
                        "ไม่มีผลลัพธ์ตรงกับที่ค้นหา",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: "FCIconic",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: displayList.length,
                      itemBuilder: (context, index) => Column(
                        children: [
                          ListTile(
                            contentPadding: EdgeInsets.all(8.0),
                            leading: Image.asset(
                              'assets/img/BusStop_RBG.png',
                              height: 120,
                            ),
                            title: Text(
                              displayList[index].busStopTitle!,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                fontFamily: "FCIconic",
                              ),
                            ),
                            subtitle: Text(
                              '${displayList[index].busTracker}',
                              style: TextStyle(
                                color: Colors.white60,
                                fontSize: 16,
                                fontFamily: "FCIconic",
                              ),
                            ),
                            trailing: TextButton(
                              onPressed: () {
                                handleButtonAction(
                                    displayList[index].busTracker);
                              },
                              style: TextButton.styleFrom(
                                backgroundColor:
                                    Color.fromRGBO(181, 219, 150, 1),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 14, vertical: 7),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              child: Text(
                                'ติดตาม',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "FCIconic",
                                  color: Color.fromRGBO(35, 51, 92, 1),
                                  //fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            height: 10,
                            thickness: 2,
                            color: Color.fromRGBO(191, 191, 191, 31),
                          ),
                        ],
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
