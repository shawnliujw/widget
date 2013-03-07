package com.mpupa.utils;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import jxl.SheetSettings;
import jxl.Workbook;
import jxl.read.biff.BiffException;
import jxl.write.Label;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import jxl.write.WriteException;
import jxl.write.biff.RowsExceededException;

/**
 * @author Steve
 */
public class ExcelUtil {
	private List<String> header;
	private List<List<String>> data;

	private WritableWorkbook workbook;
	private WritableSheet wsheet;

	public ExcelUtil() {
	};

	public ExcelUtil(List<String> header, List<List<String>> data) {
		this.header = header;
		this.data = data;
	}

	public boolean save(File fileName) throws IOException {
		// 创建WorkBook 和 Sheet
		workbook = Workbook.createWorkbook(fileName);
		wsheet = workbook.createSheet("Kraft login_user lists", workbook.getNumberOfSheets());
		// 设置工作表全局设定
		SheetSettings sheetSettings = wsheet.getSettings();
		// sheetSettings.setDefaultRowHeight(500);
		sheetSettings.setFitToPages(true);
		sheetSettings.setDefaultColumnWidth(20);
		sheetSettings.setPrintGridLines(true);
		sheetSettings.setFitWidth(1);
		try {
			// 写入表头
			for (int i = 0; i < this.header.size(); ++i) {
				Label nc = new Label(i, 0, this.header.get(i));
				wsheet.addCell(nc);
			}
			// 加入数据
			for (int i = 0; i < this.data.size(); ++i) {
				for (int j = 0; j < this.data.get(i).size(); ++j) {
					Label nc = new Label(j, i + 2, this.data.get(i).get(j));
					wsheet.addCell(nc);
				}
			}
			workbook.write();
			workbook.close();
		} catch (RowsExceededException e) {
			e.printStackTrace();
			return false;
		} catch (WriteException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	public static void main(String[] args) throws BiffException, IOException,
			RowsExceededException, WriteException {

		// 默认测试数据
		File file = new File("e:/test2.xls");
		List<String> header = new ArrayList<String>();
		header.add("UserName");
		header.add("Login_Date");
		List<List<String>> data = new ArrayList<List<String>>();
		for (int i = 0; i < 10; ++i) {
			List<String> inlist = new ArrayList<String>();
			for (int j = 0; j < 2; ++j) {
				inlist.add("data(" + i + "," + j + ")");
			}
			data.add(inlist);
		}
		ExcelUtil ef = new ExcelUtil(header, data);
		try {
			ef.save(file);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}