package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by zhangyuxuan on 2018/5/22.
 */
@Controller
public class PageControl {
    @RequestMapping("retrieval.do")
    public String retrieval(HttpServletRequest request){
        HttpSession session = request.getSession(false);
        session.setAttribute("page",1);
        session.setAttribute("pageSource","../recogImages/test_1.jpg");
        String path=request.getSession().getServletContext().getRealPath("/");
        path += "recogImages";
        File file = new File(path);
        if(!file.exists()){
            System.out.println("路径不存在");
        }
        else{
            File[] files=file.listFiles();
            int count = files.length;
            session.setAttribute("pageCount",count);
            List<String> list=new ArrayList<>();
            for(int i=1;i<=count;i++){
                list.add("../recogImages/test_"+i+".jpg");
            }
            session.setAttribute("pages",list);
            System.out.println(list.size());
        }
        return "retrieval";
    }

    @RequestMapping("goFront.do")
    public String gofront(HttpServletRequest request){
        HttpSession session = request.getSession(false);
        int page = (int)session.getAttribute("page");
        if(page > 1) {
            page -= 1;
            String source = "../recogImages/test_" + page + ".jpg";
            session.setAttribute("page", page);
            session.setAttribute("pageSource", source);
            session.setAttribute("type","");
            session.setAttribute("rate","");
        }
        return "retrieval";
    }

    @RequestMapping("goBack.do")
    public String goback(HttpServletRequest request){
        HttpSession session = request.getSession(false);
        int page = (int)session.getAttribute("page");
        int count = (int)session.getAttribute("pageCount");
        if(page < count) {
            page += 1;
            String source = "../recogImages/test_" + page + ".jpg";
            session.setAttribute("page", page);
            session.setAttribute("pageSource", source);
            session.setAttribute("type","");
            session.setAttribute("rate","");
        }
        return "retrieval";
    }
}
