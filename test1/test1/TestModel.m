
#import "TestModel.h"


@implementation TestModel

@synthesize circleCenter, amountOfImgs, 
            alphaChange, alpha, omega, omegaMultiplier,
            lastAcceleration;

static TestModel *_sharedInstance = nil;

static void singleton_remover() {
    if (_sharedInstance) {
        [_sharedInstance release];
    }
}

+(TestModel *) sharedInstance
{
    if (!_sharedInstance) {
        _sharedInstance = [[TestModel alloc] init];
        // release instance at exit
        atexit(singleton_remover);
    }
    return _sharedInstance;
}

-(void)countAngleChange // in radians
{
    if(amountOfImgs != 0 && amountOfImgs <= 360) 
    {
        alphaChange = (360/amountOfImgs)*M_PI / 180;
    }
    else if (amountOfImgs > 360)
    {
        amountOfImgs = 360;
        alphaChange = (360/amountOfImgs)*M_PI / 180;
    }
    else
    {
        alphaChange = 1;
    }
}

-(void)makeAnEffectOfMovingImagesWhere:(BOOL)swipeDirectionIsToTheRight 
                              andWhere:(BOOL)previousSwipeDirectionWasToTheRight
{
    if (swipeDirectionIsToTheRight && previousSwipeDirectionWasToTheRight)
    {
        alpha -= omega + alphaChange + lastAcceleration;
        if (alpha < (360 * M_PI / 180))
        {
            alpha += 360 * M_PI / 180;
        }
    }
    else if(!swipeDirectionIsToTheRight && !previousSwipeDirectionWasToTheRight)
    {
        alpha += omega + alphaChange + lastAcceleration;
        if (alpha > (360 * M_PI / 180))
        {
            alpha -= 360 * M_PI / 180;
        }
    }
    else if (swipeDirectionIsToTheRight && !previousSwipeDirectionWasToTheRight)
    {
        alpha -= omega + alphaChange - lastAcceleration;
        if (alpha < (360 * M_PI / 180))
        {
            alpha += 360 * M_PI / 180;
        }
    }
    else if (!swipeDirectionIsToTheRight && previousSwipeDirectionWasToTheRight)
    {
        alpha += omega + alphaChange - lastAcceleration;
        if (alpha > (360 * M_PI / 180))
        {
            alpha -= 360 * M_PI / 180;
        }
    }
    
    if(omega > 0)
    {
        omega -= SWIPE_FADER_MULTIPLIER;//*omegaMultiplier/2;
    }
    lastAcceleration = omega;
}

-(BOOL)makeAnEffectOfFadingVelocityOfMovement
{
    lastAcceleration = 0;
    if(omega <= TAP_FADER_MULTIPLIER*omegaMultiplier)
    {
        return YES; 
    }
    else
    {
        // fading effect
        omega -= TAP_FADER_MULTIPLIER*omegaMultiplier; // <- a math function would be more suitable here
    }
    return NO;
}



@end
