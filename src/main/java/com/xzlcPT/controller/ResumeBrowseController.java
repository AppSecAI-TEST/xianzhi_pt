package com.xzlcPT.controller;/**
 * Created by Administrator on 2017/8/3.
 */

import com.amazonaws.services.dynamodbv2.xspec.M;
import com.util.PageBean;
import com.xzlcPT.bean.XzLogin;
import com.xzlcPT.bean.XzResume;
import com.xzlcPT.bean.XzResumeBrowse;
import com.xzlcPT.service.XzResumeBrowseService;
import com.xzlcPT.service.XzResumeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * @author 甘汝雷
 * @create 2017-08-03 14:41
 **/
@Controller
@RequestMapping("/ResumeBrowse")
@SessionAttributes({"userLogin"})
public class ResumeBrowseController extends BaseController{
    @Autowired
    private XzResumeService resumeService;
    @Autowired
    private XzResumeBrowseService xzResumeBrowseService;
    //查看简历
    @ResponseBody
    @RequestMapping("insert.do")
    public Map insert(XzResumeBrowse xzResumeBrowse){
        Date date=new Date();
        xzResumeBrowse.setBrowseTime(date);
        int i=xzResumeBrowseService.insert(xzResumeBrowse);
        Map map=new HashMap();
        if(i==1){
            map.put("msg","ok");
        }else{
            map.put("msg","err");
        }
        return map;
    }
    //用户查看消息
    @ResponseBody
    @RequestMapping("update.do")
    public Map updateByPrimaryKey(Long browseId){
        int i=xzResumeBrowseService.updateByPrimaryKey(browseId);
        Map map=new HashMap();
        if(i==1){
            map.put("msg","ok");
        }else{
            map.put("msg","err");
        }
        return map;
    }
    //多少人看过我的简历
    @ResponseBody
    @RequestMapping("selCount.do")
    public Map selCountByResumeId(Long resumeId){
        int i=xzResumeBrowseService.selCountByResumeId(resumeId);
        Map map=new HashMap();
        map.put("i",i);
        return map;
    }

    //谁看过我的简历
    @ResponseBody
    @RequestMapping("selWhoSawMe.do")
    public Map selWhoSawMe(@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "5") Integer rows, @ModelAttribute("userLogin")XzLogin login){
        Map map = new HashMap();
        XzResume resume = resumeService.selectByMemberId(login.getMember().getMemberId());
        PageBean<XzResumeBrowse> pageBean = xzResumeBrowseService.selWhoSawMe(page,rows,resume.getResumeId());
        map.put("resumeBrowseList",pageBean.getList());
        map.put("page", pageBean.getPageNum());
        map.put("pages", pageBean.getPages());
        map.put("rows", pageBean.getPageSize());
        map.put("total", pageBean.getTotal());
        return map;
    }

    //修改为已读
    @ResponseBody
    @RequestMapping("updateIsRead.do")
    public Map updateIsRead(Long resumeBrowseId){
        Map map = new HashMap();
        int i = xzResumeBrowseService.updateIsRead(resumeBrowseId);
        if(i==1){
            map.put("msg","ok");
        }else{
            map.put("msg","err");
        }
        return map;
    }

}
