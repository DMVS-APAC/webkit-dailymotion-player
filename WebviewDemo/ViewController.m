//
//  ViewController.m
//  WebviewDemo
//
//  Created by Arryangga Aliev Pratamaputra on 03/07/24.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.webView.delegate = self;
    self.webView.allowsInlineMediaPlayback = true;
    
    NSString *stringURL = @"https://geo.dailymotion.com/player/xtsoi.html?video=k2qd0Z9lvqhspYAXZAu";
    NSURL *URL = [NSURL URLWithString:(stringURL)];
    NSURLRequest *requestURL = [NSURLRequest requestWithURL:URL];
    [self.webView loadRequest:requestURL];
}


@end
