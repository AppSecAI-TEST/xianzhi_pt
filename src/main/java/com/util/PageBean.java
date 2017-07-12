package com.util;

import com.github.pagehelper.Page;

import java.util.List;

/**
 * Created by Administrator on 2017/3/16.
 */
public class PageBean<T> {
    private List<T> list;
    private long total;
    private int pageNum;
    private int pages;
    private int pageSize;
    private int size;
    public PageBean(List<T> list){
        if(list instanceof Page){
        Page<T> page = (Page<T>) list;
        this.list = page;
        this.total = page.getTotal();//条目
        this.pageNum = page.getPageNum();//页码
        this.pages = page.getPages();//页数
        this.pageSize = page.getPageSize();
        this.size = page.size();
    }
}

    public List<T> getList() {
        return list;
    }

    public void setList(List<T> list) {
        this.list = list;
    }

    public long getTotal() {
        return total;
    }
    public void setTotal(long total) {
        this.total = total;
    }

    public int getPageNum() {
        return pageNum;
    }

    public void setPageNum(int pageNum) {
        this.pageNum = pageNum;
    }

    public int getPages() {
        return pages;
    }

    public void setPages(int pages) {
        this.pages = pages;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }

}
