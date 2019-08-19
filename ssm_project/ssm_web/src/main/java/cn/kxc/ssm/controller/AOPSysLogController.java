package cn.kxc.ssm.controller;

import cn.kxc.ssm.domain.SysLog;
import cn.kxc.ssm.service.IAopSysLogService;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/sysLog")
public class AOPSysLogController {
    @Autowired
    private IAopSysLogService aopSysLogService;

    /**
     * 查询日志信息
     * @return
     */
    @RequestMapping("findAll.do")
    public ModelAndView findAll(@RequestParam(name = "page", required = true, defaultValue = "1") int page, @RequestParam(name = "size", required = true, defaultValue = "10") int size) throws Exception {
        ModelAndView mv = new ModelAndView();
        List<SysLog> sysLogs = aopSysLogService.findAll(page,size);
        PageInfo pageInfo = new PageInfo(sysLogs);
        mv.addObject("pageInfo",pageInfo);
        mv.setViewName("syslog-list");
        return mv;
    }
}
