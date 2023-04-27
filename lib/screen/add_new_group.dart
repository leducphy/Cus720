import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myapp/models/customer.dart';
import 'package:myapp/models/customer_group.dart';
import 'package:myapp/models/fake.dart';
import 'package:myapp/widget/add_customer.dart';
import 'package:myapp/widget/tags.dart';

class AddNewGroup extends StatefulWidget {
  DataFake dataFake;

  AddNewGroup({required this.dataFake, super.key});

  @override
  State<AddNewGroup> createState() => _AddNewGroupState();
}

class _AddNewGroupState extends State<AddNewGroup> {
  final List<String> _tags = [];
  CustomerGroup? newGroup;

  final _groupNameController = TextEditingController();
  final _descriptionController = TextEditingController();

  XFile? _image;

  Future getImage(bool isCamera) async {
    final ImagePicker picker = ImagePicker();
    XFile? imagex;
    if (isCamera) {
      imagex = await picker.pickImage(source: ImageSource.gallery);
    } else {
      imagex = await picker.pickImage(source: ImageSource.camera);
    }
    setState(() {
      _image = XFile(imagex!.path);
    });
    // print(_image!.path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      body: CustomScrollView(
        slivers: [
          _appBar(context),
          SliverPadding(
            padding: const EdgeInsets.only(left: 30, top: 30, right: 30),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                <Widget>[
                  Center(
                    child: InkWell(
                      child: Stack(
                        // fit: StackFit.expand,
                        // clipBehavior: Clip.none,
                        children: [
                          SizedBox(
                            width: 130,
                            height: 130,
                            child: _image != null
                                ? CircleAvatar(
                                    backgroundColor: Colors.amber,
                                    backgroundImage:
                                        FileImage(File(_image!.path)),
                                    radius: 33,
                                  )
                                : const CircleAvatar(
                                    child: Icon(
                                      Icons.account_circle,
                                      size: 130,
                                    ),
                                  ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: const BoxDecoration(
                                color: Color(0xff5D6BB8),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(32)),
                              ),
                              child: const Icon(
                                Icons.camera_alt_outlined,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      onTap: () => showMenu(
                        context: context,
                        position: const RelativeRect.fromLTRB(56, 350, 55, 55),
                        shape: const RoundedRectangleBorder(
                          side: BorderSide.none,
                        ),
                        items: [
                          const PopupMenuItem(
                            value: 1,
                            child: Center(
                              child: Text(
                                'Chọn ảnh từ thư viện',
                              ),
                            ),
                          ),
                          const PopupMenuItem(
                            value: 2,
                            child: Center(
                              child: Text(
                                'Chụp ảnh',
                              ),
                            ),
                          ),
                        ],
                        elevation: 8.0,
                      ).then((value) {
                        if (value != null) {
                          switch (value) {
                            case 1:
                              getImage(true);
                              break;
                            case 2:
                              getImage(false);
                              break;
                          }
                        }
                      }),
                    ),
                  ),
                  _padding1('Tên nhóm'),
                  TextField(
                    controller: _groupNameController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xffE7EDF9),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none),
                    ),
                  ),
                  _padding1('Mô tả'),
                  TextField(
                    controller: _descriptionController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xffE7EDF9),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none),
                    ),
                    maxLines: 5,
                  ),
                  TagsWidget(
                      xtags: _tags,
                      onSelected: (value) {
                        setState(() {
                          if (!_tags.contains(value)) _tags.add(value);
                        });
                      }),
                  _padding1('Thêm khách hàng'),
                  const AddCustomers(),
                  const Padding(padding: EdgeInsets.all(200)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Padding _padding1(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 9),
      child: Text(
        text,
        style: const TextStyle(
          color: Color(0xff202E7A),
          fontSize: 16,
        ),
      ),
    );
  }

  SliverAppBar _appBar(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 102,
      collapsedHeight: 130,
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      centerTitle: true,
      flexibleSpace: Container(
        height: 132,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
          ),
          color: Color(0xff5D6BB8),
        ),
      ),
      leading: Padding(
        padding: const EdgeInsets.only(
          top: 20,
        ),
        child: TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
          ),
          child: const Text(
            'Hủy',
            style: TextStyle(fontSize: 19),
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(top: 20, right: 10),
          child: TextButton(
            onPressed: () {
              setState(() {
                List<Customer> customers = [
                  Customer(
                    id: '1',
                    name: 'John Doe',
                    phone: '+1-555-1234',
                    imgPicture: 'https://example.com/john-doe.jpg',
                  ),
                  Customer(
                    id: '2',
                    name: 'Jane Smith',
                    phone: '+1-555-5678',
                    imgPicture: 'https://example.com/jane-smith.jpg',
                  ),
                  Customer(
                    id: '3',
                    name: 'Jane Smith',
                    phone: '+1-555-5678',
                    imgPicture: 'https://example.com/jane-smith.jpg',
                  ),
                  Customer(
                    id: '4',
                    name: 'Jane Smith',
                    phone: '+1-555-5678',
                    imgPicture: 'https://example.com/jane-smith.jpg',
                  ),
                  // add more customers here
                ];
                CustomerGroup newG = CustomerGroup(
                  id: String.fromCharCodes(Iterable.generate(
                      5,
                      (_) => 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'.codeUnitAt(
                          Random.secure().nextInt(
                              'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'.length)))),
                  name: _groupNameController.text,
                  description: _descriptionController.text,
                  imgPicture: _image!.path,
                  tags: _tags,
                  customers: [
                    customers[0],
                    customers[1],
                    customers[2],
                    customers[3]
                  ],
                );
                print(newG);
                widget.dataFake.grps.add(newG);
              });
              Navigator.pop(context);
            },
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            child: const Text(
              'Lưu',
              style: TextStyle(fontSize: 19),
            ),
          ),
        ),
      ],
      // centerTitle: true,
      title: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Title(
            color: Colors.white,
            child: const Text(
              'Thêm nhóm mới',
              style: TextStyle(fontSize: 20),
            )),
      ),
    );
  }
}

class SearchWidget extends StatefulWidget {
  const SearchWidget({super.key});

  @override
  State<SearchWidget> createState() => SearchWidgetState();
}

class SearchWidgetState extends State<SearchWidget> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(
        color: Color.fromARGB(255, 0, 0, 0),
        fontWeight: FontWeight.w500,
        fontSize: 16,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xffE7EDF9),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none),
        prefixIcon: const Icon(Icons.search),
        hintStyle: const TextStyle(
          color: Color(0xff9D9EA0),
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
        hintText: 'Tìm kiếm khách hàng',
      ),
    );
  }
}

class PopUpMe extends StatelessWidget {
  const PopUpMe({super.key, required this.menuList, this.icon});

  final Widget? icon;

  final List<PopupMenuEntry> menuList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 50),
      child: PopupMenuButton(
        itemBuilder: (context) => menuList,
        icon: icon,
      ),
    );
  }
}
