//
//  MessageFirstVC.m
//  MoveHome
//
//  Created by jalin on 15/7/1.
//  Copyright (c) 2015年 shuziqirui. All rights reserved.
//

#import "MessageFirstVC.h"
#import "IWTabBar.h"
#import "MessageMECell.h"
#import "MJExtension.h"
#import "Message.h"
#import "ChatMessageVC.h"
@interface MessageFirstVC ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITextField *searchText;
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property(nonatomic,strong) NSMutableArray *dataList;
@property(nonatomic,strong) NSMutableArray *messages;

@end

@implementation MessageFirstVC

-(NSArray *)dataList{
    if (!_dataList) {
        self.dataList=[Message objectArrayWithFilename:@"Messages.plist"];
        NSLog(@"%@",self.dataList);
    }
    return _dataList;
}


- (void)viewDidLoad {
    [super viewDidLoad];
     self.title=@"消息";
    [self setUpMiddle];
 
    self.messages=self.dataList;

}
-(void)setUpMiddle{
    
    NSArray *constA=[self constrants:self.middleView tableview:self.tableview textview:self.searchText margin:0];
    [self.view addConstraints:constA];
    
}
-(NSArray *)constrants:(UIView *)supview tableview:(UITableView *)tablview textview:(UITextField *)text  margin:(int)margin{
      NSString *mar=[NSString stringWithFormat:@"%d",margin];
    NSDictionary *views=NSDictionaryOfVariableBindings(supview,tablview,text);
    NSDictionary *metrics=@{@"margin":mar,@"textheight":@20,@"blueheight":@30} ;
  
    tablview.translatesAutoresizingMaskIntoConstraints=NO;
    text.translatesAutoresizingMaskIntoConstraints=NO;
    
    [supview addSubview:tablview];
    [supview addSubview:text];
    NSArray *constA=[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-margin-[tablview]-margin-|" options:0 metrics: metrics views:views];
      NSArray *constA2=[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-textheight-[text]-textheight-|" options:0 metrics: metrics views:views];
    NSArray *constA3=[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-textheight-[text(==blueheight)]-margin-[tablview]-margin-|" options:0 metrics:metrics  views:views];
    NSArray *constE=[constA arrayByAddingObjectsFromArray:constA2];
     NSArray *constE2=[constE arrayByAddingObjectsFromArray:constA3];
    return constE2;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.messages.count;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{


    return 70;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    //1.定义一个标时
    static NSString *ID=@"cell";
    //2.去缓存池中去去取一个可循环利用的cell
    MessageMECell *cell =[tableView dequeueReusableCellWithIdentifier:ID];
    //3.如果缓存中没有可循环利用的cell
    if(cell == nil){
       cell = [[[NSBundle mainBundle] loadNibNamed:@"MessageMECell" owner:self options:nil] lastObject];
    }
    cell.message=self.messages[indexPath.item];
   
    return cell;


}

//只要实现此方法支持删除
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle==UITableViewCellEditingStyleDelete) {
        NSLog(@"删除");
    
        [self.messages removeObjectAtIndex:indexPath.row];
        [self.tableview reloadData];
       //[self.tableview reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft ];
    }


}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
NSLog(@"%ld.....",(long)indexPath.row);
    ChatMessageVC *chat=[[ChatMessageVC alloc]init];
    Message *m=self.dataList[indexPath.item] ;
    chat.title=m.titleP;
    [self.navigationController pushViewController:chat animated:NO];
    

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

@end
