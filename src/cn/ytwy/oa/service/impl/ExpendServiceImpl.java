package cn.ytwy.oa.service.impl;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.List;

import jxl.Workbook;
import jxl.write.Label;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.ytwy.oa.dao.BuyMapper;
import cn.ytwy.oa.dao.SalaryMapper;
import cn.ytwy.oa.entity.Buy;
import cn.ytwy.oa.entity.Fee;
import cn.ytwy.oa.entity.Salary;
import cn.ytwy.oa.service.ExpendService;
import cn.ytwy.oa.tool.Tool;

@Service("expendService")
public class ExpendServiceImpl implements ExpendService {
	
	@Autowired
	protected SalaryMapper salaryMapper;
	
	@Autowired
	protected BuyMapper buyMapper;
	
	/* (non-Javadoc)
	 * @see cn.ytwy.oa.service.ExpendService#selectAllCreateXls()
	 */
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
			WritableSheet sheet = workbook.createSheet("工资支出报表", 0);

			Label salaryId = new Label(0, 0, "编号");
			sheet.addCell(salaryId);
			Label empId = new Label(1, 0, "员工编号");
			sheet.addCell(empId);
			Label empName = new Label(2, 0, "员工姓名");
			sheet.addCell(empName);
			Label salaryBc = new Label(3, 0, "银行卡号");
			sheet.addCell(salaryBc);
			Label sum = new Label(4, 0, "总计");
			sheet.addCell(sum);

			// 循环插入数据
			List<Salary> list = salaryMapper.selectAll();
			int i = 1;
			for (Salary salary : list) {
				Label salaryIdCell = new Label(0, i, salary.getSalaryId().toString());
				sheet.addCell(salaryIdCell);
				Label empIdCell = new Label(1, i, salary.getEmpId().toString());
				sheet.addCell(empIdCell);
				Label empNameCell = new Label(2, i, salary.getEmpName().toString());
				sheet.addCell(empNameCell);
				Label salaryBcCell = new Label(3, i, salary.getSalaryBc().toString());
				sheet.addCell(salaryBcCell);
				Label sumCell = new Label(4, i, (salary.getSalaryIncome() - salary.getSalaryDeduct())+"");
				sheet.addCell(sumCell);
				i++;
			}
			
			// 创建新的二页
			WritableSheet sheet2 = workbook.createSheet("采购支出报表", 1);
			Label buyName = new Label(0, 0, "申请人");
			sheet2.addCell(buyName);
			Label buyItem = new Label(1, 0, "申请物品");
			sheet2.addCell(buyItem);
			Label buyNum = new Label(2, 0, "数量");
			sheet2.addCell(buyNum);
			Label buyUse = new Label(3, 0, "用途");
			sheet2.addCell(buyUse);
			Label buyCoast = new Label(4, 0, "价格");
			sheet2.addCell(buyCoast);
			
			// 循环插入数据
			List<Buy> buys = buyMapper.selectAllFinish();
			int j = 1;
			for (Buy buy : buys) {
				Label buyNameCell = new Label(0, j, buy.getBuyName());
				sheet2.addCell(buyNameCell);
				Label buyItemCell = new Label(1, j, buy.getBuyItem());
				sheet2.addCell(buyItemCell);
				Label buyNumCell = new Label(2, j, buy.getBuyNum().toString());
				sheet2.addCell(buyNumCell);
				Label buyUseCell = new Label(3, j, buy.getBuyUse());
				sheet2.addCell(buyUseCell);
				Label buyCoastCell = new Label(4, j, buy.getBuyCoast().toString());
				sheet2.addCell(buyCoastCell);
				
				j++;
			}
			
			
			// 把创建的内容写入到输出流中，并关闭输出流
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
