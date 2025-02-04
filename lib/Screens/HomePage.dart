import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons_nullsafty/flutter_icons_nullsafty.dart';
import 'package:home_rental/Models/Datamodel/PlaceModel.dart';
import 'package:home_rental/Models/ViewModel/BestOffer.dart';
import 'package:home_rental/Models/ViewModel/RecentAddedHome.dart';
import 'package:home_rental/Models/constants.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20),
                _buildHeader(),
                SizedBox(height: 50),
                _buildSearchAndFilter(),
                SizedBox(height: 50),
                _buildReacentlyAdd(),
                SizedBox(height: 50),
                _buildBestOfferSection(),
                SizedBox(height: 60),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildIconContainer(Icons.grid_view),
          _buildProfilePicture(),
        ],
      ),
    );
  }

  Widget _buildIconContainer(IconData icon) {
    return Container(
      height: 55,
      width: 55,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            blurRadius: 15,
            // ignore: deprecated_member_use
            color: Colors.black.withOpacity(0.3),
            offset: Offset(5, 5),
          ),
        ],
      ),
      child: Icon(icon, color: kCustomBlackColor),
    );
  }

  Widget _buildProfilePicture() {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 15,
            // ignore: deprecated_member_use
            color: Colors.black.withOpacity(0.4),
            offset: Offset(-5, 10),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: Image(
          fit: BoxFit.fill,
          width: 55,
          image: AssetImage('asset/images/face.jpg'),
        ),
      ),
    );
  }

  Widget _buildSearchAndFilter() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 15,
                    // ignore: deprecated_member_use
                    color: Colors.black.withOpacity(0.3),
                    offset: Offset(5, 5),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Colors.grey[800]),
                    hintText: "Home",
                    fillColor: Color(0xffF3F4F8),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 8), // Add space between the search and filter buttons
          Container(
            height: 65,
            width: 65,
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  blurRadius: 15,
                  // ignore: deprecated_member_use
                  color: Colors.black.withOpacity(0.4),
                  offset: Offset(-5, 10),
                ),
              ],
            ),
            child: Icon(
              Icons.menu,
              color: Colors.grey[300],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReacentlyAdd() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Recently Added",
                  style: Theme.of(context).textTheme.headlineSmall),
              Text("See all", style: TextStyle(color: Colors.black54)),
            ],
          ),
        ),
        SizedBox(height: 30),
        Container(
          height: 350,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              RecentAdded(placeModel: placeCollection[0]),
              RecentAdded(placeModel: placeCollection[1]),
              RecentAdded(placeModel: placeCollection[2]),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBestOfferSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Today's Best Offer ✨",
                  style: Theme.of(context).textTheme.headlineSmall),
              Text("See all", style: TextStyle()),
            ],
          ),
        ),
        SizedBox(height: 90),
        Container(
          height: 300, // Adjust this height as needed
          child: BestOffer(placeModel: placeCollection[2]),
        ),
      ],
    );
  }
}
