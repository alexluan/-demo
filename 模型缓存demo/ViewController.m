//
//  ViewController.m
//  模型缓存demo
//
//  Created by 栾有数 on 15/9/24.
//  Copyright (c) 2015年 栾有数. All rights reserved.
//

#import "ViewController.h"
#import <Foundation/Foundation.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSString *rootDir = NSHomeDirectory();
    NSString *path = [rootDir stringByAppendingPathComponent:@"test.arch"];
    
    NSMutableData *data = [NSMutableData data];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    
    NSArray *array = @[@"one",@"two"];
    [archiver encodeInt:100 forKey:@"age"];//相当于SharedPreference的putInteger(key,value);
    [archiver encodeObject:array forKey:@"names"];//
    [archiver finishEncoding];//此方法调用，则将数据存入data
    
    if([data writeToFile:path atomically:YES]){
        NSLog(@"对象存入文件成功");
    }
    [self get];
 
}
-(void)get{
    NSString *rootDir = NSHomeDirectory();
    NSString *path = [rootDir stringByAppendingPathComponent:@"test.arch"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSKeyedArchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
    int age = [unarchiver decodeIntForKey:@"age"];//取出值
    NSArray *array = [unarchiver decodeObjectForKey:@"names"];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
