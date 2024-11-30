package org.example.assignment6;

import org.example.assignment6.bean.PoolVO;
import org.example.assignment6.dao.PoolDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class PoolController {

    @Autowired
    PoolDAO poolDAO;

    @RequestMapping("/")
    public String home(Model model) {
        int totalMembers = poolDAO.totalNum();
        model.addAttribute("totalMembers", totalMembers);
        return "index";
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String addMember() {
        return "write";
    }

    @RequestMapping(value = "addok", method = RequestMethod.POST)
    public String addOk(PoolVO vo) {
        int i = poolDAO.insertPool(vo);
        if (i == 0)
            System.out.println("Data addition failed");
        else
            System.out.println("Data addition successful");
        return "redirect:/";
    }
}
