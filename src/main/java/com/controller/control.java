package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by zhangyuxuan on 18/4/8.
 */
@Controller
public class control {
    @RequestMapping("test.do")
    public String test(){
        System.out.print(1);
        return "test";
    }
}
