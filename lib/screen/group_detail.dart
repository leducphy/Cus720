import 'dart:io';

import 'package:flutter/material.dart';
import 'package:myapp/models/customer_group.dart';

class GroupDetail extends StatefulWidget {
  final CustomerGroup groups;
  const GroupDetail({super.key, required this.groups});

  @override
  State<GroupDetail> createState() => _GroupDetailState();
}

class _GroupDetailState extends State<GroupDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250,
            collapsedHeight: 250,
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            centerTitle: true,
            flexibleSpace: Container(
              alignment: Alignment.bottomCenter,
              // height: 310,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
                color: Color(0xff5D6BB8),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 80),
                child: Column(
                  children: [
                    widget.groups.imgPicture.isEmpty
                        ? const Icon(
                            Icons.account_circle,
                            size: 90,
                            color: Colors.white,
                          )
                        : Center(
                            child: CircleAvatar(
                              // child: Text(group.imgPicture),
                              backgroundColor: Colors.amber,
                              backgroundImage:
                                  FileImage(File(widget.groups.imgPicture)),
                              radius: 45,
                            ),
                          ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        widget.groups.name,
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        widget.groups.description,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(top: 20, right: 10),
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Sửa',
                    style: TextStyle(
                      fontSize: 19,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                <Widget>[
                  Container(
                    width: double.infinity,
                    height: 40,
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Color(0xffF0F5FF), width: 5),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: RichText(
                        text: TextSpan(
                            text: 'Danh sách nhóm',
                            style: const TextStyle(
                              color: Color(0xff4051B4),
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                            children: [
                              TextSpan(
                                text:
                                    ' (${widget.groups.customers.length} thành viên) ',
                                style: const TextStyle(
                                  color: Color(0xff8D92A9),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            ]),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      ...widget.groups.customers.map(
                        (e) => Container(
                          width: double.infinity,
                          height: 65,
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color: Color(0xffBDBFCB)),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Expanded(
                                flex: 1,
                                child: Icon(
                                  Icons.account_circle,
                                  color: Color(0xff5D6BB8),
                                  size: 50,
                                ),
                              ),
                              Expanded(
                                flex: 5,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      e.name,
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xff102B4B)),
                                    ),
                                    Text(
                                      e.phone,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
