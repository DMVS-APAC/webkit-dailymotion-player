#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Step 1: Create a WKWebViewConfiguration object
    WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
    [config.userContentController addScriptMessageHandler:self name:@"iOS"];
    config.allowsInlineMediaPlayback = YES;
    
    // Step 2: Initialize WKWebView with the configuration and set its frame
    self.webView = [[WKWebView alloc] initWithFrame:self.view.bounds configuration:config];
    self.webView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;

    
    // Step 4: Add WKWebView to the view hierarchy
    [self.view addSubview:self.webView];
   
    
    // Step 5: Prepare the URL
    NSString *stringURL = @"https://staging.dmvs-apac.com/webview_test/ios-postmessage.html";
    NSURL *URL = [NSURL URLWithString:(stringURL)];
    NSURLRequest *requestURL = [NSURLRequest requestWithURL:URL];
    
    // Step 6: Load the webview
    [self.webView loadRequest:requestURL];
    
    
    NSLog(@"WebView initialized and request loaded");
}

// Implement the WKScriptMessageHandler method to handle messages
- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message {
    if ([message.name isEqualToString:@"iOS"]) {
        NSLog(@"Received event: %@", message.body);
        // Handle the message here
    }
}

// Clean up the message handler in dealloc
- (void)dealloc {
    [self.webView.configuration.userContentController removeScriptMessageHandlerForName:@"iOS"];
}

@end
