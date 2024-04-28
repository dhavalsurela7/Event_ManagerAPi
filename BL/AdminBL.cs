﻿using System;
using System.Data;
using System.Data.SqlClient;
using LIBRARY;
using Models;

namespace BL
{
    /// <summary>
    /// Name : Dhaval Surela
    /// Date : 04/04/2024
    /// BL for admin login
    /// </summary>
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
                //Admin login
                if (objEntity.flag == "login" && ds?.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    if (JWT.GenerateToken(objEntity.Admin_Email, "User") != "")
                    {
                        objSerializeResponse.Message = JWT.GenerateToken(objEntity.Admin_Email, "Admin");
                        objSerializeResponse.ID = Convert.ToInt32(ds.Tables[0].Rows[0]["Code"]);

                    }
                    else
                    {
                        objSerializeResponse.Message = "Token not generated";
                        objSerializeResponse.ID = 500;
                    }


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
                InsertLog.WriteErrrorLog("AdminBL=>AdminOperation=>Exception" + ex.Message + ex.StackTrace);
            }
            return objSerializeResponse;
        }
    }
}
