package com.yu.service;

import com.yu.pojo.Invoice;

public interface InvoiceService {

    /**
     * 插入新的发票
     */
    public int insNewInvoiceForUser(Invoice invoice);
}
