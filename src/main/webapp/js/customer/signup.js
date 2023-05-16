document.querySelector(".usertelno").onblur=checkUsertelno;
document.querySelector("#verification").onblur=checkVerification;
document.querySelector(".userpwd").onblur=checkUserpwd;

function checkIpt(ele,msgTipEle,regexp,errorMsg){
    var eleValue = ele.value;
    if(eleValue == '' || eleValue == null){
        msgTipEle.innerText = "不能为空";
    }else if(!regexp.test(eleValue)){
        msgTipEle.innerText = errorMsg;
    }else{
        msgTipEle.innerText = "";
    }
}

//验证手机号
function checkUsertelno(){
    var usertelnoEle=document.querySelector(".usertelno");
    var usertelnoTipEle=document.querySelector(".usertelnoTip");
    var regexp=/^[0-9]{11}$/;
    var errorMsg="手机号应该为11位数字";
    checkIpt(usertelnoEle,usertelnoTipEle,regexp,errorMsg);
}
//验证码
function checkVerification(){
    var usertelnoEle=document.querySelector("#verification");
    var usertelnoTipEle=document.querySelector(".verificationTip");
    var regexp=/^[0-9]{4}$/;
    var errorMsg="验证码应该是4位数字";
    checkIpt(usertelnoEle,usertelnoTipEle,regexp,errorMsg);
}

//验证密码
function checkUserpwd(){
    var usertelnoEle=document.querySelector(".userpwd");
    var usertelnoTipEle=document.querySelector(".userpwdTip");
    var regexp=/^[a-zA-Z0-9]{8,16}$/;
    var errorMsg="密码只能是数字,字母,且长度在8-16个字符";
    checkIpt(usertelnoEle,usertelnoTipEle,regexp,errorMsg);
}