// import 'package:final_project1/core/network/network_info.dart';
// import 'package:final_project1/features/casese_details/data/dataSources/casese_details_remote_data_source.dart';
// import 'package:final_project1/features/casese_details/data/repositories/casese_details_repository_impl.dart';
// import 'package:flutter/material.dart';
// import 'package:internet_connection_checker/internet_connection_checker.dart';
//
// import '../../domain/usecases/get_all_casese_details.dart';
//
// class SaedTest extends StatelessWidget {
//   const SaedTest({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       child: const Placeholder(),
//       onTap: () async {
//         final result = await GetAllCaseseDetailsUsecase(
//                 repository: Casese_detailsRepositoryImpl(
//                     networkInfo: NetworkInfoImpl(
//                         connectionChecker: InternetConnectionChecker()),
//                     remoteDataSource: Casese_detailsRemoteDataSourceImpl(),
//                     localDataSource: null))
//             .call();
//       },
//     );
//   }
// }
