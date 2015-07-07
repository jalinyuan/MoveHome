//
//  AddressListFirstVC.m
//  MoveHome
//
//  Created by jalin on 15/7/1.
//  Copyright (c) 2015年 shuziqirui. All rights reserved.
//

#import "AddressListFirstVC.h"
#import "IWTabBar.h"
#import "QRadioButton.h"
#import "FriendGroup.h"
#import "Friend.h"
#import "HeadView.h"
#import "ChatMessageVC.h"
#define CGcolorblue CGColorCreate(colorSpace,(CGFloat[]){ 85/255.0, 162/255.0, 1, 1 })
@interface AddressListFirstVC ()<UITableViewDataSource,UITableViewDelegate,HeadViewDelegate>{

    NSArray *_friendsData;
}
@property (strong, nonatomic)  UITextField *searchA;
@property (strong, nonatomic)  QRadioButton *deptA;
@property (strong, nonatomic)  QRadioButton *commonA;
@property (strong, nonatomic)  QRadioButton *colleagueA;
@property (strong, nonatomic)  UITableView *tableview;

@end


@implementation AddressListFirstVC
-(QRadioButton *)deptA{
    if (!_deptA) {
        _deptA=[[QRadioButton alloc]initWithDelegate:self groupId:@"addressList"];
    }
    [_deptA setTitle:@"部门" forState:UIControlStateNormal];
    [_deptA addTarget:self action:@selector(clickDept) forControlEvents:UIControlEventTouchUpInside];
    _deptA.checked=YES;
    //_deptA.layer.cornerRadius=4.f;

    
    return [self setAtrribute:_deptA];
}
-(QRadioButton *)commonA{
    if (!_commonA) {
        _commonA=[[QRadioButton alloc]initWithDelegate:self groupId:@"addressList"];
    }
    [_commonA setTitle:@"常用" forState:UIControlStateNormal];
    [_commonA addTarget:self action:@selector(clickDept) forControlEvents:UIControlEventTouchUpInside];
       _commonA.layer.cornerRadius=4.f;

    return [self setAtrribute:_commonA];
}
-(QRadioButton *)colleagueA{
    if (!_colleagueA) {
        _colleagueA=[[QRadioButton alloc]initWithDelegate:self groupId:@"addressList"];
    }
    [_colleagueA setTitle:@"同事" forState:UIControlStateNormal];
    [_colleagueA addTarget:self action:@selector(clickDept) forControlEvents:UIControlEventTouchUpInside];
    _colleagueA.layer.cornerRadius=4.f;

    return [self setAtrribute:_colleagueA];
}



-(QRadioButton *)setAtrribute:(QRadioButton *)button{
    [button setImage:[UIImage imageNamed:@"bg_1"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"bg_2"]  forState:UIControlStateSelected];
    [button setBackgroundImage:[UIImage imageNamed:@"tabbar_background_os7"] forState:UIControlStateSelected];
    //[_colleagueA setBackgroundImage:[UIImage imageNamed:@"tabbar_background"] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
     button.titleEdgeInsets = UIEdgeInsetsMake(5, 0, 5, 0);
   // button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;//设置button的内容横向居中。。设置content是
    [button setContentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter];
   // button.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
    [button setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
    
    [button.layer setBorderWidth:1.0];   //边框宽度
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGColorRef colorref = CGcolorblue;
    [button.layer setBorderColor:colorref];//边框颜色
    return button;
}
-(UITableView *)tableview{
    if (!_tableview) {
        _tableview=[[UITableView alloc]init];
    }
    _tableview.dataSource=self;
    _tableview.delegate=self;
    return _tableview;
}
-(UITextField *)searchA{
    if (!_searchA) {
        _searchA=[[UITextField alloc]init];
    }
    _searchA.placeholder=@"搜索联系人";
    _searchA.borderStyle=UITextBorderStyleRoundedRect;
    _searchA.backgroundColor=[UIColor grayColor];
    return _searchA;
}
-(void)clickDept{
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
     self.tableview.sectionHeaderHeight = 40;
    
     self.title=@"通讯录";
    
    self.deptA.selected=YES;
  [self loadData];
     [self setUpMiddle];
    
    

}
-(void)setUpMiddle{
    
    NSArray  *constA=[self constrants:self.middleView tableview:self.tableview search:self.searchA buttonA:self.colleagueA buttonB:self.deptA buttonC:self.commonA];
    [self.view addConstraints:constA];
    
}

- (void)loadData
{
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"friends.plist" withExtension:nil];
    NSArray *tempArray = [NSArray arrayWithContentsOfURL:url];
    
    NSMutableArray *fgArray = [NSMutableArray array];
    for (NSDictionary *dict in tempArray) {
        FriendGroup *friendGroup = [FriendGroup friendGroupWithDict:dict];
        [fgArray addObject:friendGroup];
    }
    
    _friendsData = fgArray;
}

- (NSArray*)constrants:(UIView*)supereview tableview:(UITableView*)tableview search:(UITextField*)search buttonA:(QRadioButton*)buttonA buttonB:(QRadioButton*)buttonB buttonC:(QRadioButton*)buttonC
{
    [supereview addSubview:tableview];
    [supereview addSubview:search];
    [supereview addSubview:buttonA];
    [supereview addSubview:buttonB];
    [supereview addSubview:buttonC];

    tableview.translatesAutoresizingMaskIntoConstraints = NO;
    search.translatesAutoresizingMaskIntoConstraints = NO;
    buttonA.translatesAutoresizingMaskIntoConstraints = NO;
    buttonB.translatesAutoresizingMaskIntoConstraints = NO;
    buttonC.translatesAutoresizingMaskIntoConstraints = NO;

    NSDictionary* views = NSDictionaryOfVariableBindings(tableview, search, buttonA, buttonB, buttonC);
    NSDictionary* metrics = @{ @"Textmargin" : @25,
       @"buttonmargin"  : @30,
        @"margin" : @0,
        @"buttonwidth" : @100 ,
        @"textheight":@40,
                               @"buttonheight":@35
                               ,
                               @"marginb":@-2};

    NSArray* constA = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-Textmargin-[search]-Textmargin-|" options:0 metrics:metrics views:views];
    NSArray* constA2 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-buttonmargin-[buttonA]-marginb-[buttonB(==buttonA)]-marginb-[buttonC(==buttonB)]-buttonmargin-|" options:NSLayoutFormatAlignAllBottom | NSLayoutFormatAlignAllTop metrics:metrics views:views];
    NSArray* constA3 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-margin-[tableview]-margin-|" options:0 metrics:metrics views:views];
    NSArray* constA4 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-Textmargin-[search(==textheight)]-Textmargin-[buttonA(==buttonheight)]-Textmargin-[tableview]-margin-|" options:0 metrics:metrics views:views];
  
    NSArray* constE = [constA arrayByAddingObjectsFromArray:constA2];
    NSArray* constE2 = [constE arrayByAddingObjectsFromArray:constA3];
    NSArray* constE3 = [constE2 arrayByAddingObjectsFromArray:constA4];

    return constE3;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    FriendGroup *friendGroup = _friendsData[section];
    
    NSInteger count = friendGroup.isOpened ? friendGroup.friends.count : 0;
    NSLog(@"%ld",(long)count);
    return count;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return _friendsData.count;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString *cellIdentifier = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    FriendGroup *friendGroup = _friendsData[indexPath.section];
    Friend *friend = friendGroup.friends[indexPath.row];
    
    cell.imageView.image = [UIImage imageNamed:friend.icon];
    cell.textLabel.textColor = friend.isVip ? [UIColor redColor] : [UIColor blackColor];
    cell.textLabel.text = friend.name;
    NSLog(@"%@",friend.name);
    cell.detailTextLabel.text = friend.intro;
    
    
    return cell;
}
//-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  
    //}
//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
   // HeadView *headView = [HeadView headViewWithTableView:tableView];
    
   // headView.delegate = self;
   // headView.friendGroup = _friendsData[section];
    
   // return headView;
//}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ChatMessageVC *viewController = [[ChatMessageVC alloc] init];
    [self.navigationController pushViewController:viewController animated:YES];
}

- (void)clickHeadView
{
    [self.tableview reloadData];
}
@end
