import 'package:flutter/material.dart';
import 'package:flutter_news_app/api/api_manger.dart';
import 'package:flutter_news_app/category/category_details_view_model.dart';
import 'package:flutter_news_app/model/categoryDM.dart';
import 'package:flutter_news_app/tabs/tab_container.dart';
import 'package:provider/provider.dart';

import '../model/sourceResponse.dart';

class CategoryDetails extends StatefulWidget {
  static const String routeName = 'CategoryDetails';
  CategoryDM category;
  CategoryDetails({required this.category});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  CategoryDetailsViewModel viewModel = CategoryDetailsViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getSourceByCategoryId(widget.category.id);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<CategoryDetailsViewModel>(
          builder: (context, viewModel, child) {
        if (viewModel.errorMessage != null) {
          return Column(
            children: [
              Text(
                viewModel.errorMessage!,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              ElevatedButton(
                  onPressed: () {
                    viewModel.getSourceByCategoryId(widget.category.id);
                  },
                  child: Text(
                    'Try again',
                    style: Theme.of(context).textTheme.titleMedium,
                  ))
            ],
          );
        } else if (viewModel.sourceList == null) {
          return Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            ),
          );
        } else {
          return TabContainer(sourceList: viewModel.sourceList!);
        }
      }),
    );

    //   FutureBuilder<SourceResponse>(
    //     future: ApiManger.getSources(widget.category.id),
    //     builder: (context,snapshot){
    //       if(snapshot.connectionState == ConnectionState.waiting){
    //         return Center(
    //           child: CircularProgressIndicator(
    //             color: Theme.of(context).primaryColor,
    //           ),
    //         );
    //       }else if(snapshot.hasError){
    //         return Center(
    //           child: Column(
    //             children: [
    //               Text('Something went Wrong !', style: Theme.of(context).textTheme.titleMedium,),
    //               ElevatedButton(
    //                   onPressed: (){
    //                     ApiManger.getSources(widget.category.id);
    //                     setState(() {
    //
    //                     });
    //                   },
    //                   child: Text('Try Again', style: Theme.of(context).textTheme.titleSmall,)
    //               ),
    //             ],
    //           ),
    //         );
    //       }
    //       if(snapshot.data?.status != 'ok'){
    //         return Column(
    //           children: [
    //             Text(snapshot.data?.message ?? 'Something went wrong !', style: Theme.of(context).textTheme.titleMedium,),
    //             ElevatedButton(
    //                 onPressed: (){
    //                   ApiManger.getSources(widget.category.id);
    //                   setState(() {
    //
    //                   });
    //                 },
    //                 child: Text('Try Again', style: Theme.of(context).textTheme.titleSmall,)
    //             ),
    //           ],
    //         );
    //       }
    //       var sourceList = snapshot.data?.sources ?? [];
    //       return TabContainer(sourceList: sourceList);
    //     }
    // );
  }
}
