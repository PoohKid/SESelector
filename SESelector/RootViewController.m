//
//  RootViewController.m
//  SESelector
//
//  Created by admin on 11/07/20.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RootViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface KeyValuePair : NSObject {
@private
    id key_;
    id value_;
}
@property (nonatomic, retain) id key;
@property (nonatomic, retain) id value;
- (KeyValuePair *)initWithValue:(id)value key:(id)key;
- (KeyValuePair *)initWithResource:(NSString *)name ofType:(NSString *)ext key:(id)key;
@end

@implementation KeyValuePair
@synthesize key=key_;
@synthesize value=value_;
- (KeyValuePair *)initWithValue:(id)value key:(id)key
{
    self.key = key;
    self.value = value;
    return self;
}
- (KeyValuePair *)initWithResource:(NSString *)name ofType:(NSString *)ext key:(id)key
{
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:name ofType:ext]];
    return [self initWithValue:url key:key];
}
@end

@implementation RootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.navigationItem.title = @"SE Selector";

    seList_ = [[NSArray arrayWithObjects:
                [[[KeyValuePair alloc] initWithResource:@"hito_ge_goku01" ofType:@"mp3" key:@"飲み込む（高音）"] autorelease],
                [[[KeyValuePair alloc] initWithResource:@"hito_ge_goku02" ofType:@"mp3" key:@"飲み込む（低音）"] autorelease],
                [[[KeyValuePair alloc] initWithResource:@"hito_ge_paku01" ofType:@"mp3" key:@"がぶっ"] autorelease],
                [[[KeyValuePair alloc] initWithResource:@"kan_ge_takibi01" ofType:@"mp3" key:@"焚き火"] autorelease],
                [[[KeyValuePair alloc] initWithResource:@"botan_b43" ofType:@"mp3" key:@"拍子木"] autorelease],
                [[[KeyValuePair alloc] initWithResource:@"sei_ge_picha01" ofType:@"mp3" key:@"水・ぴしゃっ"] autorelease],
                [[[KeyValuePair alloc] initWithResource:@"sei_ge_tenka01" ofType:@"mp3" key:@"点火"] autorelease],
                [[[KeyValuePair alloc] initWithResource:@"ani_ge_ahiru01" ofType:@"mp3" key:@"鳥・アヒル"] autorelease],
                [[[KeyValuePair alloc] initWithResource:@"sen_ka_horagai01" ofType:@"mp3" key:@"ホラ貝01"] autorelease],
                [[[KeyValuePair alloc] initWithResource:@"ata_a24" ofType:@"mp3" key:@"琵琶（曲系「アタック24」）"] autorelease],
                [[[KeyValuePair alloc] initWithResource:@"ata_a25" ofType:@"mp3" key:@"しちりき（曲系「アタック25」）"] autorelease],
                [[[KeyValuePair alloc] initWithResource:@"ta_ge_kotaiko02" ofType:@"mp3" key:@"小太鼓（単打）"] autorelease],
                [[[KeyValuePair alloc] initWithResource:@"muci_fan_01" ofType:@"mp3" key:@"ジングル・ファンファーレ01"] autorelease],
                [[[KeyValuePair alloc] initWithResource:@"muci_fan_05" ofType:@"mp3" key:@"ジングル・ファンファーレ05"] autorelease],
                [[[KeyValuePair alloc] initWithResource:@"muci_hono_05" ofType:@"mp3" key:@"ジングル・ほのぼの05"] autorelease],
                [[[KeyValuePair alloc] initWithResource:@"ata_a12" ofType:@"mp3" key:@"単発音・アタック12（コケッ）"] autorelease],
                [[[KeyValuePair alloc] initWithResource:@"ata_a17" ofType:@"mp3" key:@"単発音・アタック17（ピコピコ♪）"] autorelease],
                [[[KeyValuePair alloc] initWithResource:@"ata_a26" ofType:@"mp3" key:@"単発音・アタック26（しゃりんー鈴）"] autorelease],
                [[[KeyValuePair alloc] initWithResource:@"ata_a27" ofType:@"mp3" key:@"単発音・アタック27（しゃんー鈴）"] autorelease],
                [[[KeyValuePair alloc] initWithResource:@"ata_a32" ofType:@"mp3" key:@"ボタン音32（ごくっ）"] autorelease],
                nil] retain];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

/*
 // Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations.
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
 */

// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [seList_ count];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }

    // Configure the cell.

    cell.textLabel.text = ((KeyValuePair *)[seList_ objectAtIndex:indexPath.row]).key;

    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        // Delete the row from the data source.
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert)
    {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    /*
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
    // ...
    // Pass the selected object to the new view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
    [detailViewController release];
	*/

    AVAudioPlayer *player;

    //効果音（AVFoundationフレームワーク）初期化
    NSURL *url = ((KeyValuePair *)[seList_ objectAtIndex:indexPath.row]).value;
    NSError *err;
    player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&err];
    if (err) {
        NSLog(@"システムサウンドの割り当てでエラー発生");
        NSLog(@"err: %@", err);
        exit(-1);
    }
    //[player prepareToPlay];

    //効果音（AVFoundationフレームワーク）
    [player play];

}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload
{
    [seList_ release], seList_ = nil;

    [super viewDidUnload];

    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}

- (void)dealloc
{
    [seList_ release], seList_ = nil;

    [super dealloc];
}

@end
