#import <UIKit/UIKit.h>
#import "TestModel.h"

@interface test1ViewController : UIViewController <UIGestureRecognizerDelegate>
{
    NSMutableArray *        arrayOfImgs;
    TestModel *             testModel;
    NSTimer *               thatTimer;
    IBOutlet UITextField *  thatTextField;
    
    UITapGestureRecognizer *tapRecognizer;
    UIPanGestureRecognizer *panRecognizer;

    BOOL swipeDirectionIsToTheRight; // that's actually a PanGesture direction
    BOOL previousSwipeDirectionWasToTheRight; 
}

@property (nonatomic, retain) UITextField *     thatTextField;
@property (nonatomic, retain) NSTimer *         thatTimer;
@property (nonatomic, retain) NSMutableArray *  arrayOfImgs;

@property (nonatomic, retain) UITapGestureRecognizer *tapRecognizer;
@property (nonatomic, retain) UIPanGestureRecognizer *panRecognizer;

@property BOOL swipeDirectionIsToTheRight;
@property BOOL previousSwipeDirectionWasToTheRight;

-(IBAction)runButtonEvent:(UIButton *) sender;
-(void)makeAnEffectOfMovingImages;

-(IBAction)handlePanGesture:(UIPanGestureRecognizer *)      sender;
-(IBAction)handleSingleTapGesture:(UIGestureRecognizer *)   sender;
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)            gestureRecognizer 
       shouldReceiveTouch:(UITouch *)                       touch;

-(void)viewDidLoad;
-(void)viewDidUnload;

@end
