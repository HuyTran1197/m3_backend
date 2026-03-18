package com.example.quy_nhon_trip_2026.controller;

import com.example.quy_nhon_trip_2026.dto.QuyNhonTripDto;
import com.example.quy_nhon_trip_2026.model.Category;
import com.example.quy_nhon_trip_2026.model.QuyNhonTrip;
import com.example.quy_nhon_trip_2026.service.ICategoryService;
import com.example.quy_nhon_trip_2026.service.IQuyNhonTripService;
import com.example.quy_nhon_trip_2026.util.ValidateQuyNhon;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.time.LocalDateTime;


@Controller
@RequestMapping("/trips")
public class QuyNhonTripController {
    @Autowired
    private ICategoryService categoryService;
    @Autowired
    private IQuyNhonTripService quyNhonTripService;



    @GetMapping
    public String showList(@RequestParam(name = "page",defaultValue = "0")int page,
                           @RequestParam(name = "searchName",defaultValue = "")String searchName,
                           @RequestParam(value = "searchStartTime", required = false)
                               @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME)
                               LocalDateTime searchStartTime,

                           @RequestParam(value = "searchEndTime", required = false)
                               @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME)
                               LocalDateTime searchEndTime,
                           @RequestParam(name = "searchCategory",defaultValue = "")String searchCategory,
                           Model model){
        Pageable pageable = PageRequest.of(page,3,Sort.by("start_time").descending());

        Page<QuyNhonTripDto> quyNhonTripPageDto = quyNhonTripService.search(searchName,searchStartTime,searchEndTime,searchCategory,pageable);

        model.addAttribute("quyNhonTripPageDto",quyNhonTripPageDto);
        model.addAttribute("categoryList",categoryService.getList());
        model.addAttribute("searchName",searchName);
        model.addAttribute("searchStartTime",searchStartTime);
        model.addAttribute("searchEndTime",searchEndTime);
        model.addAttribute("searchCategory",searchCategory);
        return "trip/list";
    }

    @GetMapping("/add")
    public String showAdd(Model model){
        model.addAttribute("quyNhonTrip",new QuyNhonTrip());
        model.addAttribute("categoryList",categoryService.getList());
        return "trip/save";
    }
    @PostMapping("/add")
    public String save(@ModelAttribute QuyNhonTrip quyNhonTrip,
                       Model model,
                       BindingResult bindingResult,
                       RedirectAttributes redirectAttributes){
        new ValidateQuyNhon().validate(quyNhonTrip,bindingResult);
        if (bindingResult.hasFieldErrors()){
            model.addAttribute("categoryList",categoryService.getList());
            return "trip/save";
        }
        Category category = categoryService.findById(quyNhonTrip.getCategory().getId());
        quyNhonTrip.setCategory(category);
        boolean isSuccess = quyNhonTripService.save(quyNhonTrip);
        redirectAttributes.addFlashAttribute("mess",isSuccess?"Tạo mới thành công":"Tạo mới không thành công");
        return "redirect:/trips";
    }
}
