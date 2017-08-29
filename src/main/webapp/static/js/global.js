/**
 * Created by Administrator on 2017/6/28.
 */
$(function () {

    $('#kaptchaImage').click(function() {
        alert("12");
       // $(this).attr('src','imageCode.html?' + Math.floor(Math.random() * 100));
    });

    $('.loginButton').click(function(e) {
        if($("#account").val()==""){
            layer.msg("请输入用户名");
        }else if($("#pwd").val()==""){
            layer.msg("请输入密码");
        }else{
            layer.load(2);
            var data={"username":$("#account").val(),"password":$("#pwd").val(),"code":$("#code").val()};
            $.ajax({
                type:"POST",
                url:"dologin.html",
                dataType:"application/json",
                data:data,
                success:function(data){
                    layer.closeAll('loading');
                    console.log(data);
                    var obj = eval('(' + data + ')');
                    if(obj.code!=200){
                        layer.msg(obj.message);
                    }else{
                        layer.msg(obj.message);
                        setTimeout("location.href='/admin/index'", 1500);
                    }
                }
            });
        }
    });

});
