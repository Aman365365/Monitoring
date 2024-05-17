package Utils.External;

import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Akshay
 */
public class ExcelUtility {
    public static List<Map<String, Object>> readExcelData(String excelFilePath) throws IOException {
        List<Map<String, Object>> data = new ArrayList<>();

        try (FileInputStream inputStream = new FileInputStream(excelFilePath);
             Workbook workbook = new XSSFWorkbook(inputStream)) {
            //Read All Sheets
            for (int s = 0; s < workbook.getNumberOfSheets(); s++) {
                Sheet sheet = workbook.getSheetAt(s);
                // Read the header row to get the column names
                Row headerRow = sheet.getRow(0);
                int numColumns = headerRow.getPhysicalNumberOfCells();
                String[] columnNames = new String[numColumns];
                for (int i = 0; i < numColumns; i++) {
                    columnNames[i] = headerRow.getCell(i).getStringCellValue();
                }

                // Convert data rows into a list of maps
                for (int rowIndex = 1; rowIndex <= sheet.getLastRowNum(); rowIndex++) {
                    Row row = sheet.getRow(rowIndex);
                    Map<String, Object> rowData = new HashMap<>();

                    for (int colIndex = 0; colIndex < columnNames.length; colIndex++) {
                        Cell cell = row.getCell(colIndex);
                        String columnName = columnNames[colIndex];
                        Object cellValue = getCellValue(cell);
                        rowData.put(columnName, cellValue);
                    }

                    data.add(rowData);
                }
            }
        }
        return data;
    }
    public static Object getCellValue(Cell cell) {
         if (cell == null) {
            return null;
        }

        CellType cellType = cell.getCellType();
        switch (cellType) {
            case STRING:
                return cell.getStringCellValue();
            case NUMERIC:
                if (DateUtil.isCellDateFormatted(cell)) {
                    return cell.getDateCellValue();
                } else {
                    return cell.getNumericCellValue();
                }
            case BOOLEAN:
                return cell.getBooleanCellValue();
            case FORMULA:
                return cell.getCellFormula();
            default:
                return null;
        }
    }
}
