//修改密码
function submit(){
    if(checkpassword()){
        var password = $("#pw").val();
        /* alert(userid+"@"+password); */
        $.ajax({
            url:root()+"/editPass.action?userid="+userid+"&password="+password,
            success:function(result){
                if(result>0){
                     layer.alert("修改成功!",{shade:false,icon:1,offset: ['40%']});
                }else{
                     layer.alert("修改失败!",{shade:false,icon:2,offset: ['40%']});
                }
            }
        })
    }else{
         layer.alert("两次输入密码不一致!",{shade:false,icon:2,offset: ['40%']});
    }
}

function checkpassword() {
    var password = document.getElementById("pw").value;
    var repassword = document.getElementById("repw").value;
    if(password == repassword) {
         document.getElementById("tishi").innerHTML="<br><font color='green'>两次密码输入一致</font>";
         return true;
     }else {
         document.getElementById("tishi").innerHTML="<br><font color='red'>两次输入密码不一致!</font>";
         return false;
     } 
}
