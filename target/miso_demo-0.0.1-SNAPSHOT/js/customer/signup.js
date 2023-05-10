document.querySelector(".usertelno").onblur=checkUsertelno;
document.querySelector("#verification").onblur=checkVerification;

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
    var regexp=/^[0-9]{6}$/;
    var errorMsg="验证码应该是6位数字";
    checkIpt(usertelnoEle,usertelnoTipEle,regexp,errorMsg);
}