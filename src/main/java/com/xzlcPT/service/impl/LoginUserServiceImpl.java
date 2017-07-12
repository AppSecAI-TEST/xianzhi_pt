package com.xzlcPT.service.impl;

import com.github.pagehelper.PageHelper;
import com.util.PageBean;
import com.xzlcPT.bean.XzLogin;
import com.xzlcPT.dao.LoginUserMapper;
import com.xzlcPT.service.LoginUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * ServiceImpl 层 LoginUserServiceImpl
 *
 * @author 王天岳
 * @create 2017/3/30 17:43
 **/
@Service("loginUserService")
public class LoginUserServiceImpl implements LoginUserService {

    @Autowired
    private LoginUserMapper loginUserMapper;
    /**
     *前台方法
     */

    @Override
    public Map sellogin(String username, String passowrd) {
        Map<String,Object> rsMap = new HashMap<>();
        Map<String,Object> srechMap = new HashMap<>();
        srechMap.put("username",username);
        srechMap.put("password",passowrd);
        XzLogin login = loginUserMapper.selNE(srechMap);
        if(login!=null){
            srechMap.put("usertype",login.getLoginType());
            XzLogin theLogin = loginUserMapper.loginNE(srechMap);
            if(theLogin!=null){
                rsMap.put("msg","ok");
                rsMap.put("login",theLogin);
            }else{
                rsMap.put("msg","err");
            }
        }else{
            rsMap.put("msg","miss");
        }
        return rsMap;
    }

    /**
     * 后台方法
     */
    /**
     * 管理员登陆
     */
    @Override
    public XzLogin selAdmin(String username, String passowrd) {
        return null;
    }
    /**
     * 根据条件查询登录信息
     * @param page
     * @param rows
     * @param xzLogin
     * @return
     */
    @Override
    public PageBean<XzLogin> selAllLoginEnd(Integer page,Integer rows,XzLogin xzLogin) {
        PageHelper.startPage(page,rows);
        List<XzLogin> loginList = loginUserMapper.selAllLoginEnd(xzLogin);
        return new PageBean<XzLogin>(loginList);
    }

    /**
     * 根据用户名查询登录信息
     * @param xzLogin
     * @return
     */
    @Override
    public XzLogin selLoginByCountEnd(XzLogin xzLogin) {

        return loginUserMapper.selLoginByCountEnd(xzLogin);
    }

    /**
     * 添加用户信息
     * @param xzLogin
     * @return
     */
    @Override
    public int addLoginEnd(XzLogin xzLogin) {

        return loginUserMapper.addLoginEnd(xzLogin);
    }

    /**
     * 修改用户信息
     * @param xzLogin
     * @return
     */
    @Override
    public int updateLoginEnd(XzLogin xzLogin) {
        return loginUserMapper.updateLoginEnd(xzLogin);
    }

    /**
     * 删除用户信息
     * @param loginID
     * @return
     */
    @Override
    public int deleteLoginEnd(long loginID) {
        return loginUserMapper.deleteLoginEnd(loginID);
    }

    /**
     * 根据ID查询用户信息
     * @param loginID
     * @return
     */
    @Override
    public XzLogin selByLoginIDEnd(Long loginID) {
        XzLogin xzLogin = new XzLogin();
        if(loginUserMapper.selByLoginIDEnd(loginID)!=null){
            return loginUserMapper.selByLoginIDEnd(loginID);
        }
        return xzLogin;
    }


}
