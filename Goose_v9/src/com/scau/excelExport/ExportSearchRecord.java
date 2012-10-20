package com.scau.excelExport;

import java.util.List;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;

/** 导出记录检索页里返回的结果，包括鹅苗进场，成品鹅回购，成品鹅出售
 * @author jianhao
 *
 */
public class ExportSearchRecord extends ExcelTemplate<String[]>{

	public ExportSearchRecord(String fileName, List<String[]> contents) {
		super(fileName, contents);
		// TODO Auto-generated constructor stub
	}

	@Override
	public void printContent() {
		int totalRowNum = contents.size() + 1;
		this.workbook.setSheetName(0, fileName);
		for (int rowIndex = 1; rowIndex < totalRowNum; rowIndex++) {
			Row row = super.sheet.createRow(rowIndex);
			// 打印表内容行，第一列是序号
			for (int cellNum = 0; cellNum < titles.length + 1; cellNum++) {
				// 主要修改此处，调整每列打印的数据类型，匹配相应的标题
				Cell cell = row.createCell(cellNum);
				if(0 == cellNum){
					//打印记录的序号
					cell.setCellValue(rowIndex);
				}else {
					cell.setCellValue(contents.get(rowIndex - 1)[cellNum-1]);
				}
			}
		}
		
	}

	
	public ExportSearchRecord(String fileName,String[] titles, List<String[]> contents) {
		super(fileName, contents);
		this.titles = titles;
	}
}
