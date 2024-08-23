package com.spring.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.util.*;
import java.util.*;

@Controller
public class PaymentController extends BaseController{
    /**
     * 处理支付
     * @return String
     */
    @RequestMapping("/payment")
    @ResponseBody
    public String payment()
    {
        String id,biao;
        if(request.getParameter("out_trade_no")!=null)
        {
            String[] out_trade_no = request.getParameter("out_trade_no").split("\\-");
            id = out_trade_no[2];
            biao = out_trade_no[1];

        }else{
            id =request.getParameter("id");
            biao =request.getParameter("biao");
        }

        String sql = "update " + biao + " set iszf='是' where id='" + id + "'";
        Query.execute(sql);
        Map order = Query.make(biao).where("id" , id).find();

                if("xuefeixinxi".equals(biao))
        {
            Query.execute("update xuefeixinxi set jiaofeizhuangtai='已缴费' where id='"+order.get("id")+"'");

Query.execute("update xinsheng set shifouyijiaoxuefei='是' where xuehao='"+order.get("xuehao")+"'");


        }
                if("sushefeiyong".equals(biao))
        {
            Query.execute("update sushefeiyong set jiaofeizhuangtai='已缴费' where id='"+order.get("id")+"'");


Query.execute("update xinsheng set sushejiaofei='是' where xuehao='"+order.get("xuehao")+"'");


        }
        
        if(isAjax()){
            showSuccess("支付成功");
            return "";
        }
        String res = "<script>alert('支付成功!!');opener.location.reload();window.close();</script>";
        return res;
    }
}
