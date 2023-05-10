function checkInvitation(ele,msgTipEle,regexp,errorMsg){
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

$(".i").blur(function() {
    var userInvitation = $(".i");
    var userInvitationTip = $(".msg");
    var regexp = /^[a-zA-Z0-9_]{6,12}$/;
    var errorMsg = "邀请码不正确";
    return checkInvitation(userInvitation,userInvitationTip,regexp,errorMsg);  
})