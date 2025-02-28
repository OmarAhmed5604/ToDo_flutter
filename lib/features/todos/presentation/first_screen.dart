import 'package:day_eight_test/core/constants/app_colors.dart';
import 'package:day_eight_test/core/widgets/add_task.dart';
import 'package:day_eight_test/core/widgets/list_view_todo.dart';
import 'package:day_eight_test/features/todos/logic/todo_cubit.dart';
import 'package:elegant_notification/elegant_notification.dart';
import 'package:elegant_notification/resources/arrays.dart';
import 'package:elegant_notification/resources/stacked_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';




class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => TodoCubit(),
  child: BlocConsumer<TodoCubit, TodoState>(
  listener: (context, state) {
    if (state is TodoAdd){
      ElegantNotification.success(
        width: 360.w,
        isDismissable: false,
        animationCurve: Curves.bounceOut,
        stackedOptions: StackedOptions(
          key: 'top',
          type: StackedType.same,
          itemOffset: Offset(-5, -5),
        ),
        position: Alignment.topCenter,
        animation: AnimationType.fromTop,
        title: Text('Task Added'),
        description: Text('Your Todo has been Added'),
        onDismiss: () {},
        onNotificationPressed: () {},
      ).show(context);
    }
    if (state is TodoEdit){
    ElegantNotification.success(
    width: 360.w,
    isDismissable: false,
    animationCurve: Curves.bounceOut,
    stackedOptions: StackedOptions(
    key: 'top',
    type: StackedType.same,
    itemOffset: Offset(-5, -5),
    ),
    position: Alignment.topCenter,
    animation: AnimationType.fromTop,
    title: Text('Task Edited'),
    description: Text('Your Todo has been Edited'),
    onDismiss: () {},
    onNotificationPressed: () {},
    ).show(context);
    }
    if (state is TodoDelete){
      ElegantNotification.error(
        width: 360.w,
        stackedOptions: StackedOptions(
          key: 'topRight',
          type: StackedType.same,
          itemOffset: Offset(-5, -5),
        ),
        position: Alignment.topRight,
        animation: AnimationType.fromRight,
        title: Text('Task Deleted'),
        description: Text('Your Todo has been reduced'),
        onDismiss: () {},
      ).show(context);
    }
  },
  builder: (context, state) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor ,
      appBar: AppBar(
        backgroundColor: AppColors.backGroundColor,
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.list) ,color: Colors.white),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search) , color: Colors.white,),
          IconButton(onPressed: (){}, icon: Icon(Icons.notifications_outlined) ,color: Colors.white),
        ],
      ),
      body:  SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(vertical: 25.h , horizontal: 25.w ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Hi Omar ! ", style: TextStyle(fontSize: 30.sp  , fontWeight: FontWeight.bold , color: Colors.white),),
              SizedBox(height: 40.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Today's Tasks" , style: TextStyle(color: AppColors.smallTextColor , fontSize: 15.sp )),
                  Text("${ context.read<TodoCubit>().todos.length } Tasks" , style: TextStyle(color: AppColors.smallTextColor , fontSize: 15.sp))
                ],
              ),
              ListViewTodo(),

            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showModalBottomSheet(context: context,
              isScrollControlled: true,
              builder :(btContext){
            return BlocProvider.value(
              value: BlocProvider.of<TodoCubit>(context),
              child: AddTask(),
            );
          });
        },
        elevation: 10,
        shape: CircleBorder(),
        backgroundColor: Colors.pink,
        child: Icon(Icons.add),

      ) ,
    );
  },
),
);
  }
}
