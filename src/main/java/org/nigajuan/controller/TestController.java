package org.nigajuan.controller;

import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import org.apache.commons.lang.StringUtils;
import org.nigajuan.domain.Comment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.PostConstruct;
import javax.validation.Valid;
import java.io.*;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping(value = "/test")
public class TestController {

    @Autowired
    private Resource jsonResource;

    private JsonElement results;

    @PostConstruct
    public void init() throws IOException {
        InputStream inputStream = jsonResource.getInputStream();
        results = new JsonParser().parse(new InputStreamReader(inputStream , "UTF-8"));
        inputStream.close();
    }


    @RequestMapping(method = RequestMethod.GET, value = "/search")
    public ModelAndView search(String searchQuery) throws Exception {
        Map map = new HashMap();
        if (!StringUtils.isBlank(searchQuery)) {
            map.put("results", results);
        }
        return new ModelAndView("/search", map);
    }


    @RequestMapping(method = RequestMethod.GET, value = "/empty")
    public String empty() throws Exception {
        return "/empty";
    }

    @RequestMapping(method = RequestMethod.GET, value = "/postComment")
    public ModelAndView postComment(@Valid Comment comment, BindingResult result) {
        if (result.hasErrors()) {
            return new ModelAndView("/error");
        }
        return new ModelAndView("/empty");
    }

}
