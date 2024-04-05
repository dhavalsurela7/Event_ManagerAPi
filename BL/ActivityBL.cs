using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using LIBRARY;
using Models;

namespace BL
{
    public class ActivityBL
    {
        public SerializeResponse<ActivityEntity> ActivityOperation(ActivityEntity objEntity)
        {
            InsertLog.WriteErrrorLog("ActivityBL=>ActivityOperation=>Started");
            ConvertDataTable bl = new ConvertDataTable();
            SerializeResponse<ActivityEntity> objSerializeResponse = new SerializeResponse<ActivityEntity>();

            DataSet ds = new DataSet();
            SqlDataProvider objSDP = new SqlDataProvider();
            string query = "sp_ActivityOperation";

            try
            {

                string Con_str = Connection.ConnectionString;
                SqlParameter prm1 = objSDP.CreateInitializedParameter("@flag", DbType.String, objEntity.flag);
                SqlParameter prm2 = objSDP.CreateInitializedParameter("@Activity_Name", DbType.String, objEntity.Activity_Name);
                SqlParameter prm3 = objSDP.CreateInitializedParameter("@Activity_Description", DbType.String, objEntity.Activity_Description);
                SqlParameter prm4 = objSDP.CreateInitializedParameter("@Activity_Start_Datetime", DbType.String, objEntity.Activity_Start_Datetime);
                SqlParameter prm5 = objSDP.CreateInitializedParameter("@Activity_End_Datetime", DbType.String, objEntity.Activity_End_Datetime);
                SqlParameter prm6 = objSDP.CreateInitializedParameter("@Activity_Price", DbType.Int64, objEntity.Activity_Price);
                SqlParameter prm7 = objSDP.CreateInitializedParameter("@Event_Name", DbType.String, objEntity.Event_Name);



                SqlParameter[] Sqlpara = { prm1, prm2, prm3, prm4, prm5, prm6, prm7 };

                ds = SqlHelper.ExecuteDataset(Con_str, query, Sqlpara);
                if (objEntity.flag == "INSERT" && ds?.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {

                    objSerializeResponse.Message = Convert.ToString(ds.Tables[0].Rows[0]["Message"]);
                }

                else if (objEntity.flag == "SETPRICE" && ds?.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    objSerializeResponse.Message = Convert.ToString(ds.Tables[0].Rows[0]["Message"]);

                }

                else if (objEntity.flag == "SELECTNAME" && ds?.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {

                    objSerializeResponse.ArrayOfResponse = bl.ListConvertDataTable<ActivityEntity>(ds.Tables[0]);
                    objSerializeResponse.Message = "200|Data Found";


                }

                else if (objEntity.flag == "SELECT" && ds?.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {

                    objSerializeResponse.ArrayOfResponse = bl.ListConvertDataTable<ActivityEntity>(ds.Tables[0]);
                    objSerializeResponse.Message = "200|Data Found";

                }

                else
                {
                    objSerializeResponse.Message = "500|Error Occurred";

                }


            }
            catch (Exception ex)
            {
                objSerializeResponse.Message = "500|Exception Occurred";
                InsertLog.WriteErrrorLog("ActivityBL=>ActivityOperation=>Exception" + ex.Message + ex.StackTrace);
            }
            return objSerializeResponse;
        }
    }
}
