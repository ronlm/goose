package com.scau.excelExport;

import java.text.NumberFormat;
import java.util.List;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;

import com.scau.vo.goose.AppearOnMarket;

/** 导出上市统计的excel报表
 * @author jianhao
 *
 */
public class ExportAppearOnMarket extends ExcelTemplate<AppearOnMarket>{

	public ExportAppearOnMarket(String fileName, List<AppearOnMarket> contents) {
		super(fileName, contents);
		this.titles = new String[]{"农户姓名","联系电话","农场名","鹅苗进场日期","进场数量","现存数量","存活率","离90天上市相差天数"};
	}

	@Override
	public void printContent() {
		NumberFormat f=NumberFormat.getInstance();  //创建一个格式化类f
		f.setMaximumFractionDigits(5);    //设置小数位的格式
		String s=f.format(3.1415926);          //格式化数据a,将a格式化为f
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
					cell.setCellValue(rowIndex);
					break;
				case 1:
					cell.setCellValue(contents.get(rowIndex - 1).getFarmer().getName());
					break;
				case 2:
					cell.setCellValue(contents.get(rowIndex - 1).getFarmer().getPhone());
					break;
				case 3:
					cell.setCellValue(contents.get(rowIndex - 1).getMarket().getFarmName());
					break;
				case 4:
					cell.setCellValue(contents.get(rowIndex - 1).getMarket().getReceiveDate().toString());
					break;
				case 5:
					cell.setCellValue(contents.get(rowIndex - 1).getMarket().getAmount());
					break;
				case 6:
					cell.setCellValue(contents.get(rowIndex - 1).getGooseNum());
					break;
				case 7:
					cell.setCellValue(f.format(contents.get(rowIndex - 1).getGooseNum()/contents.get(rowIndex - 1).getGooseNum()));
					break;
				case 8:
					cell.setCellValue(contents.get(rowIndex - 1).getDayTo90());
					break;
				default:
					cell.setCellValue("");
					break;
				}
			}
		}
	
	}

}
