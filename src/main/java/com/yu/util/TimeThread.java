package com.yu.util;

import java.util.concurrent.Callable;

/**
 * 单例设计模式的倒计时
 */
public class TimeThread implements Callable<Long> {
    private static TimeThread timeThread = new TimeThread();
    private static long time = 60*60*1000;
    private TimeThread() {}
    @Override
    public Long call() throws InterruptedException{
        while(time > 0) {
            time -= 1000;
            Thread.currentThread().sleep(1000);
            return time;
        }
        return time;
    }

    /**
     * 全局访问点
     * @return 表示时间的毫秒数
     */
    public static TimeThread getInstance() {
        return timeThread;
    }
}
