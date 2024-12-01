package org.example.assignment6;

import org.example.assignment6.bean.PoolVO;
import org.example.assignment6.dao.PoolDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

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

    @RequestMapping(value="list", method = RequestMethod.GET)
    public String poollist(Model model) {
        model.addAttribute("totalMembers", poolDAO.totalNum());
        model.addAttribute("list", poolDAO.selectAllPool());
        return "list";
    }

    @RequestMapping(value="sort", method = RequestMethod.GET)
    public String poolsort(Model model) {
        model.addAttribute("totalMembers", poolDAO.totalNum());
        model.addAttribute("list", poolDAO.selectAllPoolSortedByName());
        return "list";
    }

    @RequestMapping(value="poolsearch", method = RequestMethod.GET)
    public String poolsearch(@RequestParam("name") String name, Model model) throws SQLException {
        model.addAttribute("totalMembers", poolDAO.totalNum());
        ArrayList<PoolVO> list = poolDAO.selectPoolMemberByName(name);
        model.addAttribute("list", list);
        return "list";
    }




    @RequestMapping(value = "add", method = RequestMethod.GET)
    public String addMember() {
        return "write";
    }

    @RequestMapping(value = "addok", method = RequestMethod.POST)
    public String addOK(PoolVO vo) {

        int i = poolDAO.insertPool(vo);
        if (i == 0)
            System.out.println("Data addition failed");
        else
            System.out.println("Data addition successful");
        return "redirect:/list";
    }

    @RequestMapping(value = "edit/{id}", method = RequestMethod.GET)
    public String editMember(@PathVariable("id") int id, Model model) throws SQLException {
        PoolVO poolVO = poolDAO.selectPoolMemberByID(id);
        model.addAttribute("poolVO", poolVO);
        return "edit";
    }

    @RequestMapping(value = "editok", method = RequestMethod.POST)
    public String editOK(PoolVO vo) {
        int i = poolDAO.updatePool(vo);
        if (i == 0)
            System.out.println("Data update failed");
        else
            System.out.println("Data update successful");
        return "redirect:/list";
    }

    @RequestMapping(value = "view/{id}", method = RequestMethod.GET)
    public String viewMember(@PathVariable("id") int id, Model model) throws SQLException {
        PoolVO poolVO = poolDAO.selectPoolMemberByID(id);
        System.out.println("poolVO: " + poolVO.getId());
        model.addAttribute("poolVO", poolVO);
        return "view";
    }

    @RequestMapping(value = "deleteok/{id}", method = RequestMethod.GET)
    public String deleteOK(@PathVariable("id") int id) throws SQLException {
        int i = poolDAO.deletePool(id);
        if (i == 0)
            System.out.println("Data delete failed");
        else
            System.out.println("Data delete successful");
        return "redirect:/list";
    }
}
