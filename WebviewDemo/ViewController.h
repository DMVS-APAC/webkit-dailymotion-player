//
//  ViewController.h
//  WebviewDemo
//
//  Created by Arryangga Aliev Pratamaputra on 03/07/24.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

@interface ViewController : UIViewController <WKScriptMessageHandler, WKNavigationDelegate>
@property (weak, nonatomic) IBOutlet WKWebView *webView;
@property(nonatomic) BOOL allowsInlineMediaPlayback;

@end

