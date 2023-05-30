package com.chixing.controller;


import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.internal.util.AlipaySignature;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import com.chixing.pojo.Myorder;
import com.chixing.pojo.Payment;
import com.chixing.service.IMyorderService;
import com.chixing.service.IPaymentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

@Controller
public class PaymentController {
    @Autowired
    private IPaymentService paymentService;
    @Autowired
    private IMyorderService myorderService;
    //voxetv8296@sandbox.com
        //appid
        private final String APP_ID = "2021000122690104";
        //应用私钥
        private final String APP_PRIVATE_KEY ="MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCxB9lMdjfSXxXfoOwN5g6hIQtp3qPYXKwXTF04eZkp/mE03WkwqwRlxsYHs/ReHRMbux8NW/kVEv2zzWV9vV2jSLDXxtqL51qGQNGE3qEtsDYePFSUsUHQxrF8tvMKrzHsXivWiqydD3le/X6numpagFIbSFKez0M+lx9d0XDvZGvUyCBe2W/ffyU0OLsO+fe0mEnnWXq/DQcjr5cEmHF6doun9UYJBuxmEiZoA9+D/2o7Rg0cQQaxKNdpTHeAIdpuJVO4G+JwYmX+bdkjwJlVupq00aRv63pJb3OHm7/OmnPFpSkaQGv4gT838zk/cM8tGMMncKHOtrokTsBc+D/ZAgMBAAECggEAFIr5n1LUlXftPN8apV498lq4TVfFoZTXb3iwFJ6ftGzNcOoEi948i2bukfRC9izfi8dCCjXTCKwEfrnl/hpcZFdKFjAAKl31dkDNT2LaR0f8b7PGiN6s6YI1FGjSeTntTCV9Zs7+ytcB2ZEHAoWyU8AyRvI0jDM29Wtp+2QTe+P0pFejBAze7LeigMnQl6VahfTh0IhaecRI2XYLt+Ct1ZPi7GJ4LHWuRnpjDxRaqA0lF+1aDAOJsSAdhxhYKRyaZp9tMY6lsGoNiXIx/zMWOmv1T9OQtUXsi+PbVbic75ZZKsvH5E89rjx2UeRh6M/aT5qy0/aMvBwXsF0k5gsMgQKBgQDsnbymViwl3XVfMAFICfdESH/5F4Mcgfjp0UJtH4WY9fL7jIwxx97loN6wio1o3JSd7lwBSPjzFjXcwxoT7263JEilvRZCWPNAxzj0lxqkQ+J+VTJHsQe9u+iAuEMGSU8+/rwjL2l+jShdbPsrq5p9oJCC7hbWh5yvC5ta9kU1UQKBgQC/iH9lk/DQ590p8eTLzfmSn/z9YiCGfo8yKtfmZ6tG/OYby6bdJvBB4CRcmlOh1Ckm8zCaTfXIYcOG+rFjJVwAz5ty3tooyoZoUi3PD0m1dwasqAijpLaAM/j0TidAxKLe1TfnYf+xSGayyebbwEdz3m6EvNsRCXjo6gRg0RtgCQKBgQCGVTsgGDYyPRuAsglYM8g87Qgyi8W07pk5bcNPnqDDaYbMh0uki3uhVIZ5JgAIc4qwav2zARHNOGPV9LIedUWfFitkZQh5HHTl5vUP76WBcsTowkesafYiIsdqJLJwpDgoZIi9VRKIdW1gNRoX/fHUts60dqVioFU1D9rgdoZuMQKBgEaMtMBpue55OZHVs/0OJbvIipuapXhk7cIA3f3UedZwGSJr5U7YpO7e7QXfIqcdSvs54NE1ni7tM+RoOybWAAmcbxnk1F7qGpAalR0L+I6LBT5btrLwXPjkK/NxRiwpQgTqbOkhw9k9XfbFP+/551fausLR/a9M2eiRKoOvAnJhAoGAJpNHsLyMGCHUKQELlraKI/nOk7zmRj4ysUuQ5ApoZ8+olagkabkvUBB1WVoHF/udTle0HmodRO/EDlwlMHPU7mg8kcqMXM0BE7XNdeMrx3oaX2v+tJT9d78rdHBCEbyLcXzgZoODTfvXL/tRi7P743E1qQpOHTdFSSjsJA+U9rk=";
        private final String CHARSET = "UTF-8";
        // 支付宝公钥
        private final String ALIPAY_PUBLIC_KEY ="MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAiAmhNiSOwHVWUCKJvP3+zwGXpKD9AvcvYs1ksMrtI9gM78XW4v21DrKeY4m1ySgJ4kf3KK2ktLHRrr8nrn3YMaA8hs2YCVZvlqEEKIqJb9ZtRkDfju5iMxvIYv46qSJGyUnRLsrbtZapv7VhJhz0inD4jJUBMvyREOddpNjGrKg4nYm/jD6dNikXxUSGr2rw6KvyhfcGq+s9+XvYEkiXS3UZdymI9wzaNkkYv8JbSXoPSxynmOLwuIuAnxjv2QtBUNUBlaoGfneSpcIaT300ivkCLh/k51dIr6jcF+re1bVMYinsVl1sCbiEd6chgJk6t9J4YujwOkUfjgfrXrxAuwIDAQAB";
        //这是沙箱接口路径,正式路径为https://openapi.alipay.com/gateway.do
        private final String GATEWAY_URL ="https://openapi.alipaydev.com/gateway.do";
        private final String FORMAT = "JSON";
        //签名方式
        private final String SIGN_TYPE = "RSA2";
        //支付宝异步通知路径,付款完毕后会异步调用本项目的方法,必须为公网地址
        private final String NOTIFY_URL = "http://bvmnmg.natappfree.cc/miso/pay/notify";
        //支付宝同步通知路径,也就是当付款完毕后跳转本项目的页面,可以不是公网地址
        private final String RETURN_URL = "http://localhost:8080/miso/alipayReturnNotice";
    //必须加ResponseBody注解，否则spring会寻找thymeleaf页面
    @ResponseBody
    @RequestMapping("/pay/alipay")
    public String alipay(Myorder order, HttpSession session) throws AlipayApiException {
        Integer orderId=order.getMyorderId();
        Myorder myorder=myorderService.getById(orderId);
        Integer orderStatus=myorder.getMyorderStatus();
        if (orderStatus==4){
            System.out.println("该订单已取消");
            return "该订单已超时，请重新下订单";
        }
        String houseName=myorder.getHouseName();
        String orderNum=myorder.getMyorderNum();
        //生成订单
        Payment payment=new Payment();
        String payNum=UUID.randomUUID().toString().replace("-","");
        payment.setPayNum(payNum);
        payment.setCustId(myorder.getCustId());
        payment.setMyorderId(myorder.getMyorderId());
        payment.setMyorderNum(myorder.getMyorderNum());
        payment.setPayStatus(0);
        payment.setPayAmount(myorder.getMyorderPrice());
        Float payAmount=payment.getPayAmount();
        payment.setPayCreatetime(LocalDateTime.now());

        //将payment保存至数据库
        paymentService.save(payment);

        //调用封装好的方法（给支付宝接口发送请求）
        return sendRequestToAlipay(orderNum,payAmount,houseName);
    }
    /*
参数1：订单号
参数2：订单金额
参数3：订单名称
 */
    //支付宝官方提供的接口
    private String sendRequestToAlipay(String outTradeNo,Float totalAmount,String subject) throws AlipayApiException {
        //获得初始化的AlipayClient
        AlipayClient alipayClient = new DefaultAlipayClient(GATEWAY_URL,APP_ID,APP_PRIVATE_KEY,FORMAT,CHARSET,ALIPAY_PUBLIC_KEY,SIGN_TYPE);

        //设置请求参数
        AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
        alipayRequest.setReturnUrl(RETURN_URL);
        alipayRequest.setNotifyUrl(NOTIFY_URL);

        //商品描述（可空）
        String body="";
        alipayRequest.setBizContent("{\"out_trade_no\":\"" + outTradeNo + "\","
                + "\"total_amount\":\"" + totalAmount + "\","
                + "\"subject\":\"" + subject + "\","
                + "\"body\":\"" + body + "\","
                + "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");

        //请求
        String result = alipayClient.pageExecute(alipayRequest).getBody();
        return result;
    }
    @GetMapping("alipayReturnNotice")
    @Transactional
    public ModelAndView alipayReturnNotice(HttpServletRequest request) throws UnsupportedEncodingException, AlipayApiException {
        System.out.println("同步请求，支付成功后，支付宝的返回数据是：" + request);

        //商户订单号
        String myorderNum = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"), "UTF-8");
        //支付宝交易号
        String tradeNo = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"), "UTF-8");
        //付款金额
        String payPrice = new String(request.getParameter("total_amount").getBytes("ISO-8859-1"), "UTF-8");

        System.out.println("return myorderNum:" + myorderNum);
        System.out.println("return tradeNo:" + tradeNo);
        System.out.println("return payPrice:" + payPrice);

        Map<String, String> params = new HashMap<>();
        Map<String, String[]> requestParams = request.getParameterMap();
        for (String name : requestParams.keySet()) {
            params.put(name, request.getParameter(name));
            //System.out.println(name + " = " + request.getParameter(name));
        }
        Payment payment=new Payment();
        Myorder myorder=new Myorder();
        // 支付宝验签
        boolean signVerified = AlipaySignature.rsaCheckV1(params, ALIPAY_PUBLIC_KEY, CHARSET, SIGN_TYPE); // 调用SDK验证签名
        if (signVerified) {
            // 验签通过
            System.out.println("交易名称: " + params.get("subject"));
            System.out.println("交易状态: " + params.get("trade_status"));
            System.out.println("支付宝交易凭证号: " + params.get("trade_no"));
            System.out.println("商户订单号: " + params.get("out_trade_no"));
            System.out.println("交易金额: " + params.get("total_amount"));
            System.out.println("买家在支付宝唯一id: " + params.get("buyer_id"));
            System.out.println("买家付款时间: " + params.get("gmt_payment"));
            System.out.println("买家付款金额: " + params.get("buyer_pay_amount"));
            //更新流水信息状态
            QueryWrapper<Payment> wrapper=new QueryWrapper<>();
            wrapper.eq("myorder_num",myorderNum);
            payment=paymentService.getOne(wrapper);
            System.out.println(payment);
            payment.setPayStatus(1);
            payment.setPayTime(LocalDateTime.now());
            String orderNum=payment.getMyorderNum();
            paymentService.updateById(payment);

            QueryWrapper<Myorder> myorderQueryWrapper=new QueryWrapper<>();
            myorderQueryWrapper.eq("myorder_num",orderNum);
            myorder=myorderService.getOne(myorderQueryWrapper);
            myorder.setMyorderStatus(1);
            myorderService.updateById(myorder);
        }

        ModelAndView mav=new ModelAndView();
        mav.addObject("payment",payment);
        mav.addObject("myorder",myorder);
        mav.setViewName("/myorder/paysuccess");
        return mav;
    }
    @PostMapping("/pay/notify")  // 注意这里必须是POST接口
    public String payNotify(HttpServletRequest request) throws Exception {
        /*if (request.getParameter("trade_status").equals("TRADE_SUCCESS")) {
            System.out.println("=========支付宝异步回调========");
            Map<String, String> params = new HashMap<>();
            Map<String, String[]> requestParams = request.getParameterMap();
            for (String name : requestParams.keySet()) {
                params.put(name, request.getParameter(name));
                //System.out.println(name + " = " + request.getParameter(name));
            }

            String paymentNum = params.get("out_trade_no");
            String gmtPayment = params.get("gmt_payment");
            String alipayTradeNo = params.get("trade_no");

            // 支付宝验签
            boolean signVerified = AlipaySignature.rsaCheckV1(params, ALIPAY_PUBLIC_KEY, CHARSET, SIGN_TYPE); // 调用SDK验证签名
            if (signVerified) {
                // 验签通过
                System.out.println("交易名称: " + params.get("subject"));
                System.out.println("交易状态: " + params.get("trade_status"));
                System.out.println("支付宝交易凭证号: " + params.get("trade_no"));
                System.out.println("商户订单号: " + params.get("out_trade_no"));
                System.out.println("交易金额: " + params.get("total_amount"));
                System.out.println("买家在支付宝唯一id: " + params.get("buyer_id"));
                System.out.println("买家付款时间: " + params.get("gmt_payment"));
                System.out.println("买家付款金额: " + params.get("buyer_pay_amount"));
                //更新流水信息状态
                QueryWrapper<Payment> wrapper=new QueryWrapper<>();
                wrapper.eq("pay_num",paymentNum);
                Payment payment=paymentService.getOne(wrapper);
                System.out.println(payment);
                payment.setPayStatus(1);
                payment.setPayTime(LocalDateTime.now());
                String orderNum=payment.getMyorderNum();
                paymentService.updateById(payment);

                QueryWrapper<Myorder> myorderQueryWrapper=new QueryWrapper<>();
                myorderQueryWrapper.eq("myorder_num",orderNum);
                Myorder myorder=myorderService.getOne(myorderQueryWrapper);
                myorder.setMyorderStatus(1);
                myorderService.updateById(myorder);
            }
            return "success";
        }
        return "false";*/
        return "success";
    }

}




