/**
 * Created by Administrator on 2017/7/6.
 */
var totalSize = 0;
var name;
var size;
var type;
var url;
    $(':file').change(function() {
        var file = this.files[0]; //假设file标签没打开multiple属性，那么只取第一个文件就行了
        alert(file);
        name = file.name;
        size = file.size;
        type = file.type;
        url = window.URL.createObjectURL(file); //获取本地文件的url，如果是图片文件，可用于预览图片
        $(this).next().html("文件名：" + name + " 文件类型：" + type + " 文件大小：" + size + " url: " + url);
        console.log(size);
        totalSize += size;
        console.log(totalSize);
        $("#info").html("总大小: " + totalSize + "bytes");
        $("#iimg").attr('src',url);
    });
    
    function uploadUtil(box) {
        this.box = box;

    }
    
    
    function uploadImg() {
    //创建FormData对象，初始化为form表单中的数据。需要添加其他数据可使用formData.append("property", "value");
        var formData = new FormData($('form')[0]);
    //ajax异步上传
        $.ajax({
            url: "http://localhost:8080/go/upload/img",
            type: "POST",
            data: formData,
            xhr: function(){ //获取ajaxSettings中的xhr对象，为它的upload属性绑定progress事件的处理函数
                myXhr = $.ajaxSettings.xhr();
                if(myXhr.upload){ //检查upload属性是否存在
                    //绑定progress事件的回调函数
                    myXhr.upload.addEventListener('progress',progressHandlingFunction, false);
                }
                return myXhr; //xhr对象返回给jQuery使用
            },
            success: function(result){
                $("#result").html(result.msg);
            },
            contentType: false, //必须false才会自动加上正确的Content-Type
            processData: false  //必须false才会避开jQuery对 formdata 的默认处理
        });
    }
//上传进度回调函数：
    function progressHandlingFunction(e) {
        if (e.lengthComputable) {
            $('progress').attr({value : e.loaded, max : e.total}); //更新数据到进度条
            var percent = e.loaded/e.total*100;
            $('#progress').html(e.loaded + "/" + e.total+" bytes. " + percent.toFixed(2) + "%");
        }
    }
