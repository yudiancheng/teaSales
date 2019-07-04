package com.yu.service.impl;

import com.yu.mapper.InvoiceMapper;
import com.yu.pojo.Invoice;
import com.yu.service.InvoiceService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class InvoiceServiceImpl implements InvoiceService {
    @Resource
    InvoiceMapper invoiceMapper;

    /**
     * 插入新的发票
     */
    @Override
    public int insNewInvoiceForUser(Invoice invoice) {
        return invoiceMapper.insNewInvoiceForUser(invoice);
    }
}
