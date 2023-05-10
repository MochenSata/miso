function checkUserName(ele,msgTipEle,regexp,errorMsg){
    var eleValue = ele.val();
    if(eleValue == '' || eleValue == null){        
       msgTipEle.text("不能为空") ;
       return false;
   }else if( !regexp.test(eleValue)){
       msgTipEle.text(errorMsg);
       return false;
   }else{
       msgTipEle.text("") ;   
       return true;     
   }
}
function checkUserEmail(ele,msgTipEle,regexp,errorMsg){
    var eleValue = ele.val();
    if(eleValue == '' || eleValue == null){        
       msgTipEle.text("") ;
   }else if( !regexp.test(eleValue)){
       msgTipEle.text(errorMsg);
       return false;
   }else{
       msgTipEle.text("") ;   
         
   }
   return true;   
}

$(".username").blur(function(){
    var usernameEle = $(".username");
    var usernameTipEle = $(".usernameTip");
    var regexp = /^[a-zA-Z0-9_]{6,12}$/;  
    var errorMsg = "昵称只能由数字、字母、下划线组成，且有6-12个字符";
    return checkUserName(usernameEle,usernameTipEle,regexp,errorMsg);  
})


$(".useremail").blur(function() {
    var userEmailEle = $(".useremail");
    var userEmailTipEle = $(".useremailTip");
    var regexp = /^([a-zA-Z]|[0-9])(\w|\-)+@[a-zA-Z0-9]+\.([a-zA-Z]{2,4})$/;
    var errorMsg = "邮箱格式错误";
    return checkUserEmail(userEmailEle,userEmailTipEle,regexp,errorMsg);  
})


