package com.scau.excelExport;

import java.text.DecimalFormat;
import java.util.LinkedList;
import java.util.List;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Workbook;

import com.scau.model.goose.DeadReason;
import com.scau.model.goose.Farm;
import com.scau.model.goose.Farmer;
import com.scau.model.goose.ReceiveGoose;
import com.scau.service.impl.goose.DeadGooseViewService;
import com.scau.service.impl.goose.DeadReasonService;
import com.scau.service.impl.goose.FarmService;
import com.scau.service.impl.goose.FarmerService;
import com.scau.service.impl.goose.ReceiveGooseService;
import com.scau.util.BeansUtil;
import com.scau.view.goose.DeadGooseView;

/**
 * 导出一个鹅苗进场批次里，所有鹅只的死亡统计信息，同时显示该农场的农户和农场相关信息
 * @author jianhao
 *
 */
public class ExportReceiveGooseDeadInfo extends ExcelTemplate<String>{
	private ReceiveGoose receiveGoose;
	
	public ExportReceiveGooseDeadInfo(String fileName, List<String> contents) {
		super(fileName, contents);
	}

	public ExportReceiveGooseDeadInfo(ReceiveGoose receiveGoose) {
		super("", null);
		this.receiveGoose = receiveGoose;
	}
	
	@Override
	public void printContent() {
		FarmerService farmerService = (FarmerService) BeansUtil.get("farmerService");
		FarmService  farmService = (FarmService) BeansUtil.get("farmService");
		ReceiveGooseService receiveGooseService = (ReceiveGooseService) BeansUtil.get("receiveGooseService");
		DeadGooseViewService deadGooseViewService = (DeadGooseViewService) BeansUtil.get("deadGooseViewService");
		DeadReasonService deadReasonService  = (DeadReasonService) BeansUtil.get("deadReasonService");
		
		//该鹅苗进场相关的批次信息，农户信息和农场信息
		receiveGoose = receiveGooseService.get(this.receiveGoose);
		Farm farm = farmService.get(new Farm(),receiveGoose.getFarmId());
		Farmer farmer = farmerService.get(new Farmer(), farm.getFarmerId());
		DeadGooseView deadGooseView = new DeadGooseView();
		deadGooseView.setReceiveId(receiveGoose.getId());
		//死亡的鹅只总数
		int totalDeadGooseAmount = deadGooseViewService.getRecordCount(deadGooseView);
		
		//resultList 是用于打印页面每种死亡原因和相应的数
		List<DeadReasonAndAmount> resultList = new LinkedList<ExportReceiveGooseDeadInfo.DeadReasonAndAmount>();
		for (DeadReason deadReason : deadReasonService.list(new DeadReason())) {
			deadGooseView.setReasonId(deadReason.getId());
			deadGooseView.setReceiveId(receiveGoose.getId());
			int deadNum = deadGooseViewService.getRecordCount(deadGooseView);
			DeadReasonAndAmount tempResult  = new DeadReasonAndAmount();
			if(0 <deadNum){
				//当该死亡原因下有鹅死亡了，才加入列表并显示
				tempResult.setDeadReason(deadReason);
				tempResult.setAmount(deadNum);
				resultList.add(tempResult);
			}
		}
		this.workbook.setSheetName(0, farm.getName() + "_" + receiveGoose.getReceiveDate() + "进场批次死亡统计表");
		
		//第一行打印农户相关信息
		Row row = super.sheet.createRow(0);
		Cell cell = row.createCell(0);
		cell.setCellValue("农户名:");
		cell = row.createCell(1);
		cell.setCellValue(farmer.getName());
		cell = row.createCell(2);
		cell.setCellValue("联系电话:");	
		cell = row.createCell(3);
		cell.setCellValue(farmer.getPhone());
		cell = row.createCell(4);
		cell.setCellValue("农场名:");
		cell = row.createCell(5);
		cell.setCellValue(farm.getName());
		
		//第2行打印农场地址
		row = super.sheet.createRow(1);
		cell = row.createCell(0);
		cell.setCellValue("农场地址:");
		cell = row.createCell(1);
		cell.setCellValue(farm.getAddress());
		
		//第3行打印该个鹅苗进场批次的相关信息
		row = super.sheet.createRow(2);
		cell = row.createCell(0);
		cell.setCellValue("进场日期:");
		cell = row.createCell(1);
		cell.setCellValue(receiveGoose.getReceiveDate());
		cell = row.createCell(2);
		cell.setCellValue("进场数量:");
		cell = row.createCell(3);
		cell.setCellValue(receiveGoose.getAmount());
		//第4行，进场批次的备注信息
		row  = super.sheet.createRow(3);
		cell = row.createCell(0);
		cell.setCellValue("进场批次备注信息:");
		cell = row.createCell(1);
		cell.setCellValue(receiveGoose.getComments());
		
		//第5行打印批次相关死亡的统计信息
		row  = super.sheet.createRow(4);
		cell = row.createCell(0);
		cell.setCellValue("死亡数量");
		cell = row.createCell(1);
		cell.setCellValue(totalDeadGooseAmount);
		cell = row.createCell(2);
		cell.setCellValue("死亡率:");
		cell = row.createCell(3);
		DecimalFormat df = new DecimalFormat("0.0000");//格式化小数，保留死亡率百分数小数点后四位
		cell.setCellValue(df.format((double)totalDeadGooseAmount/receiveGoose.getAmount()*100.000000)+ "%");//以百分数表示，取小数点后三位
		
		//第6行打印批次相关死亡的明细信息的标题
		row  = super.sheet.createRow(5);
		cell = row.createCell(0);
		cell.setCellValue("死亡原因");
		cell = row.createCell(1);
		cell.setCellValue("数量");
		
		
		if(resultList.size() > 0 ){
			// 若有鹅只死亡，从第7行开始打印死亡明细，即每条死亡原因和相应数量
			for (int i = 0; i < resultList.size(); i++) {
				row = super.sheet.createRow(i + 6);
				cell = row.createCell(0);
				cell.setCellValue((i+1) + "." + resultList.get(i).getDeadReason().getReason());
				cell = row.createCell(1);
				cell.setCellValue(resultList.get(i).amount);
			}
		}
		else{
			row  = super.sheet.createRow(6);
			cell = row.createCell(0);
			cell.setCellValue("无");
			cell = row.createCell(1);
			cell.setCellValue("0");
		}
		
	}
	
	/**所有导出数据功能必须要实现的方法
	 * 
	 * @return
	 * @throws Exception
	 */
	public Workbook exportExcel() throws Exception {
		
		// 打印表内容行
		printContent();
		return workbook;
	}

	//内部的数据类，记录同一批次下同一死亡原因的鹅只的数量
	private class DeadReasonAndAmount{
		private DeadReason deadReason;
		private int amount;
		public DeadReason getDeadReason() {
			return deadReason;
		}
		public void setDeadReason(DeadReason deadReason) {
			this.deadReason = deadReason;
		}
		public int getAmount() {
			return amount;
		}
		public void setAmount(int amount) {
			this.amount = amount;
		}
		
	}
	
	
}
