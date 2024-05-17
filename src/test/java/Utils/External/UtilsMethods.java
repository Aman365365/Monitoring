package Utils.External;


import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.File;
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

public class UtilsMethods {


	public static List<Map<String, Object>> readExcelData(String sheetName, String excelFilePath) throws IOException {
		List<Map<String, Object>> testDataList = new ArrayList<>();
		//String filePath = "C:\\Users\\gurjara\\eclipse-workspace\\WireMock\\src\\test\\java\\Stubbing\\title3.xlsx";

		try (FileInputStream fis = new FileInputStream(new File(excelFilePath));
			 Workbook workbook = new XSSFWorkbook(fis)) {
			Sheet sheet1 = workbook.getSheet(sheetName);


			Sheet sheet = workbook.getSheet(sheetName);
			int rowCount = sheet.getLastRowNum();

			// Find the column index of the "Run" header
			Row headerRow = sheet.getRow(0);
			int runColumnIndex = -1;
			for (int i = 0; i <= headerRow.getLastCellNum(); i++) {
				Cell cell = headerRow.getCell(i);
				if (cell != null && cell.getStringCellValue().equalsIgnoreCase("Run")) {
					runColumnIndex = i;
					break;
				}
			}

			if (runColumnIndex == -1) {
				System.out.println("Header 'Run' not found in the Excel sheet.");
				return testDataList;
			}

			for (int rowNumber = 1; rowNumber <= rowCount; rowNumber++) {
				Row row = sheet.getRow(rowNumber);

				// Check if the "Run" column has the value "yes" to start reading
				Cell runCell = row.getCell(runColumnIndex);
				if (runCell != null && runCell.getStringCellValue().equalsIgnoreCase("yes")) {
					// Start reading the data from this row
					Map<String, Object> testData = new HashMap<>();
					for (int colNumber = 1; colNumber < row.getLastCellNum(); colNumber++) {
						Cell dataCell = row.getCell(colNumber);
						if (dataCell != null) {
							String header = headerRow.getCell(colNumber).getStringCellValue();
							Object value = getStringCellValue(dataCell);
							testData.put(header, value);
						}
					}
					testDataList.add(testData);
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}

		return testDataList;
	}

	public static Object getStringCellValue(Cell cell) {
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


	    public static JsonNode readJsonTemplate(String filePath) throws IOException {
	        // Create an instance of the ObjectMapper from Jackson
	        ObjectMapper objectMapper = new ObjectMapper();
	       // String path = System.getProperty("user.dir");
	       // String filePath = path + "\\src\\test\\java\\Data\\templete.json";

	        FileInputStream fileInputStream = new FileInputStream(filePath);
	        return objectMapper.readTree(fileInputStream);
	    }
	    
	    
  
  


public static List<String> createJsonTemplate(JsonNode jsonTemplate, List<Map<String, Object>> excelData) throws IOException {
   
    String jsonTemplateString = jsonTemplate.toString();

    
    Map<String, String> placeholderMap = new HashMap<>();

    int rowIndex = 0;
    List<String> jsonList = new ArrayList<>();

    for (Map<String, Object> rowData : excelData) {
        for (Map.Entry<String, Object> entry : rowData.entrySet()) {
            String columnName = entry.getKey();
            String placeholder = "{{" + columnName + "}}";
            String actualValue = entry.getValue().toString();
            placeholderMap.put(placeholder, actualValue);
        }

      
        String jsonDataForRow = jsonTemplateString;
        for (Map.Entry<String, String> entry : placeholderMap.entrySet()) {
            jsonDataForRow = jsonDataForRow.replace(entry.getKey(), entry.getValue());
        }

        jsonList.add(jsonDataForRow);

        
        placeholderMap.clear();

       
        rowIndex++;
    }

   
    System.out.println(jsonList);

    return jsonList;
}


}







