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
    public class AdminBL
    {
        public SerializeResponse<AdminEntity> AdminOperation(AdminEntity objEntity)
        {
            InsertLog.WriteErrrorLog("AdminBL=>AdminOperation=>Started");
            ConvertDataTable bl = new ConvertDataTable();
            SerializeResponse<AdminEntity> objSerializeResponse = new SerializeResponse<AdminEntity>();

            DataSet ds = new DataSet();
            SqlDataProvider objSDP = new SqlDataProvider();
            string query = "sp_Adminlogin";
            try
            {

                string Con_str = Connection.ConnectionString;
                SqlParameter prm1 = objSDP.CreateInitializedParameter("@flag", DbType.String, objEntity.flag);
                SqlParameter prm2 = objSDP.CreateInitializedParameter("@Admin_Name", DbType.String, objEntity.Admin_Name);
                SqlParameter prm3 = objSDP.CreateInitializedParameter("@Admin_Email", DbType.String, objEntity.Admin_Email);
                SqlParameter prm4 = objSDP.CreateInitializedParameter("@Admin_Address", DbType.String, objEntity.Admin_Address);
                SqlParameter prm5 = objSDP.CreateInitializedParameter("@Admin_Password", DbType.String, objEntity.Admin_Password);
                SqlParameter prm6 = objSDP.CreateInitializedParameter("@Admin_Mobile", DbType.String, objEntity.Admin_Mobile);



                SqlParameter[] Sqlpara = { prm1, prm2, prm3, prm4, prm5, prm6 };

                ds = SqlHelper.ExecuteDataset(Con_str, query, Sqlpara);
                if (objEntity.flag == "login" && ds?.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    objSerializeResponse.Message = Convert.ToString(ds.Tables[0].Rows[0]["Message"]);

                }

                else
                {
                    objSerializeResponse.Message = "500|Flag is Invalid";

                }


            }
            catch (Exception ex)
            {
                objSerializeResponse.Message = "500|Exception Occurred";
                InsertLog.WriteErrrorLog("AdminBL=>AdminOperation=>Exception" + ex.Message + ex.StackTrace);
            }
            return objSerializeResponse;
        }
    }
}
