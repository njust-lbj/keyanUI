package com.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by zhangyuxuan on 18/4/8.
 */
@Controller
public class pyControl{
    public static String exeCmd(String commandStr) {
        System.out.println(commandStr);
        BufferedReader br = null;
        StringBuilder sb = new StringBuilder();
        try {
            Process p = Runtime.getRuntime().exec(commandStr);
            br = new BufferedReader(new InputStreamReader(p.getInputStream()));
            String line = null;
            while ((line = br.readLine()) != null) {
                sb.append(line + "\n");
            }
            System.out.println(sb.toString());
        } catch (Exception e) {
            e.printStackTrace();
        }
        finally
        {
            if (br != null)
            {
                try {
                    br.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
            return sb.toString();
        }
    }

    @RequestMapping("test1.do")
    public String test10(HttpServletRequest request) throws InterruptedException {
        String path=request.getSession().getServletContext().getRealPath("/");
        //exeCmd("sh /Users/zhangyuxuan/Desktop/recog.sh");
        exeCmd("sh "+path+"python/recog.sh "+path);
        return "test2";
    }

    @RequestMapping("recog.do")
    public String recogImg(HttpServletRequest request) throws InterruptedException{
        System.out.println("分析开始");
        String path=request.getSession().getServletContext().getRealPath("/");
        HttpSession session = request.getSession();
        int page0 = (int)request.getSession(false).getAttribute("page");
        String page = "test_"+page0+".jpg";
        //exeCmd("sh /Users/zhangyuxuan/Desktop/recog.sh");
        String result=exeCmd("python "+path+"python/recog.py "+path+" "+page);
        String[] results = result.split("\n");
        if(results.length >=2) {
            session.setAttribute("type", results[0]);
            session.setAttribute("rate", results[1]);
            session.setAttribute("tag", "1");
        }
        else{
            //exeCmd("sh /Users/zhangyuxuan/Desktop/recog.sh");
            exeCmd("sh "+path+"python/recog.sh "+path);
            result=exeCmd("python "+path+"python/recog.py "+path+" "+page);
            results = result.split("\n");
            session.setAttribute("type", results[0]);
            session.setAttribute("rate", results[1]);
        }
        System.out.println("分析结束");
        return "retrieval";
    }
}
