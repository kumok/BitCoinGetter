//
//  BCGraphViewController.m
//  BitCoinGetter
//
//  Created by Duc Ho on 2/7/15.
//  Copyright (c) 2015 self. All rights reserved.
//

#import "BCGraphViewController.h"
#import "SHLineGraphView.h"
#import "SHPlot.h"


@interface BCGraphViewController ()

@end

@implementation BCGraphViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Last 8 days Prices";
    SHLineGraphView *_lineGraph = [[SHLineGraphView alloc] initWithFrame:CGRectMake(0, 300, 350, 300)];
    
    //set the main graph area theme attributes
    
    /**
     *  theme attributes dictionary. you can specify graph theme releated attributes in this dictionary. if this property is
     *  nil, then a default theme setting is applied to the graph.
     */
    NSDictionary *_themeAttributes = @{
                                       kXAxisLabelColorKey : [UIColor colorWithRed:0.48 green:0.48 blue:0.49 alpha:0.4],
                                       kXAxisLabelFontKey : [UIFont fontWithName:@"TrebuchetMS" size:10],
                                       kYAxisLabelColorKey : [UIColor colorWithRed:0.48 green:0.48 blue:0.49 alpha:0.4],
                                       kYAxisLabelFontKey : [UIFont fontWithName:@"TrebuchetMS" size:10],
                                       kYAxisLabelSideMarginsKey : @20,
                                       kPlotBackgroundLineColorKey : [UIColor colorWithRed:0.48 green:0.48 blue:0.49 alpha:0.4],
                                       kDotSizeKey : @10
                                       };
    _lineGraph.themeAttributes = _themeAttributes;
    
    //set the line graph attributes
    
    /**
     *  the maximum y-value possible in the graph. make sure that the y-value is not in the plotting points is not greater
     *  then this number. otherwise the graph plotting will show wrong results.
     */
    _lineGraph.yAxisRange = @(350);
    
    /**
     *  y-axis values are calculated according to the yAxisRange passed. so you do not have to pass the explicit labels for
     *  y-axis, but if you want to put any suffix to the calculated y-values, you can mention it here (e.g. K, M, Kg ...)
     */
    _lineGraph.yAxisSuffix = @"K";
    
    /**
     *  an Array of dictionaries specifying the key/value pair where key is the object which will identify a particular
     *  x point on the x-axis line. and the value is the label which you want to show on x-axis against that point on x-axis.
     *  the keys are important here as when plotting the actual points on the graph, you will have to use the same key to
     *  specify the point value for that x-axis point.
     */
    _lineGraph.xAxisValues = @[
                               @{ @1 : @"2015-01-01" },
                               @{ @2 : @"2015-01-02" },
                               @{ @3 : @"2015-01-03" },
                               @{ @4 : @"2015-01-04" },
                               @{ @5 : @"2015-01-05" },
                               @{ @6 : @"2015-01-06" },
                               @{ @7 : @"2015-01-07" },
                               @{ @8 : @"2015-01-08" },
                               ];
    
    //create a new plot object that you want to draw on the `_lineGraph`
    SHPlot *_plot1 = [[SHPlot alloc] init];
    
    //set the plot attributes
    
    /**
     *  Array of dictionaries, where the key is the same as the one which you specified in the `xAxisValues` in `SHLineGraphView`,
     *  the value is the number which will determine the point location along the y-axis line. make sure the values are not
     *  greater than the `yAxisRange` specified in `SHLineGraphView`.
     */

    _plot1.plottingValues = @[
                              @{ @1 : [self.dictionaryData objectForKey:@"2015-01-01"]},
                              @{ @2 : [self.dictionaryData objectForKey:@"2015-01-02"]},
                              @{ @3 : [self.dictionaryData objectForKey:@"2015-01-03"]},
                              @{ @4 : [self.dictionaryData objectForKey:@"2015-01-04"]},
                              @{ @5 : [self.dictionaryData objectForKey:@"2015-01-05"]},
                              @{ @6 : [self.dictionaryData objectForKey:@"2015-01-06"]},
                              @{ @7 : [self.dictionaryData objectForKey:@"2015-01-07"]},
                              @{ @8 : [self.dictionaryData objectForKey:@"2015-01-08"]},
                              ];
    
    /**
     *  this is an optional array of `NSString` that specifies the labels to show on the particular points. when user clicks on
     *  a particular points, a popover view is shown and will show the particular label on for that point, that is specified
     *  in this array.
     */
    NSArray *arr = @[@"1", @"2", @"3", @"4", @"5", @"6" , @"7" , @"8"];
    _plot1.plottingPointsLabels = arr;
    
    //set plot theme attributes
    
    /**
     *  the dictionary which you can use to assing the theme attributes of the plot. if this property is nil, a default theme
     *  is applied selected and the graph is plotted with those default settings.
     */
    
    NSDictionary *_plotThemeAttributes = @{
                                           kPlotFillColorKey : [UIColor colorWithRed:0.47 green:0.75 blue:0.78 alpha:0.5],
                                           kPlotStrokeWidthKey : @2,
                                           kPlotStrokeColorKey : [UIColor colorWithRed:0.18 green:0.36 blue:0.41 alpha:1],
                                           kPlotPointFillColorKey : [UIColor colorWithRed:0.18 green:0.36 blue:0.41 alpha:1],
                                           kPlotPointValueFontKey : [UIFont fontWithName:@"TrebuchetMS" size:18]
                                           };
    
    _plot1.plotThemeAttributes = _plotThemeAttributes;
    [_lineGraph addPlot:_plot1];
    
    //You can as much `SHPlots` as you can in a `SHLineGraphView`
    
    [_lineGraph setupTheView];
    
    [self.view addSubview:_lineGraph];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
