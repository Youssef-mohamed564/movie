import 'package:flutter/material.dart';
import 'package:movie_app/common/app_assets.dart';
import 'package:movie_app/common/app_colors.dart';
import 'package:movie_app/screens/home_screen/tabs/profile/update_profile_tab.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    // Simulate a selected profile image (replace with provider/user logic as needed)
    final String profileImage = AppAssets.Vector1;
    return Scaffold(
      backgroundColor: AppColor.black,
      body: Padding(
        padding: EdgeInsets.all(width * 0.06),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: height * 0.04),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Avatar and name
                Column(
                  children: [
                    CircleAvatar(
                      radius: 36,
                      backgroundColor: AppColor.yellow,
                      child: ClipOval(
                        child: Image.asset(profileImage,
                            width: 72, height: 72, fit: BoxFit.cover),
                      ),
                    ),
                    SizedBox(height: 4),
                    Text('John Safwat',
                        style: TextStyle(
                            color: AppColor.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
                SizedBox(width: 32),
                // Wish List and History
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('12',
                              style: TextStyle(
                                  color: AppColor.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold)),
                          Text('Wish List',
                              style: TextStyle(
                                  color: AppColor.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500)),
                        ],
                      ),
                      SizedBox(width: 32),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('10',
                              style: TextStyle(
                                  color: AppColor.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold)),
                          Text('History',
                              style: TextStyle(
                                  color: AppColor.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UpdateProfileTab()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.yellow,
                      foregroundColor: AppColor.black,
                      minimumSize: Size(0, 45),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text('Edit Profile',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600)),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Add your exit logic here
                    },
                    icon: Icon(Icons.exit_to_app, color: AppColor.white),
                    label: Text('Exit',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColor.white)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.red,
                      minimumSize: Size(0, 45),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            TabBar(
              controller: _tabController,
              indicatorColor: AppColor.yellow,
              indicatorWeight: 3,
              labelColor: AppColor.yellow,
              unselectedLabelColor: AppColor.white,
              tabs: [
                Tab(
                  icon: Icon(Icons.list, color: AppColor.yellow),
                  text: 'Watch List',
                ),
                Tab(
                  icon: Icon(Icons.folder, color: AppColor.yellow),
                  text: 'History',
                ),
              ],
            ),
            SizedBox(height: 8),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  Center(
                    child: Image.asset(
                      AppAssets.empty,
                      width: width * 0.4,
                    ),
                  ),
                  Center(
                    child: Image.asset(
                      AppAssets.empty,
                      width: width * 0.4,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
