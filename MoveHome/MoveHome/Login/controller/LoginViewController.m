//
//  LoginViewController.m
//  LeanMessageDemo
//
//  Created by lzw on 15/5/13.
//  Copyright (c) 2015年 leancloud. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()<AVIMClientDelegate>

@property (weak, nonatomic) IBOutlet UITextField *selfIdTextField;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"LeanMessageDemo";
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    NSString *selfId = [userDefaults objectForKey:kLoginSelfIdKey];
    
    if (selfId) {
        [self openClientWithClientId:selfId completion: ^(BOOL succeeded, NSError *error) {
            if (!error) {
                [self performSegueWithIdentifier:@"toMain" sender:self];
                
            }
        }];
    }
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onLoginButtonClicked:(id)sender {
    NSString *selfId = self.selfIdTextField.text;
    if (selfId.length > 0) {
        [self openClientWithClientId : selfId completion : ^(BOOL succeeded, NSError *error) {
            if (!error) {
                [[NSUserDefaults standardUserDefaults] setObject:selfId forKey:kLoginSelfIdKey];
                [[NSUserDefaults standardUserDefaults] synchronize];
                [self performSegueWithIdentifier:@"toMain" sender:self];
            }
        }];
    }
}

/**
[""] *	@brief	每个用户开启一个AVIMClient实例，客户端需要缓存这一实例，如果要支持同一个客户端内多账号登录，则需要为每个账号缓存一个 AVIMClient 实例。
[""] *
[""] *	@param 	clientId 	操作发起人的 id，以后使用该账户的所有聊天行为，都由此人发起。
[""] *	@param 	completion 	回调
[""] *
[""] *	@return
[""] */
- (void)openClientWithClientId:(NSString *)clientId completion:(AVBooleanResultBlock)completion {
    AVIMClient *imClient = [AVIMClient defaultClient];
    //普通对话
    if (imClient.status == AVIMClientStatusNone) {
        [imClient openWithClientId:clientId callback:completion];
    }
    else {
        //聊天室对话
        [imClient closeWithCallback: ^(BOOL succeeded, NSError *error) {
            [imClient openWithClientId:clientId callback:completion];
        }];
    }
}

@end
