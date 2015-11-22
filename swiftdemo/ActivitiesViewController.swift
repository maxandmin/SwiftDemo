//
//  ActivitiesViewController.swift
//  swiftdemo
//
//  Created by maxin on 15/11/20.
//  Copyright © 2015年 maxin. All rights reserved.
//

 /// 对于初级控件的使用

import UIKit
import Foundation

class ActivitiesViewController: UIViewController,UIAlertViewDelegate,UITextFieldDelegate,UISearchBarDelegate, UIPickerViewDelegate, UIPickerViewDataSource ,UIActionSheetDelegate{

    
    var Index:String = ""
    var Showtext: UILabel?
    var Textfiled:UITextField?
    var searchbar:UISearchBar?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view!.backgroundColor = UIColor.whiteColor();
        
        self.ShowUI();
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    func ShowUI(){
    
        if(Index=="1"){
        
            self.LableText();
        }
        if(Index=="2"){
        
            self.ButtonTest();
        }
        
        if(Index=="3"){
        
            self.ImageviewTest();
            
        }
        if(Index=="4"){
        
            self.UISliderTest();
        }
        
        if(Index=="5"){
        
            self.UIwebviewTest();
        }
        if(Index=="6"){
        
            self.SegnentTest();
        }
        if(Index=="7"){
         
            self.TestSwitch();
        }
        if(Index=="8"){
        
            self.testTextFiled();
            
        }
        if(Index=="9"){
        
            self.TestScrollView();
        }
        if(Index=="10"){
        
            self.TestSearchBar();
        }
        if(Index=="11"){
        
            self.TestpagControl();
        }
        if(Index=="12"){
        
            self.TestDatePicker();
        }
        if(Index=="13"){
        
            self.TestPickview();
        }
        if(Index=="14"){
        
            self.TestProgress();
        }
        if(Index=="15"){
        
            self.TesttextView();
        }
        if(Index=="16"){
        
            self.TestActionSheet();
            
        }
        if(Index=="17"){
            
            self.TestActivity();
            
        }
    }
    /**
     UIlabel
     */
    func LableText()
    {
        let lable=UILabel(frame: CGRectMake(50, 100, 200, 80))
        lable.text = "这个是一个Lable,这个是一个Lable,这个是一个Lable,这个是一个Lable"
        lable.font = UIFont .systemFontOfSize(17.0)
        lable.textColor = UIColor.redColor()
        //自动折行设置
        lable.lineBreakMode = NSLineBreakMode(rawValue: 0)!;
        lable.numberOfLines = 0;
        self.view .addSubview(lable)
    }
    
    /**
    *  UIbutton
    */
    
    func ButtonTest()
    {
    
        let Btn = UIButton(frame: CGRectMake(50,100,200,40))
        Btn.backgroundColor = UIColor.redColor()
        Btn .setTitle("点我试试", forState: UIControlState.Normal)
        Btn.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(Btn)
    }
    /**
    alert
     */
    func buttonAction(sender:UIButton)
    {
        let alertView = UIAlertView()
        alertView.title = "Title"
        alertView.message = "Message"
        alertView.addButtonWithTitle("OK")
        alertView.addButtonWithTitle("Cancel")
        alertView.show()
        
    }
    
    /**
     Imageview
     */
    func ImageviewTest(){
        
        let imgview = UIImageView(frame: CGRectMake(50, 100, 200, 200));
        imgview.image = UIImage(named: "swift-hero")
        self.view.addSubview(imgview)
        
    
    }
    /**
     UISlider
     */
    func UISliderTest(){
        
        let slider = UISlider(frame:CGRectMake(50,100,200,250));
        slider.minimumValue=1.0
        slider.maximumValue = 1000.0
        self.view.addSubview(slider)
        slider.addTarget(self, action: "Change:", forControlEvents: UIControlEvents.ValueChanged)
        
        Showtext = UILabel(frame:CGRectMake(150,150,200,250))
        Showtext!.textAlignment = NSTextAlignment.Center;
        Showtext?.text = "0.0"
        Showtext?.textColor = UIColor.redColor()
        self.view.addSubview(Showtext!)
        
    }
    func Change(seder:UISlider){
    
        Showtext!.text = String(seder.value)
        print(seder.value)
        
    }
    
    /**
    webview
     */
    
    func UIwebviewTest(){
    
        /// 貌似这里的webview 需要添加http://
        let webview = UIWebView(frame: CGRectMake(10,100,350,450))
        let url = NSURL(string: "http://www.baidu.com")
        let request = NSURLRequest(URL:url!)
        webview.loadRequest(request)
        self.view.addSubview(webview);
        
    }
    
    /**
     Segnent
     */
    func SegnentTest(){
        
        let segment = UISegmentedControl(items:["A","B","C","D"])
        segment.frame = CGRectMake(50,100,200,40)
        segment.addTarget(self, action:"segmentChange:", forControlEvents: UIControlEvents.ValueChanged)
        self.view.addSubview(segment)
    }
    
    func segmentChange(sender:UISegmentedControl){
    
        print(sender.selectedSegmentIndex)
        self.TestAlert(String(sender.selectedSegmentIndex))
    }
    /**
     
     这里想做一个自动消失的Alert。失败
     */
    func TestAlert(testStr:String){
    
        let Str:NSString = "你点击了 "
        let alert = UIAlertView.init(title: "提示", message: (Str as String)+testStr, delegate: self, cancelButtonTitle: "OK");
        alert.show();
        let delay = 2.0 * Double(NSEC_PER_SEC)
        let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
        dispatch_after(time, dispatch_get_main_queue(), {
            
            NSThread.detachNewThreadSelector(Selector("AlertKill:"), toTarget:self, withObject: "sunshine")
        })
    }
    func AlertKill(object: AnyObject?) {
        print("attached object: \(object)")
    }
    
    /**
    *  UISwitch 开关
    */
    
    func TestSwitch(){
    
        let swith = UISwitch(frame: CGRectMake(100,100,350,450))
        swith.on = false
        swith.addTarget(self, action: "swithChange:", forControlEvents: UIControlEvents.ValueChanged)
        self.view.addSubview(swith)
        
    }
    
    func swithChange(sender:UISwitch){
    
        print(sender.on)
        
    }
    
    /**
     UItextFiled
     */
    func testTextFiled(){
    
        Textfiled = UITextField(frame: CGRectMake(100,200,200,60))
        Textfiled!.placeholder="这是一个测试"
        Textfiled!.delegate = self
        Textfiled!.borderStyle = UITextBorderStyle.RoundedRect
        Textfiled!.textColor=UIColor.blueColor()
        self.view.addSubview(Textfiled!)
        
    }
    
     func textFieldShouldReturn(textField: UITextField) -> Bool {
        Textfiled!.resignFirstResponder()
        
        return true
    }
    
    /**
    *  ScrollView
    */
    
    func TestScrollView(){
        
        let scrollview = UIScrollView(frame: CGRectMake(50,100,200,200))
        scrollview.backgroundColor=UIColor.grayColor()
        scrollview.contentSize.height = 300
        scrollview.contentSize.width = 300
        self.view.addSubview(scrollview)
        
    }
    
    /**
    *  TestSearchBar
    */
    
    func TestSearchBar(){
    
        searchbar = UISearchBar(frame: CGRectMake(0,64,320,50))
        searchbar!.searchBarStyle = UISearchBarStyle.Prominent
        searchbar!.delegate = self
        self.view.addSubview(searchbar!)
        
    }
    
    
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        
        searchbar!.resignFirstResponder()
        
    }
    
    
    /**
    *  PagControl
    */
    
    func TestpagControl(){
    
        let page = UIPageControl(frame: CGRectMake(50,100,200,50))
        page.numberOfPages = 6
        page.currentPage = 2
        page.backgroundColor = UIColor.grayColor()
        self.view.addSubview(page)
    }
    
    
    /**
    *  DatePicker
    */
    
    func TestDatePicker(){
    
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let maxDate = dateFormatter.dateFromString("2016-01-01 08:00:00")
        let minDate = dateFormatter.dateFromString("2015-01-01 08:00:00")
       
        let datePicker = UIDatePicker(frame: CGRectMake(10,100,300,100))
        datePicker.datePickerMode=UIDatePickerMode.Date
        datePicker.addTarget(self, action:Selector("datePickerValueChange:"), forControlEvents: UIControlEvents.ValueChanged)
        datePicker.datePickerMode  = UIDatePickerMode.DateAndTime
        datePicker.maximumDate = maxDate
        datePicker.minimumDate = minDate
        datePicker.date = NSDate()
        self.view.addSubview(datePicker)
        
    }
    
    func datePickerValueChange(sender:UIDatePicker){
    
        print(sender.date)
        
    }
    
    /**
     Pickview
     */
    
    func TestPickview(){
    
        let pick = UIPickerView(frame: CGRectMake(10,100,300,100))
        pick.delegate = self
        pick.dataSource = self
        self.view.addSubview(pick)
        
        
    }
    
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int
    {
        return 3
    }
    
    // returns the # of rows in each component..
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return 10
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return String(format:"%i", row)
    }
    
    /**
     Progress
     */
    
    func TestProgress(){
    
        let  progressView=UIProgressView(progressViewStyle : UIProgressViewStyle.Default)
        progressView.frame=CGRectMake(50,100,300,100)
        
        progressView.progress=0.5
        
        progressView.progressTintColor=UIColor.blueColor()
        
        progressView.trackTintColor=UIColor.greenColor()
        
       progressView.backgroundColor=UIColor.redColor()
        
        self.view.addSubview(progressView)
    }
    
    
    /**
    *  UItextView
    */
    func TesttextView(){
    
        let Textview = UITextView(frame:CGRectMake(50, 100, 200, 200))
    Textview.text="UItextViewUItextViewUItextViewUItextViewUItextViewUItextViewUItextViewUItextViewUItextViewUItextViewUItextViewUItextViewUItextViewUItextViewUItextViewUItextViewUItextViewUItextViewUItextViewUItextViewUItextViewUItextViewUItextViewUItextViewUItextViewUItextViewUItextViewUItextViewUItextViewUItextViewUItextViewUItextViewUItextViewUItextViewUItextViewUItextViewUItextViewUItextViewUItextViewUItextViewUItextViewUItextViewUItextViewUItextViewUItextViewUItextViewUItextViewUItextViewUItextView"
        Textview.font = UIFont.systemFontOfSize(15.0)
        self.view.addSubview(Textview)
    }
    
    
    
    /**
    *  ActionSheet
    */
    func TestActionSheet(){
    
        let TestBtn  = UIButton(frame: CGRectMake(50,100,100,50))
        TestBtn.backgroundColor = UIColor.grayColor()
        TestBtn.addTarget(self, action:"ShowSheet", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(TestBtn)
        
    }
    
    func ShowSheet(){
    
        let SheetBtn = UIActionSheet.init(title: "测试。。。。", delegate: self, cancelButtonTitle: "取消", destructiveButtonTitle: "按钮一", otherButtonTitles: "按钮二", "按钮三","按钮四")
        SheetBtn.showInView(self.view)
    }
    
    /**
    *  Activitydicatorview
    */
    
    func TestActivity(){
    
        let activityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle:UIActivityIndicatorViewStyle.Gray)
        activityIndicatorView.frame = CGRectMake(140, 120, 100, 100)
        activityIndicatorView.color = UIColor.blackColor()
        activityIndicatorView.startAnimating()
        self.view.addSubview(activityIndicatorView)

        
    }

    
    
}


