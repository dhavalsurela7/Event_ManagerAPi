using System;
using System.Data;
using System.Data.SqlClient;
using LIBRARY;
using Models;

namespace BL
{
    public class UserBL
    {
        /// <summary>
        /// BL for User Register and Login
        /// </summary>

        public SerializeResponse<UserEntity> UserOperation(UserEntity objEntity)
        {
            InsertLog.WriteErrrorLog("UserBL=>UserOperation=>Started");
            ConvertDataTable bl = new ConvertDataTable();
            SerializeResponse<UserEntity> objSerializeResponse = new SerializeResponse<UserEntity>();

            DataSet ds = new DataSet();
            SqlDataProvider objSDP = new SqlDataProvider();
            string query = "sp_UserOperation";
            try
            {

                string Con_str = Connection.ConnectionString;
                SqlParameter prm1 = objSDP.CreateInitializedParameter("@flag", DbType.String, objEntity.flag);
                SqlParameter prm2 = objSDP.CreateInitializedParameter("@User_Name", DbType.String, objEntity.User_Name);
                SqlParameter prm3 = objSDP.CreateInitializedParameter("@User_Email", DbType.String, objEntity.User_Email);
                SqlParameter prm4 = objSDP.CreateInitializedParameter("@User_Address", DbType.String, objEntity.User_Address);
                SqlParameter prm5 = objSDP.CreateInitializedParameter("@User_Password", DbType.String, objEntity.User_Password);
                SqlParameter prm6 = objSDP.CreateInitializedParameter("@User_Mobile", DbType.String, objEntity.User_Mobile);



                SqlParameter[] Sqlpara = { prm1, prm2, prm3, prm4, prm5, prm6 };

                ds = SqlHelper.ExecuteDataset(Con_str, query, Sqlpara);
                //Register new user
                if (objEntity.flag == "register" && ds?.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {

                    objSerializeResponse.Message = Convert.ToString(ds.Tables[0].Rows[0]["Message"]);
                    objSerializeResponse.ID = Convert.ToInt32(ds.Tables[0].Rows[0]["Code"]);
                }
                //User Login 
                else if (objEntity.flag == "login" && ds?.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    objSerializeResponse.Message = Convert.ToString(ds.Tables[0].Rows[0]["Message"]);
                    objSerializeResponse.ID = Convert.ToInt32(ds.Tables[0].Rows[0]["Code"]);

                }

                else
                {
                    objSerializeResponse.Message = "Flag is Invalid";
                    objSerializeResponse.ID = 500;

                }

            }
            catch (Exception ex)
            {
                objSerializeResponse.Message = "Exception Occurred";
                objSerializeResponse.ID = 500;
                InsertLog.WriteErrrorLog("UserBL=>UserOperation=>Exception" + ex.Message + ex.StackTrace);
            }
            return objSerializeResponse;
        }
    }
}
