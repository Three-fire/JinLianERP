﻿
// 发送前执行数据安全检查.
function CheckBlank() {
    var msg = "";
//    if (ReqAthFileName('GaoJian') == null) {
//        msg += '您没有上传文档附件 \t\n';
//    }
    if (document.getElementById('DDL_FK_QX1').value=='') {
        msg += '区县:不能为空 \t\n';
    }
    if (document.getElementById('DDL_FK_QX').value=='') {
        msg += '街道:不能为空 \t\n';
    }
    if (document.getElementById('DDL_FK_JD').value=='') {
        msg += '社区:不能为空 \t\n';
    }
    if (msg == "")
        return true; /*可以提交.*/
    alert(msg);
    return false; /*不能提交.*/
}
