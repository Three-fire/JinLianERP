package bp.sys.frmui;

import bp.da.*;
import bp.en.*;
import bp.en.Map;
import bp.sys.*;
import bp.*;
import bp.sys.*;
import java.util.*;

/** 
 打印组件
*/
public class MapAttrPrint extends EntityMyPK
{

		///#region 文本字段参数属性.
	/** 
	 表单ID
	*/
	public final String getFK_MapData() throws Exception
	{
		return this.GetValStringByKey(MapAttrAttr.FK_MapData);
	}
	public final void setFKMapData(String value)  throws Exception
	 {
		this.SetValByKey(MapAttrAttr.FK_MapData, value);
	}

	/** 
	 字段
	*/
	public final String getKeyOfEn() throws Exception
	{
		return this.GetValStringByKey(MapAttrAttr.KeyOfEn);
	}
	public final void setKeyOfEn(String value)  throws Exception
	 {
		this.SetValByKey(MapAttrAttr.KeyOfEn, value);
	}
	/** 
	 控件类型
	*/
	public final UIContralType getUIContralType() throws Exception {
		return UIContralType.forValue(this.GetValIntByKey(MapAttrAttr.UIContralType));
	}
	public final void setUIContralType(UIContralType value)  throws Exception
	 {
		this.SetValByKey(MapAttrAttr.UIContralType, value.getValue());
	}

		///#endregion


		///#region 构造方法
	/** 
	 控制权限
	*/
	@Override
	public UAC getHisUAC()  {
		UAC uac = new UAC();
		uac.IsInsert = false;
		uac.IsUpdate = true;
		uac.IsDelete = true;
		return uac;
	}
	/** 
	 实体属性
	*/
	public MapAttrPrint()  {
	}
	/** 
	 实体属性
	*/
	public MapAttrPrint(String mypk)throws Exception
	{
		this.setMyPK(getMyPK());
		this.Retrieve();

	}
	/** 
	 EnMap
	*/
	@Override
	public bp.en.Map getEnMap() {
		if (this.get_enMap() != null)
		{
			return this.get_enMap();
		}

		Map map = new Map("Sys_MapAttr", "公文组件");


			///#region 基本字段信息.
		map.AddTBStringPK(MapAttrAttr.MyPK, null, "主键", false, false, 0, 200, 20);
		map.AddTBString(MapAttrAttr.FK_MapData, null, "表单ID", false, false, 1, 100, 20);

		map.AddTBString(MapAttrAttr.Name, null, "中文名", true, false, 0, 200, 20);
		map.AddTBString(MapAttrAttr.KeyOfEn, null, "字段名", true, true, 1, 200, 20);

		map.AddTBInt(MapAttrAttr.MinLen, 0, "最小长度", false, false);
		map.AddTBInt(MapAttrAttr.MaxLen, 50, "最大长度", false, false);

		map.AddDDLSysEnum(MapAttrAttr.UIIsEnable, 0, "启用类型", true, true, "CtrlEnableType", "@0=禁用(隐藏)@1=启用@2=只读");

		map.AddDDLSysEnum(MapAttrAttr.Tag, 0, "组件类型", true, true, "GovDocType", "@0=RTF模板@1=HTML模板@2=Weboffice组件@3=WPS组件@4=金格组件");

			//map.AddDDLSQL(MapAttrAttr.CSSCtrl, "0", "自定义样式", MapAttrString.SQLOfCSSAttr, true);

			///#endregion 基本字段信息.


			///#region 傻瓜表单
			//单元格数量 2013-07-24 增加
		map.AddDDLSysEnum(MapAttrAttr.ColSpan, 1, "TextBox单元格数量", true, true, "ColSpanAttrDT", "@1=跨1个单元格@2=跨2个单元格@3=跨3个单元格@4=跨4个单元格@5=跨5个单元格@6=跨6个单元格");
		map.SetHelperAlert(MapAttrAttr.ColSpan, "对于傻瓜表单有效: 标识该字段TextBox横跨的宽度,占的单元格数量.");

			//文本占单元格数量
		map.AddDDLSysEnum(MapAttrAttr.LabelColSpan, 1, "Label单元格数量", true, true, "ColSpanAttrString", "@1=跨1个单元格@2=跨2个单元格@3=跨3个单元格@4=跨4个单元格@5=跨6个单元格@6=跨6个单元格");
		map.SetHelperAlert(MapAttrAttr.LabelColSpan, "对于傻瓜表单有效: 标识该字段Lable，标签横跨的宽度,占的单元格数量.");

			//文本跨行.
			// map.AddTBInt(MapAttrAttr.RowSpan, 1, "行数", true, false);
			// map.SetHelperAlert(MapAttrAttr.RowSpan, "对于傻瓜表单有效: 占的单元格row的数量.");

			//显示的分组.
		map.AddDDLSQL(MapAttrAttr.GroupID, 0, "显示的分组", MapAttrString.getSQLOfGroupAttr(), true);

			///#endregion 傻瓜表单

		map.AddMyFile("模板", null, bp.difference.SystemConfig.getPathOfDataUser() + "\\FrmVSTOTemplate");


		RefMethod rm = new RefMethod();
		rm.Title = "rtf模板打印";
		rm.ClassMethodName = this.toString() + ".DoBill";
		rm.Icon = "../../WF/Img/FileType/doc.gif";
		rm.refMethodType = RefMethodType.RightFrameOpen;
		rm.Icon = "icon-printer";
		map.AddRefMethod(rm);

		rm = new RefMethod();
		rm.Title = "帮助";
		rm.ClassMethodName = this.toString() + ".DoHelp";
		rm.Icon = "../../WF/Img/FileType/help.gif";
		rm.refMethodType = RefMethodType.LinkeWinOpen;
		rm.Icon = "icon-printer";
		map.AddRefMethod(rm);

		this.set_enMap(map);
		return this.get_enMap();
	}
	public final String DoHelp() throws Exception {
		return "https://gitee.com/opencc/JFlow/wikis/pages/preview?sort_id=5184749&doc_id=31094";
	}
	/** 
	 单据打印
	 
	 @return 
	*/
	public final String DoBill() throws Exception {
		return "../../Admin/FoolFormDesigner/PrintTemplate/Default.htm?FK_MapData=" + this.getFK_MapData() + "&FrmID=" + this.getFK_MapData() + "&KeyOfEn=" + this.getKeyOfEn();
	}

	@Override
	protected boolean beforeUpdateInsertAction() throws Exception {
		this.setUIContralType(UIContralType.GovDocFile);
		return super.beforeUpdateInsertAction();
	}

	/** 
	 删除
	*/
	@Override
	protected void afterDelete() throws Exception {
		//删除相对应的rpt表中的字段
		if (this.getFK_MapData().contains("ND") == true)
		{
			String fk_mapData = this.getFK_MapData().substring(0, this.getFK_MapData().length() - 2) + "Rpt";
			String sql = "DELETE FROM Sys_MapAttr WHERE FK_MapData='" + fk_mapData + "' AND( KeyOfEn='" + this.getKeyOfEn() + "')";
			DBAccess.RunSQL(sql);
		}

		//调用frmEditAction, 完成其他的操作.
		CCFormAPI.AfterFrmEditAction(this.getFK_MapData());

		super.afterDelete();
	}

	@Override
	protected void afterInsertUpdateAction() throws Exception {
		MapAttr mapAttr = new MapAttr();
		mapAttr.setMyPK(this.getMyPK());
		mapAttr.RetrieveFromDBSources();
		mapAttr.Update();

		//调用frmEditAction, 完成其他的操作.
		CCFormAPI.AfterFrmEditAction(this.getFK_MapData());
		super.afterInsertUpdateAction();
	}

		///#endregion
}