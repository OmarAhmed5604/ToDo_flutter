import 'package:day_eight_test/core/constants/app_colors.dart';
import 'package:day_eight_test/features/todos/logic/todo_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class AddTask extends StatelessWidget {
  final controller = TextEditingController();
   AddTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),

      child: Container(
        padding: EdgeInsets.symmetric(vertical: 25.h,horizontal: 25.w ),
        width: double.infinity.w,
        height: 400.h,
        decoration: BoxDecoration(
          color: AppColors.backGroundColor ,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(25) , topRight: Radius.circular(25) )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton( onPressed: (){ Navigator.pop(context) ; }, icon: Icon(Icons.close , color: Colors.white,) ),
                Text("Add Task" , style: TextStyle(fontSize: 20.sp  , fontWeight: FontWeight.bold , color: Colors.white),),
              ],
            ),
            SizedBox(height: 30.h,),
            TextField(
              style: TextStyle(color: AppColors.smallTextColor),
              controller: controller,
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.primaryColor ,
                hintText: ("Enter New Task") ,
                hintStyle: TextStyle(color: AppColors.smallTextColor),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.r)
                ),
                focusedBorder: OutlineInputBorder()
              )
            ),
            SizedBox(height: 20.h,),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
                color: AppColors.primaryColor,
              ),
              child: TextButton(
                onPressed: (){
                  context.read<TodoCubit>().addTodo(controller.text);
                  Navigator.pop(context);
                },
                child: Text("Save" , style: TextStyle(color: AppColors.smallTextColor ),),
              ),
            )
          ],
        ),
      ),
    );
  }
}
