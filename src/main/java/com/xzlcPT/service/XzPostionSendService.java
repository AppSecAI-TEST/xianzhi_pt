package com.xzlcPT.service;

import com.xzlcPT.bean.XzPostionSend;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/7/17.
 */
public interface XzPostionSendService {
    List<XzPostionSend> selSendCountByCorRId(Map map);
}
