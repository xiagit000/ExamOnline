package com.boventech.demo.web;

import org.springframework.core.MethodParameter;
import org.springframework.web.bind.support.WebArgumentResolver;
import org.springframework.web.context.request.NativeWebRequest;

import com.boventech.demo.util.Paging;

public class PagingWebArgumentResolver implements WebArgumentResolver {

    public Object resolveArgument(MethodParameter param, NativeWebRequest req){
        if (param.getParameterType().equals(Paging.class)) {
            String pageNumber = req.getParameter("page");
            if(pageNumber == null){
            	return new Paging(1);
            } else {
            	int page = Integer.parseInt(pageNumber);
            	return new Paging(page); 
            }
            
        }
        return UNRESOLVED;
    }

}
