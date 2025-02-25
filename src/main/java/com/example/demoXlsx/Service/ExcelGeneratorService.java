package com.example.demoXlsx.Service;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.logging.Logger;

@Service
public class ExcelGeneratorService {
    private final Logger LOGGER =Logger.getLogger(String.valueOf(ExcelGeneratorService.class));

    public void generateExcel() {

        LOGGER.info("Inicia EXCEL");
        File archivo = new File("reporte.xlsx");

        Workbook workbook = new XSSFWorkbook();

        Sheet pagina = workbook.createSheet("Pagina 1");

        String titulo = "TITULO - ";
        String dato = " - DATO - ";

        Row fila = pagina.createRow(0);

        for (int i = 0; i < 30; i++) {
            Cell celda = fila.createCell(i);
            celda.setCellValue(titulo + (i+1));
        }

        for (int x = 0; x<50000; x++){
            fila = pagina.createRow(x+1);

            for (int i = 0; i < 30; i++) {
                Cell celda = fila.createCell(i);
                celda.setCellValue("COL - " + (x+1) + dato + (i+1));
            }

        }
        try {
            FileOutputStream salida = new FileOutputStream(archivo);
            workbook.write(salida);
            salida.close();

            LOGGER.info("Termina EXCEL");

        } catch (IOException ex) {
            System.err.println(ex.getMessage());
            ex.printStackTrace();
        }
    }
}
