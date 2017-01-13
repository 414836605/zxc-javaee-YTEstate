package cn.ytwy.oa.service.impl;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

import jxl.Workbook;
import jxl.write.Label;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import jxl.write.WriteException;
import jxl.write.biff.RowsExceededException;

import org.springframework.stereotype.Service;

import cn.ytwy.oa.entity.Fee;
import cn.ytwy.oa.entity.Page;
import cn.ytwy.oa.service.FeeService;
import cn.ytwy.oa.tool.Tool;

@Service("feeService")
public class FeeServiceImpl extends BaseServiceImpl<Fee> implements FeeService {
	@Override
	public Page<Fee> selectPageJointOwner(Page<Fee> page) {
		Integer pageCount = feeMapper.selectPageCountJointOwner(page);
		
		page.setData(feeMapper.selectPageListJointOwner(page));
		page.setRecordsTotal(pageCount);
		page.setRecordsFiltered(pageCount);
		
		/**
		 * 废弃的实现
		List<Map<Object, Object>> returnData = new ArrayList<Map<Object,Object>>();
		
		SimpleDateFormat simpleDateFormat =   new SimpleDateFormat( " yy年MM月dd日 HH:mm " );
		
		List<Map<Object, Object>> feeList = feeMapper.selectPageListJointOwner(page);
		for (Map<Object, Object> feeMap : feeList) {
			feeMap.put("feeId",feeMap.get("fee_id"));
			feeMap.remove("fee_id");
			feeMap.put("ownerId",feeMap.get("owner_id"));
			feeMap.remove("owner_id");
			feeMap.put("feeTime",simpleDateFormat.format(feeMap.get("fee_time")));
			feeMap.remove("fee_time");
			feeMap.put("feeType",feeMap.get("fee_type"));
			feeMap.remove("fee_type");
			feeMap.put("ownerName",feeMap.get("owner_name"));
			feeMap.remove("owner_name");
			
			returnData.add(feeMap);
		}
		
		Integer pageCount = feeMapper.selectPageCountJointOwner(page);
		
		page.setData(returnData);
		page.setRecordsTotal(pageCount);
		page.setRecordsFiltered(pageCount);
		*/
		
		return page;
	}
	
	@Override
	public Page<Fee> selectPageJointOwnerUseDyc(Page<Fee> page) {
		
		Integer pageCount = feeMapper.selectPageCountJointOwnerUseDyc(page);
		
		page.setData(feeMapper.selectPageListJointOwnerUseDyc(page));
		page.setRecordsTotal(pageCount);
		page.setRecordsFiltered(pageCount);
		
		return page;
	}
	
	public Integer pay(Integer id){
		return feeMapper.pay(id);
	}

	@Override
	public File selectAllJointOwnerCreateXls() {
		
		//创建文件
		File xlsFile = new File("feeXls");
		
		try {
			//创建输出流
			OutputStream os = new FileOutputStream(xlsFile);
			//创建工作薄
			WritableWorkbook workbook = Workbook.createWorkbook(os);
			//创建新的一页
			WritableSheet sheet = workbook.createSheet("物业费收入报表",0);
			
			Label feeId = new Label(0,0,"编号");
			sheet.addCell(feeId);
			Label ownerId = new Label(1,0,"业主编号");
			sheet.addCell(ownerId);
			Label ownerName = new Label(2,0,"业主姓名");
			sheet.addCell(ownerName);
			Label feeBuild = new Label(3,0,"楼费");
			sheet.addCell(feeBuild);
			Label feeGarage = new Label(4,0,"车库费");
			sheet.addCell(feeGarage);
			Label feePark = new Label(5,0,"车位费");
			sheet.addCell(feePark);
			Label feeTime = new Label(6,0,"缴费时间");
			sheet.addCell(feeTime);
			Label feeSum = new Label(7,0,"总计");
			sheet.addCell(feeSum);
			
			//循环插入数据
			List<Fee> list = feeMapper.selectAllJointOwnerPayed();
			int i = 1;
			for (Fee fee : list) {
				Label feeIdCell = new Label(0,i,fee.getFeeId().toString());
			    sheet.addCell(feeIdCell);
			    Label ownerIdCell = new Label(1,i,fee.getOwnerId().toString());
			    sheet.addCell(ownerIdCell);
			    Label ownerNameCell = new Label(2,i,fee.getOwnerName().toString());
			    sheet.addCell(ownerNameCell);
			    Label feeBuildCell = new Label(3,i,fee.getFeeBuild().toString());
			    sheet.addCell(feeBuildCell);
			    Label feeGarageCell = new Label(4,i,fee.getFeeGarage().toString());
			    sheet.addCell(feeGarageCell);
			    Label feeParkCell = new Label(5,i,fee.getFeePark().toString());
			    sheet.addCell(feeParkCell);
			    Label feeTimeCell = new Label(6,i,Tool.formatTime(fee.getFeeTime()));
			    sheet.addCell(feeTimeCell);
			    Label feeSumCell = new Label(7,i,fee.getFeeSum().toString());
			    sheet.addCell(feeSumCell);
			    i++;
			}
			
			
			//把创建的内容写入到输出流中，并关闭输出流
			workbook.write();
			workbook.close();
			os.close();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return xlsFile;
	}
}
