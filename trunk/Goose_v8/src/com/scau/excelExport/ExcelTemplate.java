package com.scau.excelExport;

import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;

public abstract class ExcelTemplate<E> {

	protected String fileName;// 要导出的excel文件名
	protected String[] titles;// 表单标题列内容
	protected List<E> contents;// 表单内容列表
	protected Workbook workbook;// create a new sheet
	protected Sheet sheet;// create a new sheet
	protected CellStyle titleCellStyle;// 表单标题列单元格风格
	protected CellStyle contentCellStyle;// 表单数据列单元格风格
	protected Font titleFont;
	protected Font contentFont;

	// 所有导出数据功能必须要实现的方法
	public Workbook exportExcel() throws Exception {
		int totalRowNum = contents.size() + 1;
		this.workbook.setSheetName(0, fileName);
		for (int rowIndex = 0; rowIndex < totalRowNum; rowIndex++) {
			Row row = sheet.createRow(rowIndex);
			if (0 == rowIndex) {
				// 第一行打印标题行，第一格留空
				for (int i = 0; i <= titles.length; i++) {
					Cell cell = row.createCell(i);
					if (0 == i) {
						cell.setCellValue("序号");
					} else {
						cell.setCellValue(titles[i - 1]);
					}
				}
			} else {
				// 打印表内容行
				printContent();
			}
		}

		return workbook;
	}

	/**
	 * 采用Template模式，这个方式是每个继承类必须实现的打印报表内容的方法
	 */
	public abstract void printContent();
	
	public ExcelTemplate(String fileName, List<E> contents) {
		super();
		this.fileName = fileName;
		this.contents = contents;
		this.workbook = new HSSFWorkbook();
		this.sheet = workbook.createSheet();
		this.titleCellStyle = workbook.createCellStyle();
		this.contentCellStyle = workbook.createCellStyle();
		this.titleFont = workbook.createFont();
		this.contentFont = this.workbook.createFont();
		// 标题字体高度12，黑色arial斜体
		this.titleFont.setFontHeightInPoints((short) 12);
		this.titleFont.setColor(Font.COLOR_NORMAL);
		this.titleFont.setBoldweight(Font.BOLDWEIGHT_BOLD);

		this.titleCellStyle
				.setBottomBorderColor(this.titleCellStyle.BORDER_THICK);
		this.titleCellStyle.setFont(this.titleFont);

		// 设置列表内容字体高度12，黑色arial非斜体
		this.contentFont.setFontHeightInPoints((short) 10);
		this.contentFont.setColor(Font.COLOR_NORMAL);
		this.contentFont.setBoldweight(Font.SS_NONE);
		// this.contentFont.setStrikeout( true );设置字体中间直线贯穿
		this.contentCellStyle.setFont(this.contentFont);
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String[] getTitles() {
		return titles;
	}

	public void setTitles(String[] titles) {
		this.titles = titles;
	}

	public List<E> getContents() {
		return contents;
	}

	public void setContents(List<E> contents) {
		this.contents = contents;
	}

}
