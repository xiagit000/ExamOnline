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

import java.util.Map;

/**
 * @author peng.xia
 * 
 */
public class RecordAnalysis {

    private Map<String, Double> countPercents;

    private Map<String, Double> rightPercents;

    /**
     * @return the countPercents
     */
    public Map<String, Double> getCountPercents() {
        return countPercents;
    }

    /**
     * @param countPercents
     *            the countPercents to set
     */
    public void setCountPercents(Map<String, Double> countPercents) {
        this.countPercents = countPercents;
    }

    /**
     * @return the rightPercents
     */
    public Map<String, Double> getRightPercents() {
        return rightPercents;
    }

    /**
     * @param rightPercents
     *            the rightPercents to set
     */
    public void setRightPercents(Map<String, Double> rightPercents) {
        this.rightPercents = rightPercents;
    }

}
