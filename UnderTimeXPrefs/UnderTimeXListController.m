#include "UnderTimeXListController.h"
#import <UIKit/UIKit.h>
#import <spawn.h>

@implementation UnderTimeXListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"UnderTimeXPrefs" target:self] retain];
	}

	return _specifiers;
}

- (void)respring {
	pid_t pid;
    int status;
    const char* args[] = { "killall", "-9", "SpringBoard", NULL };
    posix_spawn(&pid, "/usr/bin/killall", NULL, NULL, (char* const*)args, NULL);
    waitpid(pid, &status, WEXITED);
}

- (void)openTwitter {
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://twitter.com/i4M1k0SU"]];
}

@end
