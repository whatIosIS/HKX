//
//  HKXMineShoppingGoodsDetailViewController.m
//  HuiKuaiXiuPro
//
//  Created by 李金灿 on 2017/8/24.
//  Copyright © 2017年 Lee. All rights reserved.
//

#import "HKXMineShoppingGoodsDetailViewController.h"
#import "CommonMethod.h"

#import "HKXMinePayViewController.h"//支付界面
#import "HKXMineReceiveAddressViewController.h"//增加新地址界面

@interface HKXMineShoppingGoodsDetailViewController ()<UITableViewDelegate , UITableViewDataSource>
{
    UITableView * _detailTableView;//订单详情
    UIView      * _totalPriceView;//下单部分
}

@end

@implementation HKXMineShoppingGoodsDetailViewController
#pragma mark - LifeCycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self createUI];
}
#pragma mark - CreateUI
- (void)createUI
{
    AppDelegate * myDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    self.view.backgroundColor = [UIColor whiteColor];
    
    _detailTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0 , ScreenWidth, ScreenHeight  - 50 * myDelegate.autoSizeScaleY) style:UITableViewStylePlain ];
    _detailTableView.backgroundColor = [UIColor whiteColor];
    _detailTableView.delegate = self;
    _detailTableView.dataSource = self;
    _detailTableView.scrollEnabled = NO;
    [self.view addSubview:_detailTableView];
    [_detailTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    
    _totalPriceView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_detailTableView.frame) + 1 * myDelegate.autoSizeScaleY, ScreenWidth, 49 * myDelegate.autoSizeScaleY)];
    _totalPriceView.layer.borderColor = [UIColor colorWithRed:235 / 255.0 green:235 / 255.0 blue:235 / 255.0 alpha:1].CGColor;
    _totalPriceView.layer.borderWidth = 1;
    _totalPriceView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_totalPriceView];

    NSString * totalPrice = [NSString stringWithFormat:@"实付款：¥%.1f",1220.0];
    UILabel * totalPriceLabel = [[UILabel alloc] initWithFrame:CGRectMake(120 * myDelegate.autoSizeScaleX, 17 * myDelegate.autoSizeScaleY, [CommonMethod getLabelLengthWithString:totalPrice WithFont:15 * myDelegate.autoSizeScaleX], 15 * myDelegate.autoSizeScaleX)];
    totalPriceLabel.textColor = [CommonMethod getUsualColorWithString:@"#333333"];
    totalPriceLabel.text = totalPrice;
    totalPriceLabel.font = [UIFont systemFontOfSize:15 * myDelegate.autoSizeScaleX];
    [_totalPriceView addSubview:totalPriceLabel];
    
    UIButton * submitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    submitBtn.frame = CGRectMake(280 * myDelegate.autoSizeScaleX, 0, ScreenWidth - 280 * myDelegate.autoSizeScaleX, 49 * myDelegate.autoSizeScaleY);
    submitBtn.backgroundColor = [CommonMethod getUsualColorWithString:@"#ffa304"];
    [submitBtn setTitle:@"立即下单" forState:UIControlStateNormal];
    [submitBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [submitBtn addTarget:self action:@selector(submitBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [_totalPriceView addSubview:submitBtn];
}
#pragma mark - ConfigData
#pragma mark - Action
- (void)submitBtnClick:(UIButton *)btn
{
    NSLog(@"下单");
    HKXMinePayViewController * payVC = [[HKXMinePayViewController alloc] init];
    payVC.payCount = @"1200";
    payVC.navigationItem.title = @"支付方式";
    [self.navigationController pushViewController:payVC animated:YES];
}
#pragma mark - Private Method
#pragma mark - Delegate & Data Source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AppDelegate * myDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    if (indexPath.row == 0)
    {
        return 88 * myDelegate.autoSizeScaleY;
    }
    else if (indexPath.row == 1)
    {
        return 129 * myDelegate.autoSizeScaleY;
    }
    else
    {
        return 40 * myDelegate.autoSizeScaleY;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AppDelegate * myDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    static NSString * cellIdentifier = @"cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    UILabel * reLab1 = [cell viewWithTag:50000];
    [reLab1 removeFromSuperview];
    UILabel * reLab2 = [cell viewWithTag:50001];
    [reLab2 removeFromSuperview];
    UILabel * reLab3 = [cell viewWithTag:50002];
    [reLab3 removeFromSuperview];
    UILabel * reLab4 = [cell viewWithTag:50003];
    [reLab4 removeFromSuperview];
    UILabel * reLab5 = [cell viewWithTag:50004];
    [reLab5 removeFromSuperview];
    UIImageView * reImg = [cell viewWithTag:50005];
    [reImg removeFromSuperview];
    
    
    UILabel * label1 = [[UILabel alloc] init];
    label1.tag = 50000;
    [cell addSubview:label1];
    UILabel * label2 = [[UILabel alloc] init];
    label2.tag = 50001;
    [cell addSubview:label2];
    UILabel * label3 = [[UILabel alloc] init];
    label3.tag = 50003;
    [cell addSubview:label3];
    UILabel * label4 = [[UILabel alloc] init];
    label4.tag = 50004;
    [cell addSubview:label4];
    
    if (indexPath.row == 0)
    {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        label1.frame = CGRectMake(30 * myDelegate.autoSizeScaleX, 21 * myDelegate.autoSizeScaleY, 300 * myDelegate.autoSizeScaleX, 16 * myDelegate.autoSizeScaleX);
        label1.text = @"万三 12345678912";
        label1.font = [UIFont systemFontOfSize:16 * myDelegate.autoSizeScaleX];
        
        label2.frame = CGRectMake(30 * myDelegate.autoSizeScaleX, CGRectGetMaxY(label1.frame) + 25 * myDelegate.autoSizeScaleY, 300 * myDelegate.autoSizeScaleX, 16 * myDelegate.autoSizeScaleX);
        label2.text = @"北京市海淀区大钟寺9号楼京仪大厦2层";
        label2.font = [UIFont systemFontOfSize:16 * myDelegate.autoSizeScaleX];
    }
    else if (indexPath.row == 1)
    {
        UIImageView * goodsImg = [[UIImageView alloc] initWithFrame:CGRectMake(30 * myDelegate.autoSizeScaleX, 16 * myDelegate.autoSizeScaleY, 102 * myDelegate.autoSizeScaleX, 95 * myDelegate.autoSizeScaleY)];
        goodsImg.tag = 50005;
        goodsImg.image = [UIImage imageNamed:@"滑动视图示例"];
        [cell addSubview:goodsImg];
        
        label1.frame = CGRectMake(CGRectGetMaxX(goodsImg.frame) + 18 * myDelegate.autoSizeScaleX, 10 * myDelegate.autoSizeScaleY, [CommonMethod getLabelLengthWithString:@"哈威V30D140液压泵哈威" WithFont:16 * myDelegate.autoSizeScaleX ], 40 * myDelegate.autoSizeScaleY);
        label1.numberOfLines = 2;
        label1.text = @"哈威V30D140液压泵哈威V30D140液压泵";
        label1.font = [UIFont systemFontOfSize:16 * myDelegate.autoSizeScaleX];
        
        label2.frame = CGRectMake(CGRectGetMaxX(goodsImg.frame) + 18 * myDelegate.autoSizeScaleX, CGRectGetMaxY(label1.frame) + 9 * myDelegate.autoSizeScaleY, [CommonMethod getLabelLengthWithString:@"哈威V30D140液压泵哈威" WithFont:16 * myDelegate.autoSizeScaleX ], 14 * myDelegate.autoSizeScaleX);
        label2.text = @"产品型号：XXXXXXX";
        label2.textColor = [CommonMethod getUsualColorWithString:@"#666666"];
        label2.font = [UIFont systemFontOfSize:14 * myDelegate.autoSizeScaleX];
        
        label3.frame = CGRectMake(CGRectGetMaxX(goodsImg.frame) + 18 * myDelegate.autoSizeScaleX, CGRectGetMaxY(label2.frame) + 13 * myDelegate.autoSizeScaleY, 110 * myDelegate.autoSizeScaleX, 15 * myDelegate.autoSizeScaleX);
        label3.textColor = [UIColor redColor];
        label3.text = [NSString stringWithFormat:@"¥%.2f",1200.00];
        label3.font = [UIFont systemFontOfSize:15 * myDelegate.autoSizeScaleX];
        
        
        label4.frame = CGRectMake(CGRectGetMaxX(goodsImg.frame) + 175 * myDelegate.autoSizeScaleX, CGRectGetMaxY(label2.frame) + 13 * myDelegate.autoSizeScaleY, [CommonMethod getLabelLengthWithString:@"数量：2" WithFont:12 * myDelegate.autoSizeScaleX], 12 * myDelegate.autoSizeScaleX);
        label4.text = @"数量：2";
        label4.textColor = [CommonMethod getUsualColorWithString:@"#666666"];
        label4.font = [UIFont systemFontOfSize:12 * myDelegate.autoSizeScaleX];
    }
    else
    {
        label1.frame = CGRectMake(30 * myDelegate.autoSizeScaleX, 0, [CommonMethod getLabelLengthWithString:@"支付方式" WithFont:16 * myDelegate.autoSizeScaleX ], 40 * myDelegate.autoSizeScaleY);
        label1.font = [UIFont systemFontOfSize:16 * myDelegate.autoSizeScaleX];
        label2.frame = CGRectMake(294 * myDelegate.autoSizeScaleX, 0, ScreenWidth - 294 * myDelegate.autoSizeScaleX, 40 * myDelegate.autoSizeScaleY);
        label2.font = [UIFont systemFontOfSize:14 * myDelegate.autoSizeScaleX];
        
        if (indexPath.row == 2)
        {
            label1.text = @"支付方式";
            label2.text = @"在线支付";
        }
        else if (indexPath.row == 3)
        {
            label1.text = @"商品金额";
            label2.text = @"¥1200.0";
        }
        else
        {
            label1.text = @"运费";
            label2.text = @"包邮";
        }
    }
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        HKXMineReceiveAddressViewController * addNewAddressVC = [[HKXMineReceiveAddressViewController alloc] init];
        addNewAddressVC.navigationItem.title = @"收货地址";
        [self.navigationController pushViewController:addNewAddressVC animated:YES];
    }
}
#pragma mark - Setters & Getters

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
