package com.xzlcPT.service;

import com.xzlcPT.bean.XzProjectExp;

import java.util.List;

/**
 * Created by Administrator on 2017/7/10.
 */
public interface XzProjectExpService {
    List<XzProjectExp> selectByResumeId(Long resumeId);
    XzProjectExp selectByProjectExpId(Long projectExpId);
    int insertProjectExp(XzProjectExp projectExp);
    int updateProjectExp(XzProjectExp projectExp);
    int deleteProjectExpById(Long projectExpId);
}
