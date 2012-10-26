package com.scau.excelExport;

import java.util.List;

/**
 * 导出一个鹅苗进场批次里，所有鹅只的死亡统计信息，同时显示该农场的农户和农场相关信息
 * @author jianhao
 *
 */
public class ExportReceiveGooseDeadInfo extends ExcelTemplate<String>{

	public ExportReceiveGooseDeadInfo(String fileName, List<String> contents) {
		super(fileName, contents);
		// TODO Auto-generated constructor stub
	}

	@Override
	public void printContent() {
		// TODO Auto-generated method stub
		
	}

}
