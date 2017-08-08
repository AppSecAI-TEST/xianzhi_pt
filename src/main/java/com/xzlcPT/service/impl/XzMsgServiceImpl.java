package com.xzlcPT.service.impl;

import com.github.pagehelper.PageHelper;
import com.util.PageBean;
import com.xzlcPT.bean.XzMsg;
import com.xzlcPT.dao.XzMsgMapper;
import com.xzlcPT.service.XzMsgService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2017/8/8.
 */
@Service("msgService")
public class XzMsgServiceImpl implements XzMsgService{
    @Autowired
    private XzMsgMapper msgMapper;

    @Override
    public PageBean<XzMsg> selectByReceiveId(int page, int rows, Long msgReceiveId) {
        PageHelper.startPage(page,rows);
        List<XzMsg> msgs = msgMapper.selectByReceiveId(msgReceiveId);
        return new PageBean<>(msgs);
    }
}
