/*
 * Copyright 2010. 
 * 
 * This document may not be reproduced, distributed or used 
 * in any manner whatsoever without the expressed written 
 * permission of Boventech Corp. 
 * 
 * $Rev: Rev $
 * $Author: Author $
 * $LastChangedDate: LastChangedDate $
 *
 */

package com.boventech.demo.util;

public class Paging {
    
    private static final int PAGE_SIZE = 10;
    private int pageSize = PAGE_SIZE;
    private int page = 1;
    
    public Paging(int page) {
        this(page, PAGE_SIZE);
    }
    
    public Paging(int page, int pageSize) {
        this.page = page;
        this.pageSize = pageSize;
    }
     
     public int getCurrentRows(){
         return (page-1)*pageSize;
     }
     

     public int getPage() {
         return page;
     }

     public int getPageSize() {
         return pageSize;
     }

     public void setPage(int page) {
         this.page = page;
     }

     public void setPageSize(int pageSize) {
         this.pageSize = pageSize;
     }

}
