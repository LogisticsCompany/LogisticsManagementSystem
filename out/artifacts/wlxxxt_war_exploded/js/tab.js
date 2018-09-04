//tab菜单切换
function setTab(name, cursel, n) {
    for (i = 1; i <= n; i++) {
        var menu = document.getElementById(name + i);
        var con = document.getElementById("con_" + name + "_" + i);
        menu.className = i == cursel ? "hover" : "";
        con.style.display = i == cursel ? "block" : "none";
    }
}

//
//sd  始发地
//md 目的地
//zl 重量
function sj(sd, md, zl) {
    var szj = 0;
    var xzj = 0;
    var yf = 0;

    if (sd >= 1 && sd <= 4)//如果始发地为 上海 浙江 江苏 安徽
    {
        if (md >= 1 && md <= 4)//如果 目的地为 上海 浙江 江苏 安徽
        {
            szj = 16;//首重价格为 16
            xzj = 6;//续重价格为 6
        }
        if (md >= 5 && md <= 9)//如果 目的地为 广东 广西 福建 海南 江西
        {
            szj = 18;//首重价为 18
            xzj = 8;//续重价为 8
        }
        if (md >= 10 && md <= 12)//如果目的地为 湖北 湖南 河南
        {
            szj = 18;
            xzj = 8;
        }
        if (md >= 13 && md <= 20) // 北京 天津 河北 黑龙江 吉林 辽宁 山东 山西
        {
            szj = 18;
            xzj = 10;
        }
        if (md >= 21 && md <= 24)//四川 重庆 云南 贵州
        {
            szj = 18;
            xzj = 12;
        }
        if (md >= 25 && md <= 28)//陕西 甘肃 宁夏 青海
        {
            szj = 18;
            xzj = 8;
        }
        if (md == 29)//内蒙古
        {
            szj = 20;
            xzj = 16;
        }
        if (md == 30)//新疆
        {
            szj = 20;
            xzj = 16;
        }
        if (md == 31)//西藏
        {
            szj = 20;
            xzj = 16;
        }
    }//第一大区价格
    if (sd >= 5 && sd <= 9)//始发地：
    {
        if (md >= 1 && md <= 4) {
            szj = 18;
            xzj = 8;
        }
        if (md >= 5 && md <= 9) {
            szj = 18;
            xzj = 8;
        }
        if (md >= 10 && md <= 12) {
            szj = 18;
            xzj = 8;
        }
        if (md >= 13 && md <= 20) {
            szj = 18;
            xzj = 10;
        }
        if (md >= 21 && md <= 24) {
            szj = 18;
            xzj = 12;
        }
        if (md >= 25 && md <= 28) {
            szj = 18;
            xzj = 12;
        }
        if (md == 29) {
            szj = 20;
            xzj = 16;
        }
        if (md == 30) {
            szj = 20;
            xzj = 16;
        }
        if (md == 31) {
            szj = 20;
            xzj = 16;
        }
    }//第二大区价格
    if (sd >= 10 && sd <= 12) {
        if (md >= 1 && md <= 4) {
            szj = 18;
            xzj = 8;
        }
        if (md >= 5 && md <= 9) {
            szj = 18;
            xzj = 10;
        }
        if (md >= 10 && md <= 12) {
            szj = 16;
            xzj = 6;
        }
        if (md >= 13 && md <= 20) {
            szj = 18;
            xzj = 10;
        }
        if (md >= 21 && md <= 24) {
            szj = 18;
            xzj = 12;
        }
        if (md >= 25 && md <= 28) {
            szj = 18;
            xzj = 12;
        }
        if (md == 29) {
            szj = 20;
            xzj = 16;
        }
        if (md == 30) {
            szj = 20;
            xzj = 16;
        }
        if (md == 31) {
            szj = 20;
            xzj = 16;
        }
    }//第三大区价格
    if (sd >= 13 && sd <= 20) {
        if (md >= 1 && md <= 4) {
            szj = 18;
            xzj = 8;
        }
        if (md >= 5 && md <= 9) {
            szj = 18;
            xzj = 12;
        }
        if (md >= 10 && md <= 12) {
            szj = 18;
            xzj = 8;
        }
        if (md >= 13 && md <= 20) {
            szj = 16;
            xzj = 6;
        }
        if (md >= 21 && md <= 24) {
            szj = 18;
            xzj = 12;
        }
        if (md >= 25 && md <= 28) {
            szj = 18;
            xzj = 10;
        }
        if (md == 29) {
            szj = 18;
            xzj = 12;
        }
        if (md == 30) {
            szj = 20;
            xzj = 16;
        }
        if (md == 31) {
            szj = 20;
            xzj = 16;
        }
    }//第四大区价格
    if (sd >= 21 && sd <= 24) {
        if (md >= 1 && md <= 4) {
            szj = 18;
            xzj = 12;
        }
        if (md >= 5 && md <= 9) {
            szj = 18;
            xzj = 10;
        }
        if (md >= 10 && md <= 12) {
            szj = 18;
            xzj = 12;
        }
        if (md >= 13 && md <= 20) {
            szj = 18;
            xzj = 12;
        }
        if (md >= 21 && md <= 24) {
            szj = 18;
            xzj = 10;
        }
        if (md >= 25 && md <= 28) {
            szj = 18;
            xzj = 12;
        }
        if (md == 29) {
            szj = 20;
            xzj = 16;
        }
        if (md == 30) {
            szj = 20;
            xzj = 16;
        }
        if (md == 31) {
            szj = 20;
            xzj = 16;
        }
    }//第五大区价格
    if (sd >= 25 && sd <= 28) {
        if (md >= 1 && md <= 4) {
            szj = 18;
            xzj = 10;
        }
        if (md >= 5 && md <= 9) {
            szj = 18;
            xzj = 12;
        }
        if (md >= 10 && md <= 12) {
            szj = 18;
            xzj = 8;
        }
        if (md >= 13 && md <= 20) {
            szj = 18;
            xzj = 10;
        }
        if (md >= 21 && md <= 24) {
            szj = 18;
            xzj = 12;
        }
        if (md >= 25 && md <= 28) {
            szj = 18;
            xzj = 8;
        }
        if (md == 29) {
            szj = 18;
            xzj = 12;
        }
        if (md == 30) {
            szj = 18;
            xzj = 12;
        }
        if (md == 31) {
            szj = 20;
            xzj = 16;
        }
    }//第六大区价格
    if (sd == 29) {
        if (md >= 1 && md <= 4) {
            szj = 18;
            xzj = 12;
        }
        if (md >= 5 && md <= 9) {
            szj = 20;
            xzj = 16;
        }
        if (md >= 10 && md <= 12) {
            szj = 18;
            xzj = 10;
        }
        if (md >= 13 && md <= 20) {
            szj = 18;
            xzj = 10;
        }
        if (md >= 21 && md <= 24) {
            szj = 20;
            xzj = 16;
        }
        if (md >= 25 && md <= 28) {
            szj = 18;
            xzj = 12;
        }
        if (md == 29) {
            szj = 18;
            xzj = 10;
        }
        if (md == 30) {
            szj = 20;
            xzj = 16;
        }
        if (md == 31) {
            szj = 20;
            xzj = 16;
        }
    }//内蒙价格
    if (sd == 30) {
        if (md >= 1 && md <= 4) {
            szj = 20;
            xzj = 16;
        }
        if (md >= 5 && md <= 9) {
            szj = 20;
            xzj = 16;
        }
        if (md >= 10 && md <= 12) {
            szj = 20;
            xzj = 16;
        }
        if (md >= 13 && md <= 20) {
            szj = 20;
            xzj = 16;
        }
        if (md >= 21 && md <= 24) {
            szj = 20;
            xzj = 16;
        }
        if (md >= 25 && md <= 28) {
            szj = 18;
            xzj = 12;
        }
        if (md == 29) {
            szj = 20;
            xzj = 16;
        }
        if (md == 30) {
            szj = 18;
            xzj = 10;
        }
        if (md == 31) {
            szj = 20;
            xzj = 16;
        }
    }//新疆价格
    if (sd == 30) {
        szj = 20;
        xzj = 16;

    }//西藏价格
    if (sd <= 29)//非其他大区运费计算
    {
        if (zl > 1) {
            yf = szj + (Math.ceil(zl - 1)) * xzj;
        }
        else {
            yf = szj;
        }

    }
    if (sd >= 29)//其他大区运费计算
    {
        if (zl > 0.5) {
            yf = szj + (Math.ceil((zl - 0.5) / 0.5)) * xzj;
        }
        else {
            yf = szj;
        }

    }

    return yf + '<font style="color: black; font-size: 13px; font-weight: 100;margin-left: 5px;">元人民币</font>';
}

function aa() {
    if (document.frm.tLength.value == '') {
        alert('长度不能为空');
        return false;
    }
    if (document.frm.tWidth.value == '') {
        alert('宽度不能为空');
        return false;
    }
    if (document.frm.tHeight.value == '') {
        alert('高度不能为空');
        return false;
    }
    var air = document.frm.is_air.value;
    var l = document.frm.tLength.value;
    var w = document.frm.tWidth.value;
    var h = document.frm.tHeight.value;
    if (air == 1) {
        var zl = Math.ceil((l * w * h) / 6000);
        document.frm.zl.value = zl;
    }
    else {
        var zl = Math.ceil((l * w * h) / 12000);
        document.frm.zl.value = zl;
    }
}

function check() {
    if (document.frm.sfd.value == 0) {
        alert('请选择始发地');
        return false;
    }
    if (document.frm.mdd.value == 0) {
        alert('请选择目的地');
        return false;
    }
    if (document.frm.zl.value == '') {
        alert('请填写快件重量');
        return false;
    }
    if (document.frm.zl.value == 0) {
        alert('重量不可为0');
        return false;
    }
    document.getElementById('fy').innerHTML = sj(document.frm.sfd.value, document.frm.mdd.value, document.frm.zl.value);
    //alert(document.frm.zl.value);
}
