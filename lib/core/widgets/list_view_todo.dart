
import 'package:day_eight_test/core/constants/app_colors.dart';
import 'package:day_eight_test/features/todos/logic/todo_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:day_eight_test/core/widgets/listview_item.dart';
class ListViewTodo extends StatelessWidget {


  const ListViewTodo({super.key });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: context.read<TodoCubit>().todos.length,
        itemBuilder: (context,index) => ListViewItem( index: index,)
    );
  }
}
