package com.example.demoXlsx.XlsxController;

import com.example.demoXlsx.Service.ExcelGeneratorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class xlsxController {

    @Autowired
    ExcelGeneratorService excelGeneratorService;

    @GetMapping("/hello")
    public String HelloWorld(){
        return "Hello world";
    }

    @GetMapping("/excel")
    public void excel(){
        excelGeneratorService.generateExcel();
    }
}
