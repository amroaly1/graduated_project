import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduate_project/core/dependency_injection/di.dart';
import 'package:graduate_project/features/bridge/data/repo/get_all_bridge_chat_repo.dart';
import 'package:graduate_project/features/bridge/manager/cubit/bridge_cubit.dart';
import 'package:graduate_project/features/bridge/presentation/widget/bridge_chat_body_view.dart';

class BridgeChatView extends StatelessWidget {
  const BridgeChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BridgeCubit(di<GetAllBridgeChatRepo>())..init(),
      child: const Scaffold(
        body: BridgeChatBodyView(),
      ),
    );
  }
}
