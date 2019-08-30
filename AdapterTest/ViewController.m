//
//  ViewController.m
//  AdapterTest
//
//  Created by Yong on 2016/12/7.
//  Copyright © 2016年 Yong. All rights reserved.
//

#import "ViewController.h"
#import "PeopleModel.h"
#import "AnimalModel.h"
#import "PeopleAdapter.h"
#import "AnimalAdapter.h"
#import "AdapterTableViewCell.h"

typedef  NS_ENUM(NSInteger, DISPATCH){

    PEOPLEDATA,
    ANIMALDATA
};

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) UITableView *tableview;
@property (strong, nonatomic) NSMutableArray *peopleDatalist;
@property (strong, nonatomic) NSMutableArray *animalDatalist;
@property (assign, nonatomic) DISPATCH dataType;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    self.edgesForExtendedLayout = UIRectEdgeNone;

    CGSize screenSize = [UIScreen mainScreen].bounds.size;

    UIButton *button1 =  [[UIButton alloc]init];
    button1.frame = CGRectMake(0,0, screenSize.width/2 , 44);
    [button1 setTitle:@"人" forState:UIControlStateNormal];
    [button1 setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    button1.backgroundColor = [UIColor blueColor];
    [self.view addSubview:button1];
    [button1 addTarget:self action:@selector(peopleAction) forControlEvents:UIControlEventTouchUpInside];

    UIButton *button2 =  [[UIButton alloc]initWithFrame:CGRectMake(screenSize.width/2, 0,screenSize.width/2 , 44)];
    [button2 setTitle:@"动物" forState:UIControlStateNormal];
    [button2 setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    button2.backgroundColor = [UIColor redColor];
    [self.view addSubview:button2];
    [button2 addTarget:self action:@selector(animateAction) forControlEvents:UIControlEventTouchUpInside];

    self.tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 45, screenSize.width, screenSize.height - 44)];
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    self.tableview.tableFooterView = [UIView new];
    [self.view addSubview:self.tableview];
    self.tableview.backgroundColor = [UIColor clearColor];

    
    NSLog(@"");
}

- (NSMutableArray *)peopleDatalist{

    if (!_peopleDatalist) {
        _peopleDatalist = [[NSMutableArray alloc]init];

        for (int i = 0; i < 10; i ++) {

            PeopleModel *peopleM = [[PeopleModel alloc]init];
            peopleM.name = @"张三";
            peopleM.icon = @"sina";
            [_peopleDatalist addObject:peopleM];

        }
    }

    return _peopleDatalist;
}

- (NSMutableArray *)animalDatalist{

    if (!_animalDatalist) {
        _animalDatalist = [[NSMutableArray alloc]init];

        for (int i = 0; i < 10; i ++) {
            AnimalModel *animalM = [[AnimalModel alloc]init];
            animalM.animalType = @"老虎";
            animalM.animalImage = @"wechat";
            [_animalDatalist addObject:animalM];
        }
    }

    return _animalDatalist;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 50;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    NSInteger num = self.dataType == 0 ? self.peopleDatalist.count : self.animalDatalist.count;
    return num;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString *identifier = @"Cell";
    AdapterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];

    if (!cell) {
        cell = [[AdapterTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }

    if (self.dataType == 0) {

        PeopleModel *peopleM = self.peopleDatalist[indexPath.row];
        PeopleAdapter *peopleA = [[PeopleAdapter alloc]initWithData:peopleM];
        [cell reloadData:peopleA];

    }else{
        AnimalModel *animalM = self.animalDatalist[indexPath.row];
        AnimalAdapter *animalA = [[AnimalAdapter alloc]initWithData:animalM];
        [cell reloadData:animalA];
    }

    return cell;

}

-(void)peopleAction{

    self.dataType = PEOPLEDATA;
    [self.tableview reloadData];
}

- (void)animateAction{

    self.dataType = ANIMALDATA;
    [self.tableview reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
