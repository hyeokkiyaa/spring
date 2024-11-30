package org.example.assignment6;

import org.example.assignment6.bean.PoolVO;
import org.example.assignment6.dao.PoolDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@Controller
public class PoolController {

    @Autowired
    PoolDAO poolDAO;

    @RequestMapping("/")
    public String home(Model model) {
        String serverTime = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
        model.addAttribute("serverTime", serverTime);
        return "home";
    }

    @RequestMapping(value="/pool/list", method = RequestMethod.GET)
    public String poollist(Model model) {
        model.addAttribute("list", poolDAO.selectAllPool());
        return "list";
    }

    @RequestMapping(value = "/pool/add", method = RequestMethod.GET)
    public String addMember() {
        return "write";
    }

    @RequestMapping(value = "/pool/addok", method = RequestMethod.POST)
    public String addOk(PoolVO vo) {
        int i = poolDAO.insertPool(vo);
        if (i == 0)
            System.out.println("Data addition failed");
        else
            System.out.println("Data addition successful");
        return "redirect:/list";
    }

    /*@RequestMapping(value = "/pool/edit/{id}", method = RequestMethod.GET)
    public String editMember(@PathVariable("id") int id, Model model) throws SQLException {
        PoolVO poolVO = poolDAO.selectPoolMemberByID(id);
    }*/
}
