import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/common/app_assets.dart';
import 'package:movie_app/common/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:movie_app/common/App Styles.dart';

class UpdateProfileTab extends StatefulWidget {
  static const String routeName = 'update profile';

  @override
  State<UpdateProfileTab> createState() => _UpdateProfileTabState();
}

class _UpdateProfileTabState extends State<UpdateProfileTab> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  String profileImage = AppAssets.Vector1;

  final String userName = "John Safwat";
  final String userPhone = "01200000000";

  @override
  void initState() {
    super.initState();
    nameController.text = userName;
    phoneController.text = userPhone;
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColor.black,
      appBar: AppBar(
        backgroundColor: AppColor.black,
      ),
      body: Center(
          child: Padding(
        padding: EdgeInsets.only(left: width * 0.04, right: width * 0.04),
        child: Column(
          children: [
            SizedBox(
              height: height * 0.02,
            ),
            InkWell(
              child: Image.asset(profileImage,
                  width: width * 0.4, fit: BoxFit.contain),
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  backgroundColor: AppColor.black,
                  builder: (context) {
                    List<String> avatarList = [
                      AppAssets.Vector1,
                      AppAssets.Vector2,
                      AppAssets.Vector3,
                      AppAssets.Vector4,
                      AppAssets.Vector5,
                      AppAssets.Vector6,
                      AppAssets.Vector7,
                      AppAssets.Vector8,
                    ];

                    return Container(
                      padding: const EdgeInsets.all(16),
                      height: height * 0.45,
                      child: Column(
                        children: [
                          const SizedBox(height: 16),
                          Expanded(
                            child: GridView.builder(
                              itemCount: avatarList.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                mainAxisSpacing: 12,
                                crossAxisSpacing: 12,
                              ),
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      profileImage = avatarList[index];
                                    });
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                        color: Color(0xFFF6BD00),
                                        width: 2,
                                      ),
                                      color: profileImage == avatarList[index]
                                          ? Color(0x8EF6BD00)
                                          : Colors.transparent,
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Image.asset(avatarList[index]),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
            SizedBox(
              height: height * 0.05,
            ),
            TextFormField(
              controller: nameController,
              style: AppStyles.semi16White,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.person,
                  color: AppColor.white,
                ),
                hintText: "Name",
                hintStyle: AppStyles.semi16White,
                filled: true,
                fillColor: AppColor.black,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
              validator: (text) {},
            ),
            SizedBox(
              height: height * 0.02,
            ),
            TextFormField(
              controller: phoneController,
              style: AppStyles.semi16White,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.phone,
                  color: AppColor.white,
                ),
                hintText: "Phone Number",
                hintStyle: AppStyles.semi16White,
                filled: true,
                fillColor: AppColor.black,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
              validator: (text) {},
            ),
            SizedBox(
              height: height * 0.02,
            ),
            TextButton(
                onPressed: () {},
                child: Text(
                  "Reset Password",
                  style: AppStyles.semi20White,
                )),
            Spacer(),
            ElevatedButton(
                onPressed: () {
                  // Show snackbar for update
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Profile updated!')),
                  );
                },
                child: Text(
                  "Update Data",
                  style: AppStyles.semi20Black,
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.primaryColor,
                  minimumSize: Size(width, height * 0.07),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                )),
            SizedBox(
              height: height * 0.02,
            ),
            ElevatedButton(
                onPressed: () async {
                  // Show confirmation dialog for delete
                  final result = await showDialog<bool>(
                    context: context,
                    builder: (context) => AlertDialog(
                      backgroundColor: AppColor.black,
                      title: Text('Delete Account',
                          style: TextStyle(color: AppColor.red)),
                      content: Text(
                          'Are you sure you want to delete your account?',
                          style: TextStyle(color: AppColor.white)),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context, false),
                          child: Text('Cancel',
                              style: TextStyle(color: AppColor.white)),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(context, true),
                          child: Text('Delete',
                              style: TextStyle(color: AppColor.red)),
                        ),
                      ],
                    ),
                  );
                  if (result == true) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Account deleted!')),
                    );
                  }
                },
                child: Text(
                  "Delete Account",
                  style: AppStyles.semi20Black,
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.RedColor,
                  minimumSize: Size(width, height * 0.07),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                )),
            SizedBox(
              height: height * 0.02,
            ),
          ],
        ),
      )),
    );
  }
}
