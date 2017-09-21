//
//  ViewController.m
//  Social Networking
//
//  Created by Kevin on 5/15/16.
//  Copyright © 2016 Kevin Skompinski. All rights reserved.
//

#import "ViewController.h"
#import "Social/Social.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextView *TextField1;
@property (weak, nonatomic) IBOutlet UITextView *TextField2;
@property (weak, nonatomic) IBOutlet UITextView *TextField3;

- (void) configureTextFields;
- (void) hideKeyboard;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureTextFields];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)SendToTwitterButton:(id)sender {
    [self hideKeyboard];

    SLComposeViewController *tweet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
    
    if ([self.TextField1.text length] < 140){
        [tweet setInitialText:self.TextField1.text];
    }
    else{
        NSString *tweetText = [self.TextField1.text substringToIndex:140];
        [tweet setInitialText:tweetText];
    }
    
    [self presentViewController:tweet animated:YES completion:nil];
    
}
- (IBAction)SendToFacebookButton:(id)sender {
     [self hideKeyboard];
    
    SLComposeViewController *status = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];

    [status setInitialText:self.TextField2.text];

    [self presentViewController:status animated:YES completion:nil];
    
    
}
- (IBAction)SendToMenuButton:(id)sender {
     [self hideKeyboard];
    
    UIActivityViewController *menu = [[UIActivityViewController alloc] initWithActivityItems:@[self.TextField3.text] applicationActivities:nil];
    
    [self presentViewController:menu animated:YES completion:nil];
}
- (IBAction)ShowPopupButton:(id)sender {
     [self hideKeyboard];
    
    UIAlertController *popup = [UIAlertController alertControllerWithTitle:@"Nothing Happens" message:@"That's just swell." preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Go Away Now" style:(UIAlertActionStyleDefault) handler:nil];
    
    [popup addAction:cancel];
    
    [self presentViewController:popup animated:YES completion:nil];
    
}

- (void) hideKeyboard{
    if([self.TextField1 isFirstResponder]){
        [self.TextField1 resignFirstResponder];
    }
    if([self.TextField2 isFirstResponder]){
        [self.TextField2 resignFirstResponder];
    }
    if([self.TextField3 isFirstResponder]){
        [self.TextField3 resignFirstResponder];
    }
}

- (void) configureTextFields{
    self.TextField1.layer.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.1].CGColor;
    
    self.TextField2.layer.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.2].CGColor;
    
    self.TextField3.layer.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.3].CGColor;
    
}

@end
