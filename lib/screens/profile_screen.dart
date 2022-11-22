import 'package:flutter/material.dart';
import 'package:jemputah_app/constants/color.dart';
import 'package:jemputah_app/constants/icons.dart';
import 'package:jemputah_app/constants/image.dart';

class ProfilScreen extends StatefulWidget {
  const ProfilScreen({Key? key}) : super(key: key);

  @override
  State<ProfilScreen> createState() => _ProfilScreenState();
}

class _ProfileCard extends StatelessWidget {
  final String name;
  final Widget icon;

  const _ProfileCard(this.name, this.icon);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.only(
        //top: 12,
        bottom: 12,
        left: 24,
        right: 10,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColors.separatorLine,
            width: 2,
          ),
        ),
      ),
      child: ListTile(
        leading: Padding(
          padding: const EdgeInsets.only(
            bottom: 5,
          ),
          child: icon,
        ),
        title: Padding(
          padding: const EdgeInsets.only(
            bottom: 5,
          ),
          child: Text(
            name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.black,
              fontSize: 12,
            ),
          ),
        ),
        trailing: Padding(
          padding: const EdgeInsets.only(
            bottom: 5,
          ),
          child: Icon(
            Icons.navigate_next,
            size: 20,
            color: AppColors.black,
          ),
        ),
        onTap: null,
      ),
    );
  }
}

class _ProfilScreenState extends State<ProfilScreen> {
  var username = "Adit Dudung";
  var phoneNum = "+628123456789";
  var email = "aditdudung88@gmail.com";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundGreen,
      appBar: AppBar(
        title: const Text(
          "Profil",
        ),
        backgroundColor: AppColors.mainGreen,
      ),
      body: ListView(
        children: [
          Container(
            height: 90,
            padding: const EdgeInsets.symmetric(
              //vertical: 10,
              horizontal: 15,
            ),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: AppColors.separatorLine,
                  width: 2,
                ),
              ),
            ),
            child: ListTile(
              leading: Container(
                padding: const EdgeInsets.only(
                  bottom: 5,
                ),
                width: 53,
                height: 53,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      profilePicture,
                    ),
                  ),
                ),
              ),
              title: Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  bottom: 5,
                ),
                child: Text(
                  username,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                    fontSize: 18,
                  ),
                ),
              ),
              subtitle: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    phoneNum,
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    email,
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              trailing: Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                ),
                child: Icon(
                  Icons.edit,
                  size: 24,
                  color: AppColors.black,
                ),
              ),
            ),
          ),
          _ProfileCard(
            "Daftar Alamat",
            Icon(
              Icons.location_on,
              size: 30,
              color: AppColors.black,
            ),
          ),
          _ProfileCard(
            "Kontak Kami",
            Image.asset(
              iconTelpon,
              width: 30,
              height: 30,
            ),
          ),
          _ProfileCard(
            "Ubah Password",
            Icon(
              Icons.lock,
              size: 30,
              color: AppColors.black,
            ),
          ),
          _ProfileCard(
              "Keluar",
              Icon(
                Icons.exit_to_app,
                size: 30,
                color: AppColors.black,
              ))
        ],
      ),
    );
  }
}
