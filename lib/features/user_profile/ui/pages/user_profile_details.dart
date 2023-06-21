import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/app_theme.dart';
import '../../../../core/widgets/appBar_widget.dart';
import '../../../../generated/assets.dart';
import '../../../../router/app_router.dart';
import '../../bloc/get_profile_cubit/get_profile_cubit.dart';
import '../widget/profile_circle_avater_image.dart';
import '../widget/profile_details_container.dart';

class UserProfileDetails extends StatelessWidget {
  const UserProfileDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          appBar: build_appBar(
            title: 'الملف الشخصي',context: context
          ),
          body: BlocBuilder<GetProfileCubit, GetProfileInitial>(
              builder: (context, state) {
            return ListView(children: [
              buildProfileCircleAvatarImage(imageName: Assets.assetsLl),
              SizedBox(
                height: 10,
              ),
              buildProfileDetailsContainer(
                  title: 'الاسم',
                  subTitle:
                      '${state.result.firstName} ${state.result.lastName}'),
              buildProfileDetailsContainer(
                  title: 'الهاتف', subTitle: state.result.phone),
              buildProfileDetailsContainer(
                  title: 'العنوان', subTitle: state.result.currentAddress),
              Center(
                child: InkWell(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, RouteName.changePassword);
                  },
                  child: Container(
                    child: Text(
                      'هل تريد تعديل كلمة المرور؟',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey),
                    ),
                    margin: EdgeInsets.all(20),
                  ),
                ),
              )
            ]);
          })),
    );
  }
}
