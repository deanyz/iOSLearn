//
//  BNRQuizViewController.m
//  Quiz
//
//  Created by 瑞 王 on 15/8/25.
//  Copyright (c) 2015年 Big Nerd Ranch. All rights reserved.
//

#import "BNRQuizViewController.h"

@interface BNRQuizViewController ()

@property (nonatomic) int currentQuestionIndex;
@property (nonatomic, copy) NSArray * questions;
@property (nonatomic, copy) NSArray * answers;

@property (nonatomic, weak) IBOutlet UILabel *questionLabel;
@property (nonatomic, weak) IBOutlet UILabel *answerLabel;

@end

@implementation BNRQuizViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil
                         bundle:(NSBundle *)nibBundleOrNil
{
    //调用父类实现的初始化方法
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        //创建两个数组对象，存储所需的问题和答案
        //同时，将questions和answers分别志向问题数组和答案数组
        
        self.questions = @[@"From what is cognac made?",
                           @"what is 7 + 7?",
                           @"what is the capital of Vermont?"];
        self.answers = @[@"Grapes",
                         @"14",
                         @"Montpelier"];
    }
    
    //返回新对象的地址
    return self;
}

- (IBAction)showQuestion:(id)sender
{
    self.currentQuestionIndex++;
    
    //是否已经回答完了所有的问题？
    if (self.currentQuestionIndex == [self.questions count]){
        
        //restart from first question
        self.currentQuestionIndex = 0;
    }
    
    // get question string from array according to current question index
    NSString *question = self.questions[self.currentQuestionIndex];
    
    //show question string on label
    self.questionLabel.text = question;
    
    //reset answer string
    self.answerLabel.text = @"???";
}

- (IBAction)showAnswer:(id)sender
{
    //what is the answer of current question
    NSString *answer = self.answers[self.currentQuestionIndex];
    
    //show the answer on the label
    self.answerLabel.text = answer;
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
