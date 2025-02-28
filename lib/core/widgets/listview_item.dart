import 'package:day_eight_test/core/constants/app_colors.dart';
import 'package:day_eight_test/core/widgets/edit_task.dart';
import 'package:day_eight_test/features/todos/logic/todo_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:day_eight_test/features/todos/data/task_data.dart';

class ListViewItem extends StatelessWidget {
  final int index;

  const ListViewItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: AppColors.primaryColor,
      ),
      child: Row(
        children: [
          IconButton(
              onPressed: () {
                context.read<TodoCubit>().changeCheckState(index);
              },
              icon: Icon(
                context.read<TodoCubit>().todos[index].isChecked ? Icons.check_circle : Icons.circle_outlined ,
                color: AppColors.iconColor,
              )),
          Text(
            context.read<TodoCubit>().todos[index].taskTitle,
            style: TextStyle(color: Colors.white ,
            fontSize: 15.sp,
            decoration: context.read<TodoCubit>().todos[index].isChecked ? TextDecoration.lineThrough : TextDecoration.none ,
            decorationColor: Colors.pink,
            decorationThickness: 5),
          ),
          Spacer(),
          IconButton(
            onPressed: (){
              showModalBottomSheet(context: context,
                  isScrollControlled: true,
                  builder :(btContext){
                    return BlocProvider.value(
                      value: BlocProvider.of<TodoCubit>(context),
                      child: EditTask(),
                    );
                  });
            },
            icon: Icon(Icons.edit , color: Colors.pink,),
          ),
          IconButton(
            onPressed: () {
              context.read<TodoCubit>().deleteTask(index);
            },
            icon: Icon(Icons.delete , color: Colors.pink,),
          ),

        ],
      ),
    );
  }
}
