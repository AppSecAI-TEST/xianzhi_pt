<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/7/3
  Time: 18:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="age" uri="/xianzhipt/ageTag" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <jsp:include page="distforeEnd.jsp"/>
    <title>职位详情</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/dist/foreEnd3/css/zp_zwxq.css">
    <script src="${pageContext.request.contextPath}/dist/foreEnd3/js/zp_lb.js"></script>
    <script src="http://api.map.baidu.com/api?v=2.0&ak=8VuO5m4tgo3GWNiS6sQaBjNo2lG38D1C" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/dist/foreEnd3/js/mapUtil.js" type="text/javascript"></script>
</head>
<body>
<jsp:include page="headerforeEnd.jsp"/>

<section class="container zp_zwxq_cont">
    <div class="row">
        <div class="col-md-8 zp_zwxq_cont_left">
            <div class="zp_zwxq_cont_left_top">
                <div>
                    <h1>${xzPostion.postionName}</h1>
                    <h3>${xzPostion.company.companyName}</h3>
                    <span class="triangle"></span>
                </div>
            </div>
            <div class="zp_zwxq_cont_left_middle">
                <h3>
                    <c:choose>
                        <c:when test="${xzPostion.postionMm<0}">
                            面议
                        </c:when>
                        <c:when test="${xzPostion.postionMm==xzPostion.postionYm}">
                            ${fn:replace((xzPostion.postionMm*12/10000),".0","")}万
                        </c:when>
                        <c:otherwise>
                            ${fn:replace((xzPostion.postionMm*12/10000),".0","")}万-${fn:replace((xzPostion.postionYm*12/10000),".0","")}万
                        </c:otherwise>
                    </c:choose>
                    <span>72小时反馈</span>
                    <a href="###" class="newtan2">我感兴趣 请联系我</a></h3>
                <p><span>${xzPostion.postionSpace}</span>&nbsp;&nbsp;&nbsp;&nbsp;<span><fmt:formatDate value="${xzPostion.postionTime}" pattern="yyyy-MM-dd"/> </span><a href="" s>收藏</a></p>
                <div><span style="border-left: none">${xzPostion.postionEducation}</span><span>${xzPostion.postionExp}以上经验</span><span>${xzPostion.postionAge}岁</span></div>
            </div>
            <div class="zp_zwxq_cont_left_bottom">
                <c:forEach items="${xzPostion.company.welfares}" var="w1">
                <span class="tag" title="${w1.welfareName}">${w1.welfareName}</span>
                </c:forEach>
            </div>
            <div class="zp_zwxq_cont_left_zwms">
                <h3>职位描述：</h3>
                <div>
                    <textarea cols="110" rows="20" readonly="readonly" style="BORDER-BOTTOM-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-TOP-STYLE: none;overflow-y:hidden;border:0;outline:none;font-size:10pt;">${xzPostion.postionDescription}</textarea>
                </div>
            </div>
            <div class="zp_zwxq_cont_left_qtxx">
                <h3>其他信息：</h3>
                <ul>
                    <li><span>所属部门：</span><label>${xzPostion.postionDepartment}</label></li>
                    <li><span>专业要求：</span><label>${xzPostion.postionSpecialty}</label></li>
                    <li><span>下属人数：</span><label>${xzPostion.peopleNumber}人</label></li>
                </ul>
            </div>
            <div class="zp_zwxq_cont_left_qyjs">
                <h3>企业介绍：</h3>
                <div>
                   ${xzPostion.company.companyIntro}
                    <a href="javascript:;">[展开]</a>
                </div>
            </div>
            <div class="zp_zwxq_cont_left_xq">
                <h3>可能感兴趣的职位：</h3>
                <div>
                    <div>
                        <ul>
                            <c:forEach items="${plist}" var="p1">
                            <li>
                                <p>
                                    <a href="" class="zp_zwxq_a1">${p1.postionName}</a>
                                    <span class="zp_zwxq_span1">${fn:replace((p1.postionMm*12/10000),".0","")}-${fn:replace((p1.postionYm*12/10000),".0","")}万</span>
                                    <a href="" class="zp_zwxq_a2">${p1.company.companyName}</a>
                                </p>
                                <p>
                                    <span class="edu">${p1.postionEducation} |${p1.postionExp}工作经验</span>
                                    <span class="place" title="${p1.postionSpace}">${p1.postionSpace}</span>
                                    <span class="industry" title="房地产开发/建筑/建材/工程">
                                        <c:forEach items="${p1.company.fields}" var="f1">
                                       ${f1.fieldName}/
                                        </c:forEach>
                                            </span>
                                </p>
                            </li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
                <p>
                    <span style="background: #3D9CCC"></span>
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                </p>
                <a href="" class="zp_zwxq_cont_a_left"></a>
                <a href="" class="zp_zwxq_cont_a_right"></a>
            </div>
            <div class="zp_zwxq_cont_left_ss">
                <form action="${pageContext.request.contextPath}/Postion/selPostionIndex.do" method="post">
                    <input type="text" placeholder="搜索其他职位，如：总经理秘书" name="likeStr">
                    <button class="btn btn-primary" type="submit">
                        <span>搜索</span>
                    </button>
                </form>
                <div>
                    <a href="${pageContext.request.contextPath}/Postion/selPostionIndex.do">更多职位</a>
                </div>
            </div>
        </div>
        <div class="col-md-4 zp_zwxq_cont_right">
            <div class="zp_zwxq_cont_right_cont">
                <div class="zp_zwxq_cont_1" style="border: 1px solid #E6E6E6">
                    <div class="zp_zwxq_cont_right_cont_top">
                        <h3>职位发布者</h3>
                        <div>
                            <p><img src="${pageContext.request.contextPath}/dist/foreEnd3/img/zp_zwxq_yhtx.gif" alt=""></p>
                            <p>
                                ${xzPostion.company.companyName}
                            </p>
                            <p>
                                <a class="btn btn-primary"  href="javascript:;">立即沟通</a>
                            </p>
                            <div>
                                <div style="border-right: 1px dotted #d8d8d8;">
                                    <span>100</span>%
                                    <p>应聘查看率</p>
                                </div>
                                <div>
                                    <span>1</span>天
                                    <p>应聘查看用时</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="zp_zwxq_cont_right_cont_middle">
                        <h3>企业简介</h3>
                        <h4>
                            <a href="" class="zp_zwxq_cont_right_cont_middle_a1">  ${xzPostion.company.companyName}</a>
                            <a href="javascript:;" class="btn-attention btn-info btn-attention-add zp_zwxq_cont_right_cont_middle_a2">关注</a>
                        </h4>
                        <ul>
                            <li>
                                <c:forEach items="${xzPostion.company.fields}" var="f1">
                                ${f1.fieldName}/
                                </c:forEach>
                            </li>
                            <li>${xzPostion.company.companyScale}人</li>
                            <li>
                            ${xzPostion.company.companyNature eq 1?"国企":''}
                            ${xzPostion.company.companyNature eq 2?"民营":''}
                            ${xzPostion.company.companyNature eq 3?"外企":''}
                            ${xzPostion.company.companyNature eq 4?"政府":''}
                            </li>
                        </ul>
                        <p>${xzPostion.company.companyCity}</p>
                        <p>${xzPostion.company.companyLocation}</p>
                        <p>${xzPostion.company.companySpace}</p>
                        <div id="zp_zwxq_dt" class="zp_zwxq_dt"></div>
                    </div>
                    <div class="zp_zwxq_cont_right_cont_bottom">
                        <p>
                            该企业其他相似职位
                            <a href="" class="pull-right">更多>></a>
                        </p>
                        <ul>
                            <c:forEach items="${cplist}" var="cp">
                            <li>
                                <a href="${pageContext.request.contextPath}/Postion/selPostionInfo.do?postionId=${cp.postionId}">${cp.postionName}</a>
                                <span class="zp_zwxq_span1">${cp.postionSpace}</span>
                                <span class="zp_zwxq_span2">
                                    <c:choose>
                                        <c:when test="${cp.postionMm<0}">
                                            面议
                                        </c:when>
                                        <c:when test="${cp.postionMm==cp.postionYm}">
                                            ${fn:replace((cp.postionMm*12/10000),".0","")}万
                                        </c:when>
                                        <c:otherwise>
                                            ${fn:replace((cp.postionMm*12/10000),".0","")}万-${fn:replace((cp.postionYm*12/10000),".0","")}万
                                        </c:otherwise>
                                    </c:choose>
                                </span>
                            </li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
                <div class="zp_zwxq_cont_2">
                    <h3>推荐企业</h3>
                    <ul>
                        <li><a href="">武汉新力力创置业有限公司</a></li>
                        <li><a href="">武汉新力力创置业有限公司</a></li>
                        <li><a href="">武汉新力力创置业有限公司</a></li>
                        <li><a href="">武汉新力力创置业有限公司</a></li>
                        <li><a href="">武汉新力力创置业有限公司</a></li>
                        <li><a href="">武汉新力力创置业有限公司</a></li>
                    </ul>
                </div>

            </div>

        </div>
    </div>
</section>


<jsp:include page="behindforeEnd.jsp"/>

<div class="newpop2" role="alert">
    <div class="newpop2_container">
        <div class="allnew2_tan">
            你打我呀打我呀打我呀
        </div>
        <div>
            <button class="all_close2">确定</button>
        </div>
        <a href="###" class="all_close2 tan_close2 fa fa-remove"></a>
    </div>
</div>

<script src="${pageContext.request.contextPath}/dist/foreEnd3/js/tanthree.js"></script>
<script>
    var postion = {};
    postion.container = "zp_zwxq_dt";
    postion.x = '${xzPostion.company.companyX}';
    postion.y = '${xzPostion.company.companyY}';
    console.log(postion);
    var myMap = new myMap(postion);
    $(function () {
        myMap.init();
    })
</script>

</body>
</html>
