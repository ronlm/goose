package com.scau.util;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;


public class Utils {
	
	/**
	 * 获取当前项目的classpath, A. java项目返回的是..bin目录路径；B. web项目返回的是..WEB-INF/classes目录
	 * getClassPath
	 * @return A. java项目返回的是..bin目录路径；B. web项目返回的是..WEB-INF/classes目录
	 */
	public static String getClassPath() {
		return Utils.class.getResource("/").getPath();
	}

	/**
	 * 返回java代码当前行信息，可用于是打印日志等
	 * getCurrentLineMessage
	 * @param e
	 * @return
	 */
	public static String getCurrentLineMessage(Exception e) {
		StackTraceElement stackTraceElement = e.getStackTrace()[0];
		return stackTraceElement.getClassName() + "." + stackTraceElement.getMethodName() + "  ("
				+ stackTraceElement.getFileName() + ":" + stackTraceElement.getLineNumber() + ")";
	}

	/**
	 * 通过一个实体类名称获取对应数据库中的表名，如NewsType，对应的表名应该为 news_type。
	 * @param entityName
	 * @return 相应的表名或者null
	 */
	public static String getTableNameFromEntityName(String entityName) {
		StringBuffer tableName = null;
		if (null != entityName) {
			tableName = new StringBuffer();
			for (int i = 0, len = entityName.length(); i < len; i++) {
				// 如果遇到大写字母则加下划线，第一个除外
				if ('A' <= entityName.charAt(i) && 'Z' >= entityName.charAt(i)) {
					// 处理大写字母用 +32 转为小写
					if (i != 0) {
						tableName.append("_");
					}
					tableName.append((char) (entityName.charAt(i) + 32));
				} else {
					tableName.append(entityName.charAt(i));
				}

			}
		}
		return tableName.toString();
	}

	/**
	 * 把第一个字母变成大写
	 * @param str
	 * @return
	 */
	public static String upperFirstChar(String str) {
		return str.substring(0, 1).toUpperCase() + str.substring(1);
	}
	
	/**
	 * 把第一个字母变成小写
	 * @param str
	 * @return
	 */
	public static String lowerFirstChar(String str) {
		return str.substring(0, 1).toLowerCase() + str.substring(1);
	}

	/**
	 * 传入Class对象，获得此类的所有设值方法名，返回一个数组
	 * 
	 * @param entityClass
	 * @return
	 * @throws SQLException
	 */
	public static String[] getColumnSetterName(Class entityClass) throws SQLException {
		Field[] field = entityClass.getDeclaredFields();
		String[] columnSetterName = new String[field.length];
		for (int i = 0; i < field.length; i++) {
			columnSetterName[i] = "set" + upperFirstChar(field[i].getName());
		}
		return columnSetterName;
	}

	/**
	 * 传入Class对象，获得此类的所有获值方法名，返回一个数组
	 * 
	 * @param entityClass
	 * @return
	 */
	public static String[] getColumnGetterName(Class entityClass) {
		Field[] field = entityClass.getDeclaredFields();
		String[] columnGetterName = new String[field.length];
		for (int i = 0; i < field.length; i++) {
			columnGetterName[i] = "get" + upperFirstChar(field[i].getName());
		}
		return columnGetterName;
	}

	/**
	 * 判断一个对象的属性值是否全部为空即是否设置了值
	 * isAllAttributeValNull
	 * @param object
	 * @return 全部值为空则返回true, 否则返回false
	 * @throws NoSuchMethodException 
	 * @throws InvocationTargetException 
	 * @throws IllegalAccessException 
	 * @throws SecurityException 
	 * @throws IllegalArgumentException 
	 */
	public static boolean isAllAttributeValNull(Object object) throws IllegalArgumentException, SecurityException, IllegalAccessException, InvocationTargetException, NoSuchMethodException {
		if (null != object) {
			Class entityClass = object.getClass();
			String entityClassName = entityClass.getName(); // 获得实体类名
			String tableName = Utils.getTableNameFromEntityName(entityClassName.substring(entityClassName
					.lastIndexOf('.') + 1));
			Field[] field = entityClass.getDeclaredFields(); // 获取实体类的所有字段
			String[] fieldGetterName = Utils.getColumnGetterName(entityClass); // 获取字段值getter名

			for (int i = 0; i < fieldGetterName.length; i++) {
					if (entityClass.getMethod(fieldGetterName[i]).invoke(object) != null) { // 如果实体对象字段值不为空
						Object value = entityClass.getMethod(fieldGetterName[i]).invoke(object);
						if (null != value) {
							return false;
						}
					}
			}
		}
		return true;
	}

	public static List<Object> setEntityObject(Class entityClass, ResultSet rs, ResultSetMetaData rsMetaData,
			String[] columnSetterName) throws IllegalArgumentException, SecurityException, SQLException,
			IllegalAccessException, InvocationTargetException, NoSuchMethodException,
			InstantiationException {
		List<Object> list = new ArrayList<Object>(); // 存放所有实体对象
		while (rs.next()) { // 根据数据库字段类型调用相应方法获取字段值，并将值放入实体对象
			Object entityObject = entityClass.newInstance(); // 创建一个实体类的对象
			for (int i = 1; i <= rsMetaData.getColumnCount(); i++) { // 调用实体对象的所有setter方法
				if (rsMetaData.getColumnTypeName(i).equals("VARCHAR")) {
					entityClass.getMethod(columnSetterName[i - 1], String.class).invoke(
							entityObject, rs.getString(i));
				} else if (rsMetaData.getColumnTypeName(i).equals("INT")) {
					entityClass.getMethod(columnSetterName[i - 1], Long.class).invoke(entityObject,
							rs.getLong(i));
				} else if (rsMetaData.getColumnTypeName(i).equals("TIMESTAMP")) {
					entityClass.getMethod(columnSetterName[i - 1], Date.class).invoke(entityObject,
							rs.getTimestamp(i));
				} else if (rsMetaData.getColumnTypeName(i).equals("DOUBLE")) {
					entityClass.getMethod(columnSetterName[i - 1], Double.class).invoke(
							entityObject, ((Double) rs.getDouble(i)));
				} else if (rsMetaData.getColumnTypeName(i).equals("DATE")) {
					entityClass.getMethod(columnSetterName[i - 1], java.sql.Date.class).invoke(entityObject,
							rs.getDate(i));
				}
			}
			list.add(entityObject); // 设值后的实体加入集合
		}
		return list;
	}

	public static void main(String[] args) {
		System.out.println(getTableNameFromEntityName("CommUser"));
		// System.out.println(Utils.getTableNameFromEntityName(User.class.getName().substring(User.class.getName().lastIndexOf('.') + 1)));
	}
	/**
	 * 
	 * @param filePath 当前文件路径
	 * @param savePaht	复制后的文件路径
	 * @throws IOException 
	 */
	public static void fileCopy(String filePath,String savePath) throws IOException{
		File sourceFile = new File(filePath);
		File targetFile = new File(savePath);
		BufferedInputStream input = new BufferedInputStream(new FileInputStream(sourceFile));
		BufferedOutputStream output = new BufferedOutputStream(new FileOutputStream(targetFile));
		int r;
		while((r=input.read())!=-1){
			output.write((byte)r);
		}
		input.close();
		output.close();
	}
	public static void fileDelete(String sourcePath){
		File file = new File(sourcePath);
		file.delete();
	}
	
	public static void tempDelete(HttpServletRequest request){
		String realPath =  request.getSession().getServletContext().getRealPath("/");
		String tempPath = realPath + "/upload/temp";
		File tempFiles = new File(tempPath);
		String compareTime = String.valueOf((long)(System.currentTimeMillis())-84600000);
		File[] temps = tempFiles.listFiles();
		for(File file:temps){
				String[] sources = file.getName().split("\\.");
				String source = sources[0];
				if(source.compareTo(compareTime)<0){
					file.delete();
				}
		}
	}

}
