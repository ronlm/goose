package com.scau.excelExport;

import java.util.List;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;

import com.scau.view.goose.TradeGoodView;
/**
 * 导出销售物资记录的excel表格
 * @author jianhao
 *
 */
public class ExportTradeGoodView extends ExcelTemplate<TradeGoodView>{

	public ExportTradeGoodView(String fileName, List<TradeGoodView> contents) {
		super(fileName, contents);
		this.titles = new String[]{"资源名称","农户","单价","数量","单位","总价","时间","备注"};
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
				switch (cellNum) {
				case 0:
					cell.setCellValue(rowIndex);break;
				case 1:
					cell.setCellValue(contents.get(rowIndex - 1).getGoodName());break;
				case 2:
					cell.setCellValue(contents.get(rowIndex - 1).getFarmerName());break;
				case 3:
					cell.setCellValue(contents.get(rowIndex - 1).getUnitPrice());break;
				case 4:
					cell.setCellValue(contents.get(rowIndex - 1).getAmount());break;
				case 5:
					cell.setCellValue(contents.get(rowIndex - 1).getGoodUnit());break;
				case 6:
					cell.setCellValue(contents.get(rowIndex - 1).getAmount()*contents.get(rowIndex - 1).getUnitPrice());break;
				case 7:
					cell.setCellValue(contents.get(rowIndex - 1).getTradeDate());break;
				case 8:
					cell.setCellValue(contents.get(rowIndex - 1).getComments());break;
				default:
					cell.setCellValue("");
					break;
				}
			}
		}
	}

}
