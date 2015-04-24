#import "Script.h"

@interface Script ()
@property (nonatomic, strong) NSMutableArray *messages;
@end

@implementation Script

- (instancetype)initWithMessages:(NSArray *)messages {
    self = [super init];
    if (self) {
        self.messages = [messages mutableCopy];
    }

    return self;
}

- (NSString *)advance {
    if (self.messages.count == 0) {
        return nil;
    }

    NSString *message = [self.messages objectAtIndex:0];
    [self.messages removeObjectAtIndex:0];
    return message;
}

@end
