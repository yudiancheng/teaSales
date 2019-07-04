package com.yu.mapper;

import com.yu.pojo.Invoice;

public interface InvoiceMapper {

    /**
     * 插入新的发票
     */
    public int insNewInvoiceForUser(Invoice invoice);
}

