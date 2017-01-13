package cn.ytwy.oa.service.impl;

import java.lang.reflect.Field;
import java.lang.reflect.ParameterizedType;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;

import cn.ytwy.oa.dao.BaseMapper;
import cn.ytwy.oa.dao.BuildMapper;
import cn.ytwy.oa.dao.BuyMapper;
import cn.ytwy.oa.dao.EmpMapper;
import cn.ytwy.oa.dao.EmpleaveMapper;
import cn.ytwy.oa.dao.EmployeeMapper;
import cn.ytwy.oa.dao.EntryMapper;
import cn.ytwy.oa.dao.FeeMapper;
import cn.ytwy.oa.dao.GarageMapper;
import cn.ytwy.oa.dao.MaintainMapper;
import cn.ytwy.oa.dao.OwnerMapper;
import cn.ytwy.oa.dao.ParkMapper;
import cn.ytwy.oa.dao.SalaryMapper;
import cn.ytwy.oa.entity.Maintain;
import cn.ytwy.oa.entity.Page;
import cn.ytwy.oa.service.BaseService;
import cn.ytwy.oa.service.OwnerService;

public class BaseServiceImpl<T> implements BaseService<T> {
	protected BaseMapper<T> baseMapper;

	@Autowired
	protected EmployeeMapper employeeMapper;

	@Autowired
	protected EmpMapper empMapper;
	
	@Autowired
	protected OwnerMapper ownerMapper;
	
	@Autowired
	protected BuildMapper buildMapper;
	
	@Autowired
	protected GarageMapper garageMapper;
	
	@Autowired
	protected ParkMapper parkMapper;

	@Autowired
	protected FeeMapper feeMapper;
	
	@Autowired
	protected BuyMapper buyMapper;
	
	@Autowired
	protected MaintainMapper maintainMapper;
	
	@Autowired
	protected EntryMapper entryMapper;
	
	@Autowired
	protected EmpleaveMapper empleaveMapper;
	
	@Autowired
	protected SalaryMapper salaryMapper;
	
	@PostConstruct
	// 在构造方法后，初化前执行
	private void initBaseMapper() throws Exception {
		// 完成以下逻辑，需要对研发本身进行命名与使用规范
		// this关键字指对象本身，这里指的是调用此方法的实现类（子类）
		ParameterizedType type = (ParameterizedType) this.getClass()
				.getGenericSuperclass();
		
		
		// 获取第一个参数的class
		Class clazz = (Class) type.getActualTypeArguments()[0];

		// 转化为属性名（相关的Mapper子类的引用名）Supplier supplierMapper
		String localField = clazz.getSimpleName().substring(0, 1).toLowerCase()
				+ clazz.getSimpleName().substring(1) + "Mapper";
		
		
		// getDeclaredField:可以使用于包括私有、默认、受保护、公共字段，但不包括继承的字段
		Field field = this.getClass().getSuperclass()
				.getDeclaredField(localField);
		Field baseField = this.getClass().getSuperclass()
				.getDeclaredField("baseMapper");

		
		// field.get(this)获取当前this的field字段的值。例如：Supplier对象中，baseMapper所指向的对象为其子类型SupplierMapper对象，子类型对象已被spring实例化于容器中
		baseField.set(this, field.get(this));
	}

	@Override
	public int insert(T entity) throws Exception {
		// TODO Auto-generated method stub
		return baseMapper.insert(entity);
	}

	@Override
	public int update(T entity) throws Exception {
		// TODO Auto-generated method stub
		return baseMapper.update(entity);
	}

	@Override
	public int delete(T entity) throws Exception {
		// TODO Auto-generated method stub
		return baseMapper.delete(entity);
	}

	@Override
	public int deleteList(String[] pks) throws Exception {
		// TODO Auto-generated method stub
		return baseMapper.deleteList(pks);
	}

	@Override
	public T select(T entity) {
		// TODO Auto-generated method stub
		return baseMapper.select(entity);
	}

	@Override
	public Page<T> selectPage(Page<T> page) {
		Integer pageCount = baseMapper.selectPageCount(page);
		
		page.setData(baseMapper.selectPageList(page));
		page.setRecordsTotal(pageCount);
		page.setRecordsFiltered(pageCount);
		
		return page;
	}

	@Override
	public Page<T> selectPageUseDyc(Page<T> page) {
		Integer pageCount = baseMapper.selectPageCountUseDyc(page);
		
		
		page.setData(baseMapper.selectPageListUseDyc(page));
		page.setRecordsTotal(pageCount);
		page.setRecordsFiltered(pageCount);
		
		return page;
	}

}
