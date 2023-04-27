import 'dart:io';

import 'package:flutter/material.dart';
import 'package:myapp/screen/add_new_group.dart';

import 'models/fake.dart';
import 'models/customer_group.dart';

void main(List<String> args) {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;
  DataFake dataFake = DataFake();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      body: CustomScrollView(
        slivers: [
          _appBar(),
          SliverPadding(
            padding: const EdgeInsets.only(left: 30, top: 30, right: 30),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                <Widget>[
                  ...dataFake.grps.map(
                    (e) => _groupItem(e),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddNewGroup(dataFake: dataFake),
              ));

          setState(() {});
        },
        backgroundColor: const Color(0xff5D6BB8),
        child: const Icon(
          Icons.add,
          size: 40,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color(0xff1890FF),
        unselectedItemColor: const Color(0xff7E7D8A),
        type: BottomNavigationBarType.fixed,
        iconSize: 30,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.checklist),
            label: 'Công việc',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.trending_up),
            label: 'Báo cáo',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.supervisor_account),
            label: 'Khách hàng',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Thông báo',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Tài khoản',
          ),
        ],
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }

  Container _groupItem(CustomerGroup? group) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.black),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 22),
              child: group!.imgPicture.isEmpty
                  ? const Icon(
                      Icons.account_circle,
                      color: Color(0xff5D6BB8),
                      size: 50,
                    )
                  : Center(
                      child: CircleAvatar(
                        // child: Text(group.imgPicture),
                        backgroundColor: Colors.amber,
                        backgroundImage: FileImage(File(group.imgPicture)),
                        radius: 20,
                      ),
                    ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.only(left: 13.5),
              child: Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _groupName(group.name),
                    // ListView(
                    //   children: [Text('123'), Text('123')],
                    // ),
                    _tagName(group.tags),
                    _totalMember(group.customers.length),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Text _totalMember(int total) {
    return Text(
      '$total thành viên',
      style: const TextStyle(
        color: Color(0xff8A8C8E),
        fontSize: 13,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Row _tagName(List<String> tags) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Wrap(
          spacing: 8,
          children: [
            ...tags.map(
              (e) => Chip(
                label: Text(
                  e,
                  style:
                      const TextStyle(color: Color(0xff4051B4), fontSize: 12),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  Text _groupName(String name) {
    return Text(
      name,
      style: const TextStyle(
        color: Color(0xff102B4B),
        fontSize: 15,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  SliverAppBar _appBar() {
    return SliverAppBar(
      expandedHeight: 182,
      collapsedHeight: 130,
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      centerTitle: true,
      flexibleSpace: Container(
        height: 282,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(43.0),
            bottomRight: Radius.circular(43.0),
          ),
          color: Color(0xff5D6BB8),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Khách hàng',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      margin: const EdgeInsets.only(left: 28, right: 5),
                      height: 40,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: const TextField(
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.search),
                          hintStyle: TextStyle(
                            color: Color(0xff9D9EA0),
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                          hintText: 'Tìm kiếm nhóm khách hàng',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                      width: 70,
                      height: 70,
                      child: Padding(
                        padding: EdgeInsets.only(left: 8, right: 8),
                        child: Icon(
                          Icons.filter_alt,
                          size: 40,
                          color: Colors.white,
                        ),
                      )),
                ],
              )
            ],
          ),
        ),
      ),
      // bottom: PreferredSize(
      //   preferredSize: const Size.fromHeight(0.0),
      //   child: Transform.translate(
      //     offset: const Offset(0, 50),
      //     child: Container(
      //       color: Colors.blue,
      //       padding: const EdgeInsets.only(
      //         top: 19,
      //         bottom: 19,
      //         left: 50,
      //         right: 50,
      //       ),
      //       margin: const EdgeInsets.only(
      //         left: 19,
      //         right: 19,
      //         bottom: 19,
      //         top: 19,
      //       ),
      //       child: SizedBox(
      //         child: Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceAround,
      //           children: const [
      //             Text('123a'),
      //             Text('123b'),
      //             Text('123c'),
      //           ],
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
