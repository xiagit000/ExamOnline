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

/**
 * @author peng.xia
 * 
 */
public class RecordStatistics {

    private int total;
    private int choices;
    private int rightOrWrongs;
    private int combinations;

    private int rights;
    private int wrongs;
    private int halfs;
    private int nulls;

    /**
     * @return the total
     */
    public int getTotal() {
        return total;
    }

    /**
     * @param total
     *            the total to set
     */
    public void setTotal(int total) {
        this.total = total;
    }

    /**
     * @return the choices
     */
    public int getChoices() {
        return choices;
    }

    /**
     * @param choices
     *            the choices to set
     */
    public void setChoices(int choices) {
        this.choices = choices;
    }

    /**
     * @return the rightOrWrongs
     */
    public int getRightOrWrongs() {
        return rightOrWrongs;
    }

    /**
     * @param rightOrWrongs
     *            the rightOrWrongs to set
     */
    public void setRightOrWrongs(int rightOrWrongs) {
        this.rightOrWrongs = rightOrWrongs;
    }

    /**
     * @return the combinations
     */
    public int getCombinations() {
        return combinations;
    }

    /**
     * @param combinations
     *            the combinations to set
     */
    public void setCombinations(int combinations) {
        this.combinations = combinations;
    }

    /**
     * @return the rights
     */
    public int getRights() {
        return rights;
    }

    /**
     * @param rights
     *            the rights to set
     */
    public void setRights(int rights) {
        this.rights = rights;
    }

    /**
     * @return the wrongs
     */
    public int getWrongs() {
        return wrongs;
    }

    /**
     * @param wrongs
     *            the wrongs to set
     */
    public void setWrongs(int wrongs) {
        this.wrongs = wrongs;
    }

    /**
     * @return the halfs
     */
    public int getHalfs() {
        return halfs;
    }

    /**
     * @param halfs
     *            the halfs to set
     */
    public void setHalfs(int halfs) {
        this.halfs = halfs;
    }

    /**
     * @return the nulls
     */
    public int getNulls() {
        return nulls;
    }

    /**
     * @param nulls
     *            the nulls to set
     */
    public void setNulls(int nulls) {
        this.nulls = nulls;
    }

}
