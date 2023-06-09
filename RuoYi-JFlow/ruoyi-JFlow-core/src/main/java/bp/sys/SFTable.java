package bp.sys;

import bp.da.*;
import bp.en.*;
import bp.en.Map;
import bp.web.*;
import bp.difference.*;
import java.util.*;

/** 
 用户自定义表
*/
public class SFTable extends EntityNoName
{

		///#region 数据源属性.
	/** 
	 获得外部数据表
	*/

	public final DataTable GenerHisDataTable() throws Exception {
		return GenerHisDataTable(null);
	}

	public final DataTable GenerHisDataTable(Hashtable ht) throws Exception {
		//创建数据源.
		SFDBSrc src = new SFDBSrc(this.getFK_SFDBSrc());

		///BP类
		if (this.getSrcType() == SrcType.BPClass)
		{
			Entities ens = ClassFactory.GetEns(this.getNo());
			return ens.RetrieveAllToTable();
		}

		///SQL查询.外键表/视图，edited by liuxc,2016-12-29
		if (this.getSrcType() == SrcType.TableOrView)
		{
			String sql = "SELECT " + this.getColumnValue() + " No, " + this.getColumnText() + " Name";
			if (this.getCodeStruct() == CodeStruct.Tree)
			{
				sql += ", " + this.getParentValue() + " ParentNo";
			}

			sql += " FROM " + this.getSrcTable();
			return src.RunSQLReturnTable(sql);
		}

		///动态SQL，edited by liuxc,2016-12-29
		if (this.getSrcType() == SrcType.SQL || this.getSrcType() == SrcType.WebApi)
		{
			String runObj = this.getSelectStatement();

			if (DataType.IsNullOrEmpty(runObj) && this.getSrcType() == SrcType.SQL)
				throw new RuntimeException("@外键类型SQL配置错误," + this.getNo() + " " + this.getName() + " 是一个(SQL)类型(" + this.GetValStrByKey("SrcType") + ")，但是没有配置sql.");

			if (DataType.IsNullOrEmpty(runObj) && this.getSrcType() == SrcType.WebApi)
				throw new RuntimeException("@外键类型WebAPI配置错误," + this.getNo() + " " + this.getName() + " 是一个(WebAPI)类型(" + this.GetValStrByKey("SrcType") + ")，但是没有配置WebAPI.");
			//替换字段值
			runObj = runObj.replace("~", "'");
			runObj = runObj.replace("/#", "+"); //为什么？
			runObj = runObj.replace("/$", "-"); //为什么？
			if (runObj.contains("@WebUser.No"))
				runObj = runObj.replace("@WebUser.No", WebUser.getNo());

			if (runObj.contains("@WebUser.Name"))
				runObj = runObj.replace("@WebUser.Name", WebUser.getName());

			if (runObj.contains("@WebUser.FK_DeptName"))
				runObj = runObj.replace("@WebUser.FK_DeptName", WebUser.getFK_DeptName());

			if (runObj.contains("@WebUser.FK_Dept"))
				runObj = runObj.replace("@WebUser.FK_Dept", WebUser.getFK_Dept());

			if (runObj.contains("@") == true && ht != null)
			{
				for (Object key : ht.keySet())
				{
					if(key ==null)
						continue;
					//值为空或者null不替换
					if (ht.get(key) == null || ht.get(key).equals("") == true)
					{
						continue;
					}

					if (runObj.contains("@" + key))
					{
						runObj = runObj.replace("@" + key, ht.get(key).toString());
					}

					//不包含@则返回SQL语句
					if (runObj.contains("@") == false)
					{
						break;
					}
				}
			}

			if (runObj.contains("@") && SystemConfig.getIsBSsystem() == true)
			{
				/*如果是bs*/
				Enumeration enu = ContextHolderUtils.getRequest().getParameterNames();
				while (enu.hasMoreElements()) {
					// 判断是否有内容，hasNext()
					String key = (String) enu.nextElement();
					if (DataType.IsNullOrEmpty(key))
					{
						continue;
					}
					runObj = runObj.replace("@" + key, ContextHolderUtils.getRequest().getParameter(key));
				}
			}

			if (runObj.contains("@WebApiHost"))//可以替换配置文件中配置的webapi地址
				runObj = runObj.replace("@WebApiHost", SystemConfig.GetValByKey("WebApiHost",""));

			if (runObj.contains("@") == true)
				throw new RuntimeException("@外键类型错误," + runObj + "部分查询条件没有被替换.");

			if(this.getSrcType() == SrcType.SQL){
				DataTable dt = src.RunSQLReturnTable(runObj);
				return dt;
			}
			if(this.getSrcType() == SrcType.WebApi){

				String[] strs = runObj.split("[?]", -1);
				//api接口地址
				String apiHost = strs[0];
				//api参数
				String apiParams = "";
				if(strs.length==2) {
					apiParams = strs[1];
					apiParams = apiParams.replaceAll("=","\":\"");
					apiParams = apiParams.replaceAll("&","\",\"");
					apiParams= "{" + apiParams +"}";
				}
				//执行POST
				String postData = bp.tools.HttpClientUtil.doPostJson(apiHost, apiParams);

				DataTable dt = null;
				try
				{
					dt = bp.tools.Json.ToDataTable(postData);
					return dt;
				}
				catch (Exception ex)
				{
					throw new Exception("设置的WebAPI接口返回的数据出错，请检查接口返回值。");
				}
			}
		}



		///自定义表.
		if (this.getSrcType() == SrcType.CreateTable)
		{
			String sql = "SELECT No, Name FROM " + this.getNo();
			return src.RunSQLReturnTable(sql);
		}

		if (this.getSrcType() == SrcType.SysDict)
		{
			String sql = "SELECT MyPK, BH AS \"No\", Name as \"Name\" FROM Sys_SFTableDtl where FK_SFTable='" + this.getNo() + "'";
			return src.RunSQLReturnTable(sql);
		}


		return null;

	}
	/** 
	 修改外键数据
	 
	 @return 
	*/
	public final void UpdateData(String No, String Name, String FK_SFTable)
	{
		String sql = "";
		if (this.getSrcType() == bp.sys.SrcType.SysDict)
		{
			sql = "update Sys_SFTableDtl set Name = '" + Name + "' where MyPK='" + FK_SFTable + "_" + No + "'";
		}
		else
		{
			sql = "update " + FK_SFTable + " set Name = '" + Name + "' where No = '" + No + "'";
		}
		DBAccess.RunSQL(sql);
	}
	/** 
	 新增外键数据
	 
	 @return 
	*/
	public final void InsertData(String No, String Name, String FK_SFTable)
	{
		String sql = "";
		if (this.getSrcType() == bp.sys.SrcType.SysDict)
		{
			sql = "insert into  Sys_SFTableDtl(MyPK,FK_SFTable,BH,Name) values('" + FK_SFTable + "_" + No + "','" + FK_SFTable + "','" + No + "','" + Name + "')";
		}
		else
		{
			sql = "insert into  " + FK_SFTable + "(No,Name) values('" + No + "','" + Name + "')";
		}
		DBAccess.RunSQL(sql);
	}
	/** 
	 删除外键数据
	 
	 @return 
	*/
	public final void DeleteData(String No, String FK_SFTable)
	{
		String sql = "";
		if (this.getSrcType() == bp.sys.SrcType.SysDict)
		{
			sql = "delete from Sys_SFTableDtl where MyPK='" + FK_SFTable + "_" + No + "'";
		}
		else
		{
			sql = "delete from " + FK_SFTable + " where No = '" + No + "'";
		}
		DBAccess.RunSQL(sql);
	}
	public final String GenerHisJson() throws Exception {
		return bp.tools.Json.ToJson(this.GenerHisDataTable());
	}
	/** 
	 自动生成编号
	 
	 @return 
	*/
	public final String GenerSFTableNewNo()  {
		String table = this.getSrcTable();
		NoGenerModel NoGenerModel = this.getNoGenerModel();
		if (NoGenerModel == NoGenerModel.ByGUID) //编号按guid生成
		{
			String guid = DBAccess.GenerGUID();
			return guid;
		}
		else if (NoGenerModel == NoGenerModel.ByLSH) //编号按流水号生成
		{
			if (this.getSrcType() == SrcType.SysDict) //如果是按系统字典表
			{
				try
				{
					String sql = null;
					String field = "BH";
					switch (this.getEnMap().getEnDBUrl().getDBType())
					{
						case MSSQL:
							sql = "SELECT CONVERT(INT, MAX(CAST(" + field + " as int)) )+1 AS No FROM Sys_SFTableDtl where FK_SFTable='" + table + "'";
							break;
						case PostgreSQL:
						case UX:
							sql = "SELECT to_number( MAX(" + field + ") ,'99999999')+1   FROM Sys_SFTableDtl where FK_SFTable='" + table + "'";
							break;
						case Oracle:
						case KingBaseR3:
						case KingBaseR6:
							sql = "SELECT MAX(" + field + ") +1 AS No FROM Sys_SFTableDtl where FK_SFTable='" + table + "'";
							break;
						case MySQL:
							sql = "SELECT CONVERT(MAX(CAST(" + field + " AS SIGNED INTEGER)),SIGNED) +1 AS No FROM Sys_SFTableDtl where FK_SFTable='" + table + "'";
							break;
						case Informix:
							sql = "SELECT MAX(" + field + ") +1 AS No FROM Sys_SFTableDtl where FK_SFTable='" + table + "'";
							break;
						case Access:
							sql = "SELECT MAX( [" + field + "]) +1 AS  No FROM Sys_SFTableDtl where FK_SFTable='" + table + "'";
							break;
						default:
							throw new RuntimeException("error");
					}
					String str = String.valueOf(DBAccess.RunSQLReturnValInt(sql, 1));
					if (str.equals("0") || str.equals(""))
					{
						str = "1";
					}
					return StringHelper.padLeft(str, 3, '0');
				}
				catch (RuntimeException e)
				{
					return "";
				}
			}

			try
			{
				String sql = null;
				String field = "No";
				switch (this.getEnMap().getEnDBUrl().getDBType())
				{
					case MSSQL:
						sql = "SELECT CONVERT(INT, MAX(CAST(" + field + " as int)) )+1 AS No FROM " + table;
						break;
					case PostgreSQL:
					case UX:
						sql = "SELECT to_number( MAX(" + field + ") ,'99999999')+1   FROM " + table;
						break;
					case Oracle:
					case KingBaseR3:
					case KingBaseR6:
						sql = "SELECT MAX(" + field + ") +1 AS No FROM " + table;
						break;
					case MySQL:
						sql = "SELECT CONVERT(MAX(CAST(" + field + " AS SIGNED INTEGER)),SIGNED) +1 AS No FROM " + table;
						break;
					case Informix:
						sql = "SELECT MAX(" + field + ") +1 AS No FROM " + table;
						break;
					case Access:
						sql = "SELECT MAX( [" + field + "]) +1 AS  No FROM " + table;
						break;
					default:
						throw new RuntimeException("error");
				}
				String str = String.valueOf(DBAccess.RunSQLReturnValInt(sql, 1));
				if (str.equals("0") || str.equals(""))
				{
					str = "1";
				}
				return StringHelper.padLeft(str, 3, '0');
			}
			catch (RuntimeException e2)
			{
				return "";
			}
		}
		else //其他的生成编号默认为空
		{
			return "";
		}
	}
	/** 
	 实例化 WebServices
	 
	 param url WebServices地址
	 param methodname 调用的方法
	 param args 把webservices里需要的参数按顺序放到这个object[]里
	*/
	public final Object InvokeWebService(String url, String methodname, Object[] args)
	{
		return null;
		/* TODO 2019-07-25 为了合并core，注释掉
		            //这里的namespace是需引用的webservices的命名空间，在这里是写死的，大家可以加一个参数从外面传进来。
		            string @namespace = "BP.RefServices";
		            try
		            {
		                if (url.EndsWith(".asmx"))
		                    url += "?wsdl";
		                else if (url.EndsWith(".svc"))
		                    url += "?singleWsdl";

		                //获取WSDL
		                WebClient wc = new WebClient();
		                Stream stream = wc.OpenRead(url);
		                ServiceDescription sd = ServiceDescription.Read(stream);
		                string classname = sd.Services[0].Name;
		                ServiceDescriptionImporter sdi = new ServiceDescriptionImporter();
		                sdi.AddServiceDescription(sd, "", "");
		                CodeNamespace cn = new CodeNamespace(@namespace);

		                //生成客户端代理类代码
		                CodeCompileUnit ccu = new CodeCompileUnit();
		                ccu.Namespaces.Add(cn);
		                sdi.Import(cn, ccu);
		                CSharpCodeProvider csc = new CSharpCodeProvider();
		                ICodeCompiler icc = csc.CreateCompiler();

		                //设定编译参数
		                CompilerParameters cplist = new CompilerParameters();
		                cplist.GenerateExecutable = false;
		                cplist.GenerateInMemory = true;
		                cplist.ReferencedAssemblies.Add("System.dll");
		                cplist.ReferencedAssemblies.Add("System.XML.dll");
		                cplist.ReferencedAssemblies.Add("System.Web.Services.dll");
		                cplist.ReferencedAssemblies.Add("System.Data.dll");

		                //编译代理类
		                CompilerResults cr = icc.CompileAssemblyFromDom(cplist, ccu);
		                if (true == cr.Errors.HasErrors)
		                {
		                    System.Text.StringBuilder sb = new System.Text.StringBuilder();
		                    foreach (System.CodeDom.Compiler.CompilerError ce in cr.Errors)
		                    {
		                        sb.Append(ce.ToString());
		                        sb.Append(System.Environment.NewLine);
		                    }
		                    throw new Exception(sb.ToString());
		                }

		                //生成代理实例，并调用方法
		                System.Reflection.Assembly assembly = cr.CompiledAssembly;
		                Type t = assembly.GetType(@namespace + "." + classname, true, true);
		                object obj = Activator.CreateInstance(t);
		                System.Reflection.MethodInfo mi = t.GetMethod(methodname);

		                return mi.Invoke(obj, args);
		            }
		            catch
		            {
		                return null;
		            }
		*/
	}

		///#endregion


		///#region 链接到其他系统获取数据的属性
	/** 
	 组织编号
	*/
	public final String getOrgNo() 
	{
		return this.GetValStringByKey(SFTableAttr.OrgNo);
	}
	public final void setOrgNo(String value)  
	 {
		this.SetValByKey(SFTableAttr.OrgNo, value);
	}
	/** 
	 数据源
	*/
	public final String getFK_SFDBSrc() 
	{
		return this.GetValStringByKey(SFTableAttr.FK_SFDBSrc);
	}
	public final void setFK_SFDBSrc(String value)  
	 {
		this.SetValByKey(SFTableAttr.FK_SFDBSrc, value);
	}
	public final String getFK_SFDBSrcT() 
	{
		return this.GetValRefTextByKey(SFTableAttr.FK_SFDBSrc);
	}
	/** 
	 数据缓存时间
	*/
	public final String getRootVal() 
	{
		return this.GetValStringByKey(SFTableAttr.RootVal);
	}
	public final void setRootVal(String value)  
	 {
		this.SetValByKey(SFTableAttr.RootVal, value);
	}
	/** 
	 同步间隔
	*/
	public final int getCashMinute() 
	{
		return this.GetValIntByKey(SFTableAttr.CashMinute);
	}
	public final void setCashMinute(int value)  
	 {
		this.SetValByKey(SFTableAttr.CashMinute, value);
	}

	/** 
	 物理表名称
	*/
	public final String getSrcTable()  {
		String str = this.GetValStringByKey(SFTableAttr.SrcTable);
		if (DataType.IsNullOrEmpty(str) == true)
		{
			return this.getNo();
		}
		return str;
	}
	public final void setSrcTable(String value)  
	 {
		this.SetValByKey(SFTableAttr.SrcTable, value);
	}
	/** 
	 值/主键字段名
	*/
	public final String getColumnValue() 
	{
		return this.GetValStringByKey(SFTableAttr.ColumnValue);
	}
	public final void setColumnValue(String value)  
	 {
		this.SetValByKey(SFTableAttr.ColumnValue, value);
	}
	/** 
	 显示字段/显示字段名
	*/
	public final String getColumnText() 
	{
		return this.GetValStringByKey(SFTableAttr.ColumnText);
	}
	public final void setColumnText(String value)  
	 {
		this.SetValByKey(SFTableAttr.ColumnText, value);
	}
	/** 
	 父结点字段名
	*/
	public final String getParentValue() 
	{
		return this.GetValStringByKey(SFTableAttr.ParentValue);
	}
	public final void setParentValue(String value)  
	 {
		this.SetValByKey(SFTableAttr.ParentValue, value);
	}
	/** 
	 查询语句
	*/
	public final String getSelectStatement() 
	{
		return this.GetValStringByKey(SFTableAttr.SelectStatement);
	}
	public final void setSelectStatement(String value)  
	 {
		this.SetValByKey(SFTableAttr.SelectStatement, value);
	}
	/** 
	 加入日期
	*/
	public final String getRDT() 
	{
		return this.GetValStringByKey(SFTableAttr.RDT);
	}
	public final void setRDT(String value)  
	 {
		this.SetValByKey(SFTableAttr.RDT, value);
	}

		///#endregion


		///#region 属性
	/** 
	 是否是类
	*/
	public final boolean isClass()  {
		if (this.getNo().contains("."))
		{
			return true;
		}
		else
		{
			return false;
		}
	}
	/** 
	 是否是树形实体?
	*/
	public final boolean isTree()  {
		if (this.getCodeStruct() == bp.sys.CodeStruct.NoName)
		{
			return false;
		}
		return true;
	}
	/** 
	 数据源类型
	*/
	public final SrcType getSrcType()  {
		if (this.getNo().contains("BP.") == true)
		{
			return SrcType.BPClass;
		}
		else
		{
			SrcType src = SrcType.forValue(this.GetValIntByKey(SFTableAttr.SrcType));
			if (src == bp.sys.SrcType.BPClass)
			{
				return SrcType.CreateTable;
			}
			return src;
		}
	}
	public final void setSrcType(SrcType value)  
	 {
		this.SetValByKey(SFTableAttr.SrcType, value.getValue());
	}
	/** 
	 数据源类型名称
	*/
	public final String getSrcTypeText()  {
		switch (this.getSrcType())
		{
			case TableOrView:
				if (this.isClass())
				{
					return "<img src='/WF/Img/Class.png' width='16px' broder='0' />实体类";
				}
				else
				{
					return "<img src='/WF/Img/Table.gif' width='16px' broder='0' />表/视图";
				}
			case SQL:
				return "<img src='/WF/Img/SQL.png' width='16px' broder='0' />SQL表达式";
			case WebServices:
				return "<img src='/WF/Img/WebServices.gif' width='16px' broder='0' />WebServices";
			case WebApi:
				return "WebApi接口";
			default:
				return "";
		}
	}
	/** 
	 字典表类型
	 <p>0：NoName类型</p>
	 <p>1：NoNameTree类型</p>
	 <p>2：NoName行政区划类型</p>
	*/
	public final CodeStruct getCodeStruct()  {
		return CodeStruct.forValue(this.GetValIntByKey(SFTableAttr.CodeStruct));
	}
	public final void setCodeStruct(CodeStruct value)  
	 {
		this.SetValByKey(SFTableAttr.CodeStruct, value.getValue());
	}
	/** 
	编号生成规则
	*/
	public final NoGenerModel getNoGenerModel()  {
		return NoGenerModel.forValue(this.GetValIntByKey(SFTableAttr.NoGenerModel));
	}
	public final void setNoGenerModel(NoGenerModel value)  
	 {
		this.SetValByKey(SFTableAttr.NoGenerModel, value.getValue());
	}
	/** 
	 编码类型
	*/
	public final String getCodeStructT() 
	{
		return this.GetValRefTextByKey(SFTableAttr.CodeStruct);
	}
	/** 
	 值
	*/
	public final String getFK_Val() 
	{
		return this.GetValStringByKey(SFTableAttr.FK_Val);
	}
	public final void setFK_Val(String value)
	 {
		this.SetValByKey(SFTableAttr.FK_Val, value);
	}
	/** 
	 描述
	*/
	public final String getTableDesc() 
	{
		return this.GetValStringByKey(SFTableAttr.TableDesc);
	}
	public final void setTableDesc(String value)  
	 {
		this.SetValByKey(SFTableAttr.TableDesc, value);
	}
	/** 
	 默认值
	*/
	public final String getDefVal() 
	{
		return this.GetValStringByKey(SFTableAttr.DefVal);
	}
	public final void setDefVal(String value)  
	 {
		this.SetValByKey(SFTableAttr.DefVal, value);
	}
	public final EntitiesNoName getHisEns() throws Exception {
		if (this.isClass())
		{
			EntitiesNoName ens = (EntitiesNoName)ClassFactory.GetEns(this.getNo());
			ens.RetrieveAll();
			return ens;
		}

		GENoNames ges = new GENoNames(this.getNo(), this.getName());
		ges.RetrieveAll();
		return ges;
	}

		///#endregion


		///#region 构造方法
	@Override
	public UAC getHisUAC()  {
		UAC uac = new UAC();
		uac.OpenForSysAdmin();
		return uac;
	}
	/** 
	 用户自定义表
	*/
	public SFTable()  {
	}
	public SFTable(String mypk) throws Exception {
		this.setNo(mypk);
		try
		{
			this.Retrieve();
		}
		catch (RuntimeException ex)
		{
			switch (this.getNo())
			{
				case "BP.Pub.NYs":
					this.setName("年月");
					this.setFK_Val("FK_NY");
					this.Insert();
					break;
				case "BP.Pub.YFs":
					this.setName("月");
					this.setFK_Val("FK_YF");
					this.Insert();
					break;
				case "BP.Pub.Days":
					this.setName("天");
					this.setFK_Val("FK_Day");
					this.Insert();
					break;
				case "BP.Pub.NDs":
					this.setName("年");
					this.setFK_Val("FK_ND");
					this.Insert();
					break;
				default:
					throw new RuntimeException(ex.getMessage());
			}
		}
	}
	/** 
	 EnMap
	*/
	@Override
	public bp.en.Map getEnMap()  {
		if (this.get_enMap() != null)
		{
			return this.get_enMap();
		}
		Map map = new Map("Sys_SFTable", "字典表");

		map.AddTBStringPK(SFTableAttr.No, null, "表英文名称", true, false, 1, 200, 20);
		map.AddTBString(SFTableAttr.Name, null, "表中文名称", true, false, 0, 200, 20);

		map.AddDDLSysEnum(SFTableAttr.SrcType, 0, "数据表类型", true, false, SFTableAttr.SrcType, "@0=本地的类@1=创建表@2=表或视图@3=SQL查询表@4=WebServices@5=微服务Handler外部数据源@6=JavaScript外部数据源@7=系统字典表@8=WebApi接口");

		map.AddDDLSysEnum(SFTableAttr.CodeStruct, 0, "字典表类型", true, false, SFTableAttr.CodeStruct);
		map.AddTBString(SFTableAttr.RootVal, null, "根节点值", false, false, 0, 200, 20);

		map.AddTBString(SFTableAttr.FK_Val, null, "默认创建的字段名", true, false, 0, 200, 20);
		map.AddTBString(SFTableAttr.TableDesc, null, "表描述", true, false, 0, 200, 20);
		map.AddTBString(SFTableAttr.DefVal, null, "默认值", true, false, 0, 200, 20);
		map.AddDDLSysEnum(SFTableAttr.NoGenerModel, 1, "编号生成规则", true, true, SFTableAttr.NoGenerModel, "@0=自定义@1=流水号@2=标签的全拼@3=标签的简拼@4=按GUID生成");
			//数据源.
		map.AddDDLEntities(SFTableAttr.FK_SFDBSrc, "local", "数据源", new bp.sys.SFDBSrcs(), true);

		map.AddTBString(SFTableAttr.SrcTable, null, "数据源表", false, false, 0, 200, 20);
		map.AddTBString(SFTableAttr.ColumnValue, null, "显示的值(编号列)", false, false, 0, 200, 20);
		map.AddTBString(SFTableAttr.ColumnText, null, "显示的文字(名称列)", false, false, 0, 200, 20);
		map.AddTBString(SFTableAttr.ParentValue, null, "父级值(父级列)", false, false, 0, 200, 20);
		map.AddTBString(SFTableAttr.SelectStatement, null, "查询语句", true, false, 0, 1000, 600, true);
		map.AddTBDateTime(SFTableAttr.RDT, null, "加入日期", false, false);


		map.AddTBString(SFTableAttr.OrgNo, null, "组织编号", false, false, 0, 100, 20);

		map.AddTBString(SFTableAttr.AtPara, null, "AtPara", false, false, 0, 50, 20);

		for (int i = 0; i < 50; i++)
		{
			map.AddTBString("BH" + i, null, "编号", true, true, 0, 3, 20);
			map.AddTBString("Name" + i, null, "名称", true, false, 0, 50, 20);
		}
			//查找.
		map.AddSearchAttr(SFTableAttr.FK_SFDBSrc);

		RefMethod rm = new RefMethod();
		rm.Title = "查看数据";
		rm.ClassMethodName = this.toString() + ".DoEdit";
		rm.refMethodType = RefMethodType.RightFrameOpen;
		rm.IsForEns = false;
		map.AddRefMethod(rm);

		rm = new RefMethod();
		rm.Title = "修改属性";
		rm.ClassMethodName = this.toString() + ".DoAttr";
		rm.refMethodType = RefMethodType.RightFrameOpen;
		rm.IsForEns = true;
		map.AddRefMethod(rm);

		rm = new RefMethod();
		rm.Title = "新建字典";
		rm.ClassMethodName = this.toString() + ".DoNew";
		rm.refMethodType = RefMethodType.RightFrameOpen;
		rm.IsForEns = true;
		map.AddRefMethod(rm);


			//rm = new RefMethod();
			//rm.Title = "创建Table向导";
			//rm.ClassMethodName = this.ToString() + ".DoGuide";
			//rm.refMethodType = RefMethodType.RightFrameOpen;
			//rm.IsForEns = false;
			//map.AddRefMethod(rm);

			//rm = new RefMethod();
			//rm.Title = "数据源管理";
			//rm.ClassMethodName = this.ToString() + ".DoMangDBSrc";
			//rm.refMethodType = RefMethodType.RightFrameOpen;
			//rm.IsForEns = false;
			//map.AddRefMethod(rm);

		this.set_enMap(map);
		return this.get_enMap();
	}

		///#endregion

	public final String DoAttr()  {
		return SystemConfig.getCCFlowWebPath() + "WF/Comm/EnOnly.htm?EnName=BP.Sys.SFTable&No=" + this.getNo();
	}
	public final String DoNew()  {
		return SystemConfig.getCCFlowWebPath() + "WF/Admin/FoolFormDesigner/SFTable/Default.htm?DoType=New&FromApp=SL&s=0.3256071044807922";
	}
	/** 
	 数据源管理
	 
	 @return 
	*/
	public final String DoMangDBSrc()  {
		return SystemConfig.getCCFlowWebPath() + "WF/Comm/Sys/SFDBSrcNewGuide.htm";
	}
	/** 
	 创建表向导
	 
	 @return 
	*/
	public final String DoGuide()  {
		return SystemConfig.getCCFlowWebPath() + "WF/Admin/FoolFormDesigner/CreateSFGuide.htm";
	}
	/** 
	 编辑数据
	 
	 @return 
	*/
	public final String DoEdit()  {
		if (this.isClass())
		{

			return SystemConfig.getCCFlowWebPath() + "WF/Comm/Ens.htm?EnsName=" + this.getNo();
		}
		else
		{
			return SystemConfig.getCCFlowWebPath() + "WF/Admin/FoolFormDesigner/SFTableEditData.htm?FK_SFTable=" + this.getNo();
		}
	}
	/** 
	 检查是否有依赖的引用？
	 
	 @return 
	*/
	public final String IsCanDelete() throws Exception {
		MapAttrs mattrs = new MapAttrs();
		mattrs.Retrieve(MapAttrAttr.UIBindKey, this.getNo());
		if (mattrs.size() != 0)
		{
			String err = "";
			for (MapAttr item : mattrs.ToJavaList())
			{
				err += " @ " + item.getMyPK() + " " + item.getName();
			}
			return "err@如下实体字段在引用:" + err + "。您不能删除该表。";
		}
		return null;
	}
	@Override
	protected boolean beforeDelete() throws Exception {
		String delMsg = this.IsCanDelete();
		if (delMsg != null)
		{
			throw new RuntimeException(delMsg);
		}

		return super.beforeDelete();
	}
	@Override
	protected boolean beforeInsert() throws Exception {
		if (SystemConfig.getCCBPMRunModel() != CCBPMRunModel.Single)
		{
			this.setOrgNo(WebUser.getOrgNo());
			this.setNo(this.getOrgNo() + "_" + this.getNo());
		}

		//利用这个时间串进行排序.
		this.setRDT(DataType.getCurrentDateTime());


			///#region  如果是 系统字典表.
		if (this.getSrcType() == bp.sys.SrcType.SysDict && SystemConfig.getCCBPMRunModel() == CCBPMRunModel.SAAS)
		{
			if (this.getCodeStruct() == CodeStruct.NoName)
			{
				SFTableDtl dtl = new SFTableDtl();
				dtl.setMyPK(this.getNo() + "_001");
				dtl.setBH("001");
				dtl.setName("Item1");
				dtl.setFK_SFTable(this.getNo());
				dtl.Insert();

				dtl = new SFTableDtl();
				dtl.setMyPK(this.getNo() + "_002");
				dtl.setBH("002");
				dtl.setName("Item2");
				dtl.setFK_SFTable(this.getNo());
				dtl.Insert();

				dtl = new SFTableDtl();
				dtl.setMyPK(this.getNo() + "_003");
				dtl.setBH("003");
				dtl.setName("Item3");
				dtl.setFK_SFTable(this.getNo());
				dtl.Insert();
			}

			if (this.getCodeStruct() == CodeStruct.Tree)
			{
				SFTableDtl dtl = new SFTableDtl();
				dtl.setMyPK(this.getNo() + "_001");
				dtl.setBH("001");
				dtl.setName("Item1");
				dtl.setFK_SFTable(this.getNo());
				dtl.setParentNo("0");
				dtl.Insert();

				dtl = new SFTableDtl();
				dtl.setMyPK(this.getNo() + "_002");
				dtl.setBH("002");
				dtl.setName("Item2");
				dtl.setFK_SFTable(this.getNo());
				dtl.setParentNo("001");
				dtl.Insert();

				dtl = new SFTableDtl();
				dtl.setMyPK(this.getNo() + "_003");
				dtl.setBH("003");
				dtl.setName("Item3");
				dtl.setFK_SFTable(this.getNo());
				dtl.setParentNo("001");
				dtl.Insert();
			}
		}

			///#endregion  如果是 系统字典表.


			///#region 如果是本地类.
		if (this.getSrcType() == bp.sys.SrcType.BPClass)
		{
			Entities ens = ClassFactory.GetEns(this.getNo());
			Entity en = ens.getGetNewEntity();
			this.setName(en.getEnDesc());

			//检查是否是树结构.
			if (en.getIsTreeEntity() == true)
			{
				this.setCodeStruct(bp.sys.CodeStruct.Tree);
			}
			else
			{
				this.setCodeStruct(bp.sys.CodeStruct.NoName);
			}
		}

			///#endregion 如果是本地类.


			///#region 本地类，物理表..
		if (this.getSrcType() == bp.sys.SrcType.CreateTable)
		{
			if (DBAccess.IsExitsObject(this.getNo()) == true)
			{
				return super.beforeInsert();
				//throw new Exception("err@表名[" + this.No + "]已经存在，请使用其他的表名.");
			}

			String sql = "";
			if (this.getCodeStruct() == bp.sys.CodeStruct.NoName || this.getCodeStruct() == bp.sys.CodeStruct.GradeNoName)
			{
				sql = "CREATE TABLE " + this.getNo() + " (";
				sql += "No varchar(30) NOT NULL,";
				sql += "Name varchar(3900) NULL";
				sql += ")";
			}

			if (this.getCodeStruct() == bp.sys.CodeStruct.Tree)
			{
				sql = "CREATE TABLE " + this.getNo() + " (";
				sql += "No varchar(30) NOT NULL,";
				sql += "Name varchar(3900)  NULL,";
				sql += "ParentNo varchar(3900)  NULL";
				sql += ")";
			}

			this.RunSQL(sql);

			//初始化数据.
			this.InitDataTable();
		}

			///#endregion 如果是本地类.

		return super.beforeInsert();
	}

	@Override
	protected void afterInsert()  throws Exception{
		try
		{
			if (this.getSrcType() == bp.sys.SrcType.TableOrView)
			{
				//暂时这样处理
				String sql = "CREATE VIEW " + this.getNo() + " (";
				sql += "[No],";
				sql += "[Name]";
				sql += (this.getCodeStruct() == bp.sys.CodeStruct.Tree ? ",[ParentNo])" : ")");
				sql += " AS ";
				sql += "SELECT " + this.getColumnValue() + " No," + this.getColumnText() + " Name" + (this.getCodeStruct() == bp.sys.CodeStruct.Tree ? ("," + this.getParentValue() + " ParentNo") : "") + " FROM " + this.getSrcTable() + (DataType.IsNullOrEmpty(this.getSelectStatement()) ? "" : (" WHERE " + this.getSelectStatement()));

				if (SystemConfig.getAppCenterDBType() == DBType.MySQL)
				{
					sql = sql.replace("[", "`").replace("]", "`");
				}
				else
				{
					sql = sql.replace("[", "").replace("]", "");
				}
				this.RunSQL(sql);
			}
		}
		catch (RuntimeException ex)
		{
			//创建视图失败时，删除此记录，并提示错误
			this.DirectDelete();
			throw ex;
		}

		super.afterInsert();
	}

	/** 
	 获得该数据源的数据
	 
	 @return 
	*/
	public final DataTable GenerData_bak()  {
		String sql = "";
		DataTable dt = null;
		if (this.getSrcType() == bp.sys.SrcType.CreateTable)
		{
			sql = "SELECT No,Name FROM " + this.getSrcTable();
			dt = this.RunSQLReturnTable(sql);
		}

		if (this.getSrcType() == bp.sys.SrcType.TableOrView)
		{
			sql = "SELECT No,Name FROM " + this.getSrcTable();
			dt = this.RunSQLReturnTable(sql);
		}

		if (dt == null)
		{
			throw new RuntimeException("@没有判断的数据.");
		}

		dt.Columns.get(0).setColumnName("No");
		dt.Columns.get(1).setColumnName("Name");

		return dt;
	}
	/** 
	 返回json.
	 
	 @return 
	*/
	public final String GenerDataOfJson() throws Exception {
		return bp.tools.Json.ToJson(this.GenerHisDataTable());
	}

	/** 
	 初始化数据.
	*/
	public final void InitDataTable() throws Exception {
		DataTable dt = this.GenerHisDataTable();

		String sql = "";
		if (dt.Rows.size() == 0)
		{
			/*初始化数据.*/
			if (this.getCodeStruct() == bp.sys.CodeStruct.Tree)
			{
				sql = "INSERT INTO " + this.getSrcTable() + " (No,Name,ParentNo) VALUES('1','" + this.getName() + "','0') ";
				this.RunSQL(sql);

				for (int i = 1; i < 4; i++)
				{
					String no = String.valueOf(i);
					no = StringHelper.padLeft(no, 3, '0');

					sql = "INSERT INTO " + this.getSrcTable() + " (No,Name,ParentNo) VALUES('" + no + "','Item" + no + "','1') ";
					this.RunSQL(sql);
				}
			}

			if (this.getCodeStruct() == bp.sys.CodeStruct.NoName)
			{
				for (int i = 1; i < 4; i++)
				{
					String no = String.valueOf(i);
					no = StringHelper.padLeft(no, 3, '0');
					sql = "INSERT INTO " + this.getSrcTable() + " (No,Name) VALUES('" + no + "','Item" + no + "') ";
					this.RunSQL(sql);
				}
			}
		}
	}

}