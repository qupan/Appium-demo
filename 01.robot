*** Settings ***
Resource          appkeyword.robot

*** Test Cases ***
01
    打开app    5.1.1    127.0.0.1:7555    com.tencent.android.qqdownloader    com.tencent.pangu.link.SplashActivity
    点击元素    //android.widget.TextView[@resource-id='com.tencent.android.qqdownloader:id/b3f']    #点击左上角X号
    Comment    输入文本    //android.widget.RelativeLayout[@resource-id='com.tencent.android.qqdownloader:id/awt']    weixin    #输入文本
    Comment    点击元素    //android.widget.TextView[@resource-id='com.tencent.android.qqdownloader:id/a5t']    #点击搜索
    ${x}    得到宽和高
    滑动    400    800     400     500    //android.widget.RelativeLayout[@resource-id='com.tencent.android.qqdownloader:id/awt']
    sleep    5
    关闭所有app
