package cn.ytwy.oa.service.impl;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.List;

import jxl.Workbook;
import jxl.format.Border;
import jxl.format.BorderLineStyle;
import jxl.write.Label;
import jxl.write.WritableCellFormat;
import jxl.write.WritableFont;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;

import org.springframework.stereotype.Service;

import cn.ytwy.oa.entity.Salary;
import cn.ytwy.oa.service.SalaryService;

@Service("salaryService")
public class SalaryServiceImpl extends BaseServiceImpl<Salary> implements
		SalaryService {

	@Override
	public File selectAllCreateXls() {
		// 创建文件
		File xlsFile = new File("feeXls");
		try {
			// 创建输出流
			OutputStream os = new FileOutputStream(xlsFile);
			// 创建工作薄
			WritableWorkbook workbook = Workbook.createWorkbook(os);
			// 创建新的一页
			WritableSheet sheet = workbook.createSheet("工资报表", 0);

			sheet.setColumnView(1, 20);
			sheet.setColumnView(4, 20);

			// titleFormate
			// 生成一个单元格样式控制对象 ,设置字体种类和黑体显示,字体为Arial,字号大小为20
			WritableCellFormat titleFormate = new WritableCellFormat(
					new WritableFont(WritableFont.createFont("宋体"), 20));
			// 单元格中的内容水平方向居中
			titleFormate.setAlignment(jxl.format.Alignment.CENTRE);
			// 单元格的内容垂直方向居中
			titleFormate
					.setVerticalAlignment(jxl.format.VerticalAlignment.CENTRE);

			// title2Formate
			WritableCellFormat title2Formate = new WritableCellFormat(
					new WritableFont(WritableFont.createFont("宋体"), 11));
			title2Formate.setAlignment(jxl.format.Alignment.LEFT);
			title2Formate
					.setVerticalAlignment(jxl.format.VerticalAlignment.CENTRE);
			
			// title3Formate
			WritableCellFormat title3Formate = new WritableCellFormat(
					new WritableFont(WritableFont.createFont("宋体"), 9));
			title3Formate.setAlignment(jxl.format.Alignment.LEFT);
			title3Formate.setVerticalAlignment(jxl.format.VerticalAlignment.CENTRE);

			// cellFormate
			WritableCellFormat cellFormate = new WritableCellFormat(
					new WritableFont(WritableFont.createFont("宋体"), 9));
			cellFormate.setAlignment(jxl.format.Alignment.CENTRE);
			cellFormate
					.setVerticalAlignment(jxl.format.VerticalAlignment.CENTRE);
			cellFormate.setBorder(Border.ALL, BorderLineStyle.THIN);

			//1行
			// 添加合并单元格，第一个参数是起始列，第二个参数是起始行，第三个参数是终止列，第四个参数是终止行
			sheet.mergeCells(0, 0, 20, 0);
			// 设置第一行的高度
			sheet.setRowView(0, 1000, false);
			Label title = new Label(0, 0, "2016年1月银通物业管理有限公司 工资汇总表",
					titleFormate);
			sheet.addCell(title);

			//2行
			sheet.mergeCells(0, 1, 20, 1);
			// 设置第二行的高度
			sheet.setRowView(1, 600);
			Label title2 = new Label(0, 1, "部门：所有部门                                                                                                                                                             时间：2016/1/8", title2Formate);
			sheet.addCell(title2);

			
			//...行
			sheet.setRowView(2, 500);
			sheet.setRowView(3, 500);
			
			sheet.mergeCells(0, 2, 0, 3);
			Label empId = new Label(0, 2, "编号", cellFormate);
			sheet.addCell(empId);

			sheet.mergeCells(1, 2, 1, 3);
			Label salaryBc = new Label(1, 2, "账号", cellFormate);
			sheet.addCell(salaryBc);

			sheet.mergeCells(2, 2, 2, 3);
			Label empJobDetail = new Label(2, 2, "职务", cellFormate);
			sheet.addCell(empJobDetail);

			sheet.mergeCells(3, 2, 3, 3);
			Label empName = new Label(3, 2, "姓名", cellFormate);
			sheet.addCell(empName);

			sheet.mergeCells(4, 2, 4, 3);
			Label empIdcard = new Label(4, 2, "身份证", cellFormate);
			sheet.addCell(empIdcard);

			sheet.mergeCells(5, 2, 5, 3);
			Label salaryAttendance = new Label(5, 2, "本月出勤", cellFormate);
			sheet.addCell(salaryAttendance);

			sheet.mergeCells(6, 2, 6, 3);
			Label salaryTimeIncome = new Label(6, 2, "基本工资", cellFormate);
			sheet.addCell(salaryTimeIncome);

			sheet.mergeCells(7, 2, 7, 3);
			Label salaryDay = new Label(7, 2, "日工资", cellFormate);
			sheet.addCell(salaryDay);

			sheet.mergeCells(8, 2, 8, 3);
			Label salaryAdd = new Label(8, 2, "补工资", cellFormate);
			sheet.addCell(salaryAdd);

			sheet.mergeCells(9, 2, 9, 3);
			Label salaryTimeIncometwo = new Label(9, 2, "计时工资", cellFormate);
			sheet.addCell(salaryTimeIncometwo);

			sheet.mergeCells(10, 2, 10, 3);
			Label salaryFull = new Label(10, 2, "满勤", cellFormate);
			sheet.addCell(salaryFull);

			sheet.mergeCells(11, 2, 12, 2);
			Label getSalaryOverTimeIncome = new Label(11, 2, "加班工资",
					cellFormate);
			sheet.addCell(getSalaryOverTimeIncome);
			Label salaryOvertimeDay = new Label(11, 3, "天数", cellFormate);
			sheet.addCell(salaryOvertimeDay);
			Label salaryOvertimeMoney = new Label(12, 3, "金额", cellFormate);
			sheet.addCell(salaryOvertimeMoney);

			sheet.mergeCells(13, 2, 13, 3);
			Label salarySubsidy = new Label(13, 2, "补助", cellFormate);
			sheet.addCell(salarySubsidy);

			sheet.mergeCells(14, 2, 14, 3);
			Label salaryMeal = new Label(14, 2, "餐补", cellFormate);
			sheet.addCell(salaryMeal);

			sheet.mergeCells(15, 2, 15, 3);
			Label salaryIncome = new Label(15, 2, "应领工资", cellFormate);
			sheet.addCell(salaryIncome);

			sheet.mergeCells(16, 2, 19, 2);
			Label salaryDeduct = new Label(16, 2, "扣款", cellFormate);
			sheet.addCell(salaryDeduct);
			Label salaryDeductPhone = new Label(16, 3, "话费", cellFormate);
			sheet.addCell(salaryDeductPhone);
			Label salaryDeductFine = new Label(17, 3, "罚款", cellFormate);
			sheet.addCell(salaryDeductFine);
			Label salaryDeductTax = new Label(18, 3, "税金", cellFormate);
			sheet.addCell(salaryDeductTax);
			Label salaryDeductInsurance = new Label(19, 3, "保险", cellFormate);
			sheet.addCell(salaryDeductInsurance);

			sheet.mergeCells(20, 2, 20, 3);
			Label salarySum = new Label(20, 2, "实领工资", cellFormate);
			sheet.addCell(salarySum);

			// 循环插入数据
			List<Salary> salarys = salaryMapper.selectAll();
			int i = 4;
			for (Salary salary : salarys) {
				jxl.write.Number empId2 = new jxl.write.Number(0, i, i-3,cellFormate);
				sheet.addCell(empId2);

				Label salaryBc2 = new Label(1, i, salary.getSalaryBc()
						.toString(), cellFormate);
				sheet.addCell(salaryBc2);

				Label empJobDetail2 = new Label(2, i, salary.getEmpJobDetail()
						.toString(), cellFormate);
				sheet.addCell(empJobDetail2);

				Label empName2 = new Label(3, i,
						salary.getEmpName().toString(), cellFormate);
				sheet.addCell(empName2);

				Label empIdcard2 = new Label(4, i, salary.getEmpIdcard()
						.toString(), cellFormate);
				sheet.addCell(empIdcard2);

				jxl.write.Number salaryAttendance2 = new jxl.write.Number(5, i, salary
						.getSalaryAttendance(), cellFormate);
				sheet.addCell(salaryAttendance2);

				jxl.write.Number salaryTimeIncome2 = new jxl.write.Number(6, i, salary
						.getSalaryTimeIncome(), cellFormate);
				sheet.addCell(salaryTimeIncome2);

				jxl.write.Number salaryDay2 = new jxl.write.Number(7, i, salary.getSalaryDay()
						, cellFormate);
				sheet.addCell(salaryDay2);

				jxl.write.Number salaryAdd2 = new jxl.write.Number(8, i, salary.getSalaryAdd()
						, cellFormate);
				sheet.addCell(salaryAdd2);

				jxl.write.Number salaryTimeIncome22 = new jxl.write.Number(9, i, salary
						.getSalaryTimeIncome(), cellFormate);
				sheet.addCell(salaryTimeIncome22);

				jxl.write.Number salaryFull2 = new jxl.write.Number(10, i, salary.getSalaryFull()
						, cellFormate);
				sheet.addCell(salaryFull2);

				jxl.write.Number salaryOvertimeDay2 = new jxl.write.Number(11, i, salary
						.getSalaryOvertimeDay(), cellFormate);
				sheet.addCell(salaryOvertimeDay2);
				jxl.write.Number salaryOvertimeMoney2 = new jxl.write.Number(12, i, salary
						.getSalaryOvertimeMoney(), cellFormate);
				sheet.addCell(salaryOvertimeMoney2);

				jxl.write.Number salarySubsidy2 = new jxl.write.Number(13, i, salary
						.getSalarySubsidy(), cellFormate);
				sheet.addCell(salarySubsidy2);

				jxl.write.Number salaryMeal2 = new jxl.write.Number(14, i, salary.getSalaryMeal()
						, cellFormate);
				sheet.addCell(salaryMeal2);

				jxl.write.Number salaryIncome2 = new jxl.write.Number(15, i, salary.getSalaryIncome()
						, cellFormate);
				sheet.addCell(salaryIncome2);

				jxl.write.Number salaryDeductPhone2 = new jxl.write.Number(16, i, salary
						.getSalaryDeductPhone(), cellFormate);
				sheet.addCell(salaryDeductPhone2);

				jxl.write.Number salaryDeductFine2 = new jxl.write.Number(17, i, salary
						.getSalaryDeductFine(), cellFormate);
				sheet.addCell(salaryDeductFine2);

				jxl.write.Number salaryDeductTax2 = new jxl.write.Number(18, i, salary
						.getSalaryDeductTax(), cellFormate);
				sheet.addCell(salaryDeductTax2);

				jxl.write.Number salaryDeductInsurance2 = new jxl.write.Number(19, i, salary
						.getSalaryDeductInsurance(), cellFormate);
				sheet.addCell(salaryDeductInsurance2);

				jxl.write.Number salarySum2 = new jxl.write.Number(20, i, salary.getSalarySum()
						, cellFormate);
				sheet.addCell(salarySum2);

				i++;
			}
			
			 sheet.mergeCells(0, i+1, 20, i+1);
			// 设置第二行的高度
			sheet.setRowView(i+1, 600);
			Label title3 = new Label(0, i+1, "总经理：               副总经理：                财务总监：               审核：               制表：", title3Formate);
			sheet.addCell(title3);
			
			// 把创建的内容写入到输出流中，并关闭输出流
			workbook.write();
			workbook.close();
			os.close();
		} catch (Exception e) { // TODO Auto-generated catch block
			e.printStackTrace();
		}
		return xlsFile;
	}

}