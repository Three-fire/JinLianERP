package bp.wf.template;

import bp.da.*;
import bp.en.*;

/** 
 选择接受人
 节点的到人员有两部分组成.	 
 记录了从一个节点到其他的多个节点.
 也记录了到这个节点的其他的节点.
*/
public class SelectAccper extends EntityMyPK
{

		///#region 基本属性
	/** 
	 UI界面上的访问控制
	*/
	@Override
	public UAC getHisUAC()  {
		UAC uac = new UAC();
		uac.OpenAll();
		return uac;
	}
	/** 
	工作ID
	*/
	public final long getWorkID()
	{
		return this.GetValInt64ByKey(SelectAccperAttr.WorkID);
	}
	public final void setWorkID(long value)
	 {
		this.SetValByKey(SelectAccperAttr.WorkID, value);
	}
	/** 
	节点
	*/
	public final int getFK_Node()
	{
		return this.GetValIntByKey(SelectAccperAttr.FK_Node);
	}
	public final void setFK_Node(int value)
	 {
		this.SetValByKey(SelectAccperAttr.FK_Node, value);
	}

	/** 
	 到人员
	*/
	public final String getFK_Emp()
	{
		return this.GetValStringByKey(SelectAccperAttr.FK_Emp);
	}
	public final void setFK_Emp(String value)
	 {
		this.SetValByKey(SelectAccperAttr.FK_Emp, value);
	}
	/** 
	 标记
	*/
	public final String getTag()
	{
		return this.GetValStringByKey(SelectAccperAttr.Tag);
	}
	public final void setTag(String value)
	 {
		this.SetValByKey(SelectAccperAttr.Tag, value);
	}
	/** 
	 人员名称
	*/
	public final String getEmpName()  {
		String s = this.GetValStringByKey(SelectAccperAttr.EmpName);
		if (DataType.IsNullOrEmpty(s) == true)
		{
			s = this.getFK_Emp();
		}
		return s;
	}
	public final void setEmpName(String value)
	 {
		this.SetValByKey(SelectAccperAttr.EmpName, value);
	}
	/** 
	 部门名称
	*/
	public final String getDeptName()
	{
		return this.GetValStringByKey(SelectAccperAttr.DeptName);
	}
	public final void setDeptName(String value)
	 {
		this.SetValByKey(SelectAccperAttr.DeptName, value);
	}
	/** 
	 接收人
	*/
	public final String getRec()
	{
		return this.GetValStringByKey(SelectAccperAttr.Rec);
	}
	public final void setRec(String value)
	 {
		this.SetValByKey(SelectAccperAttr.Rec, value);
	}
	/** 
	 办理意见  信息
	*/
	public final String getInfo()
	{
		return this.GetValStringByKey(SelectAccperAttr.Info);
	}
	public final void setInfo(String value)
	 {
		this.SetValByKey(SelectAccperAttr.Info, value);
	}
	/** 
	 是否记忆
	*/
	public final boolean isRemember()
	{
		return this.GetValBooleanByKey(SelectAccperAttr.IsRemember);
	}
	public final void setRemember(boolean value)
	 {
		this.SetValByKey(SelectAccperAttr.IsRemember, value);
	}
	/** 
	 顺序号
	*/
	public final int getIdx()
	{
		return this.GetValIntByKey(SelectAccperAttr.Idx);
	}
	public final void setIdx(int value)
	 {
		this.SetValByKey(SelectAccperAttr.Idx, value);
	}
	/** 
	  类型(@0=接受人@1=抄送人)
	*/
	public final int getAccType()
	{
		return this.GetValIntByKey(SelectAccperAttr.AccType);
	}
	public final void setAccType(int value)
	 {
		this.SetValByKey(SelectAccperAttr.AccType, value);
	}
	/** 
	 时限
	*/
	public final float getTSpanHour()
	{
		return this.GetValFloatByKey(SelectAccperAttr.TSpanHour);
	}
	public final void setTSpanHour(float value)
	 {
		this.SetValByKey(SelectAccperAttr.TSpanHour, value);
	}

	/** 
	 工作到达日期(计划)
	*/
	public final String getPlanADT()
	{
		return this.GetValStringByKey(SelectAccperAttr.PlanADT);
	}
	public final void setPlanADT(String value)
	 {
		this.SetValByKey(SelectAccperAttr.PlanADT, value);
	}
	/** 
	 工作应完成日期(计划)
	*/
	public final String getPlanSDT()
	{
		return this.GetValStringByKey(SelectAccperAttr.PlanSDT);
	}
	public final void setPlanSDT(String value)
	 {
		this.SetValByKey(SelectAccperAttr.PlanSDT, value);
	}

		///#endregion


		///#region 构造方法
	/** 
	 选择接受人
	*/
	public SelectAccper() {

	}
	public SelectAccper(String mypk)throws Exception
	{
		this.setMyPK(mypk);
		this.Retrieve();
	}
	/** 
	 重写基类方法
	*/
	@Override
	public bp.en.Map getEnMap() {
		if (this.get_enMap() != null)
		{
			return this.get_enMap();
		}

		Map map = new Map("WF_SelectAccper", "选择接受/抄送人信息");
		map.AddMyPK(true);

		map.AddTBInt(SelectAccperAttr.FK_Node, 0, "接受人节点", true, false);

		map.AddTBInt(SelectAccperAttr.WorkID, 0, "WorkID", true, false);
		map.AddTBString(SelectAccperAttr.FK_Emp, null, "FK_Emp", true, false, 0, 50, 10);
		map.AddTBString(SelectAccperAttr.EmpName, null, "EmpName", true, false, 0, 50, 10);
		map.AddTBString(SelectAccperAttr.DeptName, null, "部门名称", true, false, 0, 400, 10);
		map.AddTBInt(SelectAccperAttr.AccType, 0, "类型(@0=接受人@1=抄送人)", true, false);
		map.AddTBString(SelectAccperAttr.Rec, null, "记录人", true, false, 0, 20, 10);
		map.AddTBString(SelectAccperAttr.Info, null, "办理意见信息", true, false, 0, 200, 10);

		map.AddTBInt(SelectAccperAttr.IsRemember, 0, "以后发送是否按本次计算", true, false);
		map.AddTBInt(SelectAccperAttr.Idx, 0, "顺序号(可以用于流程队列审核模式)", true, false);
			/*
			 *  add 2015-1-12.
			 * 为了解决多维度的人员问题.
			 * 在分流点向下发送时, 一个人可以分配两次任务，但是这个任务需要一个维度来区分。
			 * 这个维度，有可能是一个类别，批次。
			 */
		map.AddTBString(SelectAccperAttr.Tag, null, "维度信息Tag", true, false, 0, 200, 10);

		map.AddTBInt(SelectAccperAttr.TimeLimit, 0, "时限-天", true, false);
		map.AddTBFloat(SelectAccperAttr.TSpanHour, 0, "时限-小时", true, false);

			//应该完成日期，为了自动计算未来的日期.
		map.AddTBDateTime(SelectAccperAttr.PlanADT, null, "到达日期(计划)", true, false);
		map.AddTBDateTime(SelectAccperAttr.PlanSDT, null, "应完成日期(计划)", true, false);

		this.set_enMap(map);
		return this.get_enMap();
	}

		///#endregion

	public final String DoUp() throws Exception {
		this.DoOrderUp(SelectAccperAttr.WorkID, this.getWorkID(), SelectAccperAttr.FK_Node, this.getFK_Node(), SelectAccperAttr.Idx);
		return "";
	}
	public final String DoDown() throws Exception {
		this.DoOrderDown(SelectAccperAttr.WorkID, this.getWorkID(), SelectAccperAttr.FK_Node, this.getFK_Node(), SelectAccperAttr.Idx);
		return "";
	}

	@Override
	protected boolean beforeInsert() throws Exception {
		this.ResetPK();

		return super.beforeInsert();
	}

	public final void ResetPK() throws Exception {
		//注释掉了.
		// this.setMyPK(this.FK_Node + "_" + this.WorkID + "_" + this.FK_Emp+"_"+this.Idx;
		this.setMyPK(this.getFK_Node() + "_" + this.getWorkID() + "_" + this.getFK_Emp());
		this.setIdx(DBAccess.RunSQLReturnValInt("SELECT Max(idx) +1 FROM WF_SelectAccper WHERE FK_Node=" + this.getFK_Node() + " AND WorkID=" + this.getWorkID(), 1));
	}
	@Override
	protected boolean beforeUpdateInsertAction() throws Exception {
		if (this.getDeptName().length() == 0)
		{
			boolean isHavePathName = DBAccess.IsExitsTableCol("Port_Dept", "NameOfpath");
			if (isHavePathName == true)
			{
				this.setDeptName(DBAccess.RunSQLReturnStringIsNull("select a.NameOfPath from port_dept a,port_emp b where a.No=b.fk_dept and b.no='" + this.getFK_Emp() + "'", "无"));
				if (this.getDeptName().equals("无"))
				{
					this.setDeptName(DBAccess.RunSQLReturnStringIsNull("select a.name from port_dept a,port_emp b where a.No=b.fk_dept and b.no='" + this.getFK_Emp() + "'", "无"));
				}
			}
			else
			{
				this.setDeptName(DBAccess.RunSQLReturnStringIsNull("select a.name from port_dept a,port_emp b where a.No=b.fk_dept and b.no='" + this.getFK_Emp() + "'", "无"));
			}
		}

		this.ResetPK();
		this.setRec(bp.web.WebUser.getNo());
		return super.beforeUpdateInsertAction();
	}
	//protected override bool beforeUpdateInsertAction()
	//{
	//    this.Rec = bp.web.WebUser.getNo();
	//    return base.beforeUpdateInsertAction();
	//}
}