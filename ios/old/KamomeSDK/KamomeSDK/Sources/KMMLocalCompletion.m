//
// Copyright (c) 2020-present Hituzi Ando. All rights reserved.
//
// MIT License
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

#import "KMMLocalCompletion.h"

@interface KMMLocalCompletion ()

@property (nonatomic, copy, nullable) KMMLocalCompletionCallback callback;
@property (nonatomic) BOOL completed;

@end

@implementation KMMLocalCompletion

- (instancetype)initWithCallback:(nullable KMMLocalCompletionCallback)callback {
    if (self = [super init]) {
        _callback = callback;
    }

    return self;
}

- (void)dealloc {
    self.callback = nil;
}

#pragma mark - KMMCompleting

- (BOOL)isCompleted {
    return self.completed;
}

- (void)resolve {
    [self resolveWithDictionary:nil];
}

- (void)resolveWithDictionary:(nullable NSDictionary *)data {
    if (self.completed) {
        return;
    }

    self.completed = YES;

    if (self.callback) {
        self.callback(data, nil);
    }
}

- (void)resolveWithArray:(nullable NSArray *)data {
    if (self.completed) {
        return;
    }

    self.completed = YES;

    if (self.callback) {
        self.callback(data, nil);
    }
}

- (void)reject {
    [self rejectWithErrorMessage:nil];
}

- (void)rejectWithErrorMessage:(nullable NSString *)errorMessage {
    if (self.completed) {
        return;
    }

    self.completed = YES;

    if (self.callback) {
        self.callback(nil, errorMessage ?: @"Rejected");
    }
}

@end
