#import "TableSomethingTableViewController.h"

@interface FancyTableViewCell: UITableViewCell;@end
@implementation FancyTableViewCell: UITableViewCell

-(void)setEditing:(BOOL)editing animated:(BOOL)animated {
    [super setEditing:editing animated:animated];

    NSLog(@"================> %@", @"edits ahoy");
}

- (void)willTransitionToState:(UITableViewCellStateMask)state {
    [super willTransitionToState:state];

    NSLog(@"================> %lu", (unsigned long)state);

    if (state == UITableViewCellStateDefaultMask) {
        NSLog(@"Default");
    } else if ((state & UITableViewCellStateShowingEditControlMask) && (state & UITableViewCellStateShowingDeleteConfirmationMask)) {
        NSLog(@"Edit Control + Delete Button");

    } else if (state & UITableViewCellStateShowingEditControlMask) {
        NSLog(@"Edit Control Only");

    } else if (state == UITableViewCellStateShowingDeleteConfirmationMask) {
        NSLog(@"Swipe to Delete [Delete] button only");
    }
}

-(void)didTransitionToState:(UITableViewCellStateMask)state {
    [super didTransitionToState:state];

    NSLog(@"================> %lu", (unsigned long)state);

    if (state == UITableViewCellStateDefaultMask) {
        NSLog(@"Default");
    } else if ((state & UITableViewCellStateShowingEditControlMask) && (state & UITableViewCellStateShowingDeleteConfirmationMask)) {
        NSLog(@"Edit Control + Delete Button");

    } else if (state & UITableViewCellStateShowingEditControlMask) {
        NSLog(@"Edit Control Only");

    } else if (state == UITableViewCellStateShowingDeleteConfirmationMask) {
        NSLog(@"Swipe to Delete [Delete] button only");
    }
}
@end


@interface TableSomethingTableViewController ()
@end

@implementation TableSomethingTableViewController
NSUInteger numberOfCells = 10;
UITableViewCell *strongCell;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = self.editButtonItem;

    [self.tableView registerClass:[FancyTableViewCell class] forCellReuseIdentifier:@"reuseIdentifier"];
    self.tableView.editing = YES;
}

#pragma mark -  KVO (yuckface)

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary<NSKeyValueChangeKey,id> *)change
                       context:(void *)context {
    NSLog(@"================> %@", @"HA HA GOT EM");
    UITableViewCell *cell = (UITableViewCell *)object;
    NSLog(@"================> %d", cell.showingDeleteConfirmation);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return numberOfCells;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" forIndexPath:indexPath];

    cell.textLabel.text = [NSString stringWithFormat:@"Off with their heads (%lu)!", (unsigned long)numberOfCells];

    [cell addObserver:self
           forKeyPath:@"showingDeleteConfirmation"
              options:NSKeyValueObservingOptionNew
              context:nil];

    [cell addObserver:self
           forKeyPath:@"editing"
              options:NSKeyValueObservingOptionNew
              context:nil];

    strongCell = cell;

    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSLog(@"================> %@", @"let's burn this city down");
        numberOfCells--;
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
         NSLog(@"================> %@", @"you done goofed marty");
    }
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
