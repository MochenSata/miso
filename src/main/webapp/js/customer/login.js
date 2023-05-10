document.querySelector(".usertelno").onblur=checkUsertelno;
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
    var errorMsg="手机号应该为11为数字";
    checkIpt(usertelnoEle,usertelnoTipEle,regexp,errorMsg);
}

//验证密码
function checkUserpwd(){
    var userpwdEle = document.querySelector(".userpwd");
    var userpwdTipEle = document.querySelector(".userpwdTip");
    var regexp = /^[a-zA-Z0-9]{8,16}$/;
    var errorMsg = "密码只能是数字。字母。下划线，应该有8-16个字符";
    checkIpt(userpwdEle,userpwdTipEle,regexp,errorMsg);
}