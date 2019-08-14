package cn.kxc.ssm.controller;

import cn.kxc.ssm.domain.Product;
import cn.kxc.ssm.service.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/product")
public class ProductController {
    @Autowired//注入service
    private IProductService productService;

    /*@InitBinder
    public void initBinder(webDataBinder binder){
        binder.registerCustomEditor(Date.class,new MyDateEdit("yyyy-MM-dd HH:mm"));
    }*/
    @RequestMapping("save.do")
    public String save(Product product) throws Exception{
        productService.save(product);
        return "redirect:findAll.do";
    }
    /**
     * 查询全部产品 未分页版
     * @return
     * @throws Exception
     */
    @RequestMapping("findAll.do")
    public ModelAndView findAll() throws Exception {
        ModelAndView modelAndView = new ModelAndView();
        List<Product> products = productService.findAll();
        modelAndView.addObject("productList",products);
        modelAndView.setViewName("product-list1");
        return modelAndView;
    }
}
